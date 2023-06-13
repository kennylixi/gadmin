package dept

import (
	"context"
	"fmt"
	"github.com/gogf/gf/v2/database/gdb"
	"github.com/gogf/gf/v2/errors/gerror"
	"github.com/gogf/gf/v2/frame/g"
	"github.com/gogf/gf/v2/text/gstr"
	"github.com/kennylixi/gadmin/internal/consts/user_consts"
	commonModel "github.com/kennylixi/gadmin/internal/modules/common/model"
	commonService "github.com/kennylixi/gadmin/internal/modules/common/service"
	"github.com/kennylixi/gadmin/internal/modules/system/dao"
	systemModel "github.com/kennylixi/gadmin/internal/modules/system/model"
	"github.com/kennylixi/gadmin/internal/modules/system/model/do"
	"github.com/kennylixi/gadmin/internal/modules/system/model/entity"
	"github.com/kennylixi/gadmin/internal/modules/system/service"
)

type sDept struct{}

func init() {
	service.RegisterDept(New())
}

func New() *sDept {
	return &sDept{}
}

// List 查询部门管理数据
func (s *sDept) List(ctx context.Context, req *systemModel.DeptListInput) (depts []*entity.Dept, err error) {
	m := dao.Dept.Ctx(ctx).Fields(entity.Dept{})
	deptColumns := dao.Dept.Columns()
	if len(req.Status) > 0 {
		m = m.Where(deptColumns.Status, req.Status)
	}
	if len(req.DeptName) > 0 {
		m = m.WhereLike(deptColumns.DeptName, "%"+req.DeptName+"%")
	}
	if req.DeptId != 0 {
		m = m.Where(deptColumns.DeptId, req.DeptId)
	}
	if req.ParentId != 0 {
		m = m.Where(deptColumns.ParentId, req.ParentId)
	}
	//TODO 添加dataScope的判断
	err = m.OrderDesc(deptColumns.ParentId).Order(deptColumns.OrderNum).Scan(&depts)
	return
}

// SelectDeptById 根据部门编号获取详细信息
func (s *sDept) SelectDeptById(ctx context.Context, deptId int64) (dept *entity.Dept, err error) {
	err = dao.Dept.Ctx(ctx).WherePri(deptId).Scan(&dept)
	return
}

// SelectDeptTreeList 查询部门树结构信息
func (s *sDept) SelectDeptTreeList(ctx context.Context, dept *systemModel.DeptSelectDeptTreeListInput) (depts []*commonModel.TreeSelect, err error) {
	out, err := s.List(ctx, &systemModel.DeptListInput{})
	if err != nil {
		return
	}
	depts = s.BuildDeptTreeSelect(ctx, out)
	return
}

// BuildDeptTreeSelect 将部门列表构建树
func (s *sDept) BuildDeptTreeSelect(ctx context.Context, depts []*entity.Dept) []*commonModel.TreeSelect {
	deptIdMap := make(map[int64]int64)
	for _, dept := range depts {
		deptIdMap[dept.DeptId] = dept.DeptId
	}

	returnList := make([]*commonModel.TreeSelect, 0, len(depts))
	for _, dept := range depts {
		// 如果是顶级节点, 遍历该父节点的所有子节点
		if _, ok := deptIdMap[dept.ParentId]; !ok {
			returnList = append(returnList, s.recursionFn(depts, dept))
		}
	}

	return returnList
}

// 递归组装树
func (s *sDept) recursionFn(depts []*entity.Dept, dept *entity.Dept) *commonModel.TreeSelect {
	treeItem := &commonModel.TreeSelect{
		Id:    dept.DeptId,
		Label: dept.DeptName,
	}
	for _, item := range depts {
		if item.ParentId == dept.DeptId {
			if treeItem.Children == nil {
				treeItem.Children = make([]*commonModel.TreeSelect, 0, len(depts))
			}
			treeItem.Children = append(treeItem.Children, s.recursionFn(depts, item))
		}
	}
	return treeItem
}

// SelectDeptListByRoleId 根据角色ID查询部门树信息
func (s *sDept) SelectDeptListByRoleId(ctx context.Context, roleId int64) ([]int64, error) {
	role, err := service.Role().SelectRoleById(ctx, roleId)
	if err != nil {
		return nil, err
	}
	m := dao.Dept.Ctx(ctx).As("d").Fields("d." + dao.Dept.Columns().DeptId)
	m = m.
		LeftJoin(dao.RoleDept.Table(), "rd", fmt.Sprintf("d.%s = rd.%s", dao.Dept.Columns().DeptId, dao.RoleDept.Columns().DeptId)).
		Where(fmt.Sprintf("rd.%s", dao.RoleDept.Columns().RoleId), roleId)
	if role.DeptCheckStrictly != 0 {
		where := fmt.Sprintf("d.%s not in (select d.%s from %s d inner join %s rd on d.%s = rd.%s and rd.role_id = %d)",
			dao.Dept.Columns().DeptId,
			dao.Dept.Columns().ParentId,
			dao.Dept.Table(),
			dao.RoleDept.Table(),
			dao.Dept.Columns().DeptId,
			dao.RoleDept.Columns().DeptId,
			roleId)
		m = m.Where(where)
	}
	values, err := m.Order(dao.Dept.Columns().ParentId + "," + dao.Dept.Columns().OrderNum).Array()
	if err != nil {
		return nil, err
	}
	deptIds := make([]int64, 0, len(values))
	for _, value := range values {
		deptIds = append(deptIds, value.Int64())
	}

	return deptIds, nil
}

// Add 新增部门
func (s *sDept) Add(ctx context.Context, in *systemModel.DeptAddInput) (int64, error) {
	// 检测是否重名
	unique, err := s.CheckDeptNameUnique(ctx, in.ParentId, in.DeptName)
	if err != nil {
		return 0, err
	}
	if !unique {
		return 0, gerror.New("新增部门'" + in.DeptName + "'失败，部门名称已存在")
	}

	// 检测上级部门状态
	pDept, err := s.SelectDeptById(ctx, in.ParentId)
	if err != nil {
		return 0, err
	}
	if user_consts.DeptNormal != pDept.Status {
		return 0, gerror.New("部门停用，不允许新增")
	}

	return dao.Dept.Ctx(ctx).InsertAndGetId(&do.Dept{
		ParentId:  in.ParentId,
		Ancestors: fmt.Sprintf("%s,%d", pDept.Ancestors, in.ParentId),
		DeptName:  in.DeptName,
		OrderNum:  in.OrderNum,
		Leader:    in.Leader,
		Phone:     in.Phone,
		Email:     in.Email,
		Status:    in.Status,
		CreateBy:  in.CreateBy,
	})
}

// Edit 修改保存部门信息
func (s *sDept) Edit(ctx context.Context, in *systemModel.DeptEditInput) error {
	// 检测是否重名
	unique, err := s.CheckDeptNameUnique(ctx, in.ParentId, in.DeptName, in.DeptId)
	if err != nil {
		return err
	}
	if !unique {
		return gerror.New("修改部门'" + in.DeptName + "'失败，部门名称已存在")
	}
	if in.DeptId == in.ParentId {
		return gerror.New("修改部门'" + in.DeptName + "'失败，上级部门不能是自己")
	}

	// 如果禁用部门判断是不是还有子部门为正常状态
	count, err := dao.Dept.Ctx(ctx).Where(dao.Dept.Columns().Status, user_consts.DeptNormal).Where("find_in_set(?, ancestors)", in.DeptId).Count()
	if err != nil {
		return err
	}
	if user_consts.DeptDisable == in.Status && count > 0 {
		return gerror.New("该部门包含未停用的子部门！")
	}

	newParentDept, err := s.SelectDeptById(ctx, in.ParentId)
	if err != nil {
		return err
	}
	dept, err := s.SelectDeptById(ctx, in.DeptId)
	if err != nil {
		return err
	}
	err = dao.Dept.Transaction(ctx, func(ctx context.Context, tx gdb.TX) error {
		if newParentDept != nil && dept != nil {
			newAncestors := fmt.Sprintf("%s,%d", newParentDept.Ancestors, newParentDept.DeptId)
			oldAncestors := dept.Ancestors
			dept.Ancestors = newAncestors
			s.UpdateDeptChildren(ctx, dept.DeptId, newAncestors, oldAncestors, tx)
		}

		dept.UpdateBy = commonService.BizCtx().GetUserName(ctx)
		if _, err = dao.Dept.Ctx(ctx).TX(tx).WherePri(dept.DeptId).Update(&do.Dept{
			DeptId:   in.DeptId,
			ParentId: in.ParentId,
			DeptName: in.DeptName,
			OrderNum: in.OrderNum,
			Leader:   in.Leader,
			Phone:    in.Phone,
			Email:    in.Email,
			Status:   in.Status,
			UpdateBy: in.UpdateBy,
		}); err != nil {
			return err
		}
		if user_consts.DeptNormal == dept.Status {
			// 如果该部门是启用状态，则启用该部门的所有上级部门
			_, err = dao.Dept.Ctx(ctx).TX(tx).Data(do.Dept{
				Status:   dept.Status,
				UpdateBy: dept.UpdateBy,
			}).WhereIn(dao.Dept.Columns().DeptId, dept.Ancestors).Update()
			if err != nil {
				return err
			}
		}
		return nil
	})

	return err
}

// Delete 删除部门
func (s *sDept) Delete(ctx context.Context, deptId int64) error {
	hasChild, err := s.HasChildByDeptId(ctx, deptId)
	if err != nil {
		return err
	}
	if hasChild {
		return gerror.New("存在下级部门,不允许删除")
	}

	hasUser, err := s.CheckDeptExistUser(ctx, deptId)
	if err != nil {
		return err
	}
	if hasUser {
		return gerror.New("存在下级部门,不允许删除")
	}

	_, err = dao.Dept.Ctx(ctx).Where(dao.Dept.Columns().DeptId, deptId).Delete()
	return err
}

// HasChildByDeptId 是否存在部门子节点
func (s *sDept) HasChildByDeptId(ctx context.Context, deptId int64) (bool, error) {
	result, err := dao.Dept.Ctx(ctx).Count(dao.Dept.Columns().ParentId, deptId)
	return result > 0, err
}

// CheckDeptExistUser 查询部门是否存在用户
func (s *sDept) CheckDeptExistUser(ctx context.Context, deptId int64) (bool, error) {
	result, err := dao.User.Ctx(ctx).Count(dao.User.Columns().DeptId, deptId)
	return result > 0, err
}

// CheckDeptNameUnique 校验指定部门下面的部门名称是否唯一
// @param parentId  上级部门ID
// @param deptName  部门名字
// @param deptId	部门ID
// @return true 名字唯一， false 名字已经存在
func (s *sDept) CheckDeptNameUnique(ctx context.Context, parentId int64, deptName string, deptId ...int64) (bool, error) {
	did := int64(-1)
	if len(deptId) > 0 {
		did = deptId[0]
	}
	dept := (*entity.Dept)(nil)
	err := dao.Dept.Ctx(ctx).Where(dao.Dept.Columns().ParentId, parentId).Scan(&dept, dao.Dept.Columns().DeptName, deptName)
	if err != nil {
		return false, err
	}
	if dept != nil && dept.DeptId != did {
		return false, nil
	}
	return true, nil
}

// CheckDeptDataScope 校验部门是否有数据权限
//	@param deptId 部门id
func (s *sDept) CheckDeptDataScope(ctx context.Context, deptId int64) error {
	if !commonModel.IsAdmin(commonService.BizCtx().GetUserId(ctx)) {
		dept := &systemModel.DeptListInput{}
		dept.DeptId = deptId
		out, err := s.List(ctx, dept)
		if err != nil {
			g.Log().Error(ctx, "获取部门列表失败", err)
			return gerror.New("获取部门数据失败")
		}
		if g.IsNil(out) || g.IsEmpty(out) {
			return gerror.New("没有权限访问部门数据！")
		}
	}
	return nil
}

// UpdateDeptChildren 修改子元素关系
// @param deptId 被修改的部门ID
// @param newAncestors 新的父ID集合
// @param oldAncestors 旧的父ID集合
func (s *sDept) UpdateDeptChildren(ctx context.Context, deptId int64, newAncestors, oldAncestors string, tx gdb.TX) error {
	children := ([]*entity.Dept)(nil)
	err := dao.Dept.Ctx(ctx).TX(tx).Where("find_in_set(?, ancestors)", deptId).Scan(&children)
	if err != nil {
		return err
	}

	setParams := " case " + dao.Dept.Columns().DeptId + " "
	deptIds := make([]int64, len(children))
	for _, child := range children {
		child.Ancestors = gstr.Replace(child.Ancestors, oldAncestors, newAncestors)
		deptIds = append(deptIds, child.DeptId)
		setParams += fmt.Sprintf(" when %d then %s ", child.DeptId, child.Ancestors)
	}
	setParams += " end "

	if len(children) > 0 {
		_, err := dao.Dept.Ctx(ctx).TX(tx).Data(dao.Dept.Columns().Ancestors, setParams).Where(dao.Dept.Columns().DeptId, deptId).Update()
		if err != nil {
			return err
		}
	}
	return nil
}
