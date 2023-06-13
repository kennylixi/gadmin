package role

import (
	"context"
	"fmt"
	"github.com/gogf/gf/v2/container/gset"
	"github.com/gogf/gf/v2/database/gdb"
	"github.com/gogf/gf/v2/errors/gerror"
	"github.com/gogf/gf/v2/frame/g"
	"github.com/gogf/gf/v2/text/gstr"
	"github.com/kennylixi/gadmin/internal/consts"
	commonModel "github.com/kennylixi/gadmin/internal/modules/common/model"
	commonService "github.com/kennylixi/gadmin/internal/modules/common/service"
	"github.com/kennylixi/gadmin/internal/modules/system/dao"
	"github.com/kennylixi/gadmin/internal/modules/system/model"
	"github.com/kennylixi/gadmin/internal/modules/system/model/do"
	"github.com/kennylixi/gadmin/internal/modules/system/model/entity"
	sysService "github.com/kennylixi/gadmin/internal/modules/system/service"
)

type sRole struct{}

func init() {
	sysService.RegisterRole(New())
}

func New() *sRole {
	return &sRole{}
}

// SelectRoleList 根据条件分页查询角色数据
//	@parma ctx 上下文
//	@param req 查询参数
func (s *sRole) SelectRoleList(ctx context.Context, in *model.RoleListInput) (out *model.RoleListOutput, err error) {
	out = &model.RoleListOutput{}
	out.List, out.Total, err = dao.Role.SelectRoleList(ctx, &entity.Role{
		RoleName: in.RoleName,
		RoleKey:  in.RoleKey,
		Status:   in.Status,
	})
	return
}

// SelectRolesByUserId 根据用户ID查询角色
func (s *sRole) SelectRolesByUserId(ctx context.Context, userId int64) (roles []*model.Role, err error) {
	roles, err = dao.Role.SelectRolePermissionByUserId(ctx, userId)
	return
}

// SelectAllRolesByUserId 根据用户ID查询角色(所有的角色列表，自己拥有的角色使用flag标记)
func (s *sRole) SelectAllRolesByUserId(ctx context.Context, userId int64) (roles []*model.Role, err error) {
	userRoles, err := dao.Role.SelectRolePermissionByUserId(ctx, userId)
	if err != nil {
		return
	}
	roles, err = s.SelectRoleAll(ctx)
	if err != nil {
		return
	}
	userRoleMap := map[int64]*model.Role{}
	for _, userRole := range userRoles {
		userRoleMap[userRole.RoleId] = userRole
	}
	for _, role := range roles {
		_, role.Flag = userRoleMap[role.RoleId]
	}
	return
}

// SelectRolePermissionByUserId 根据用户ID查询权限
//	@param userId 用户ID
//	@return 权限列表
func (s *sRole) SelectRolePermissionByUserId(ctx context.Context, userId int64) ([]string, error) {
	perms, err := dao.Role.SelectRolePermissionByUserId(ctx, userId)
	if err != nil {
		return nil, err
	}
	permsSet := gset.NewStrSet()
	for _, perm := range perms {
		if perm != nil {
			permsSet.Add(gstr.Split(gstr.Trim(perm.RoleKey), ",")...)
		}
	}
	return permsSet.Slice(), nil
}

// SelectRoleAll 查询所有角色
//	@return 角色列表
func (s *sRole) SelectRoleAll(ctx context.Context) ([]*model.Role, error) {
	return dao.Role.SelectRoleAll(ctx)
}

// SelectRoleListByUserId 根据用户ID获取角色选择框列表
//	@param userId 用户ID
//	@return 选中角色ID列表
func (s *sRole) SelectRoleListByUserId(ctx context.Context, userId int64) ([]int64, error) {
	return dao.Role.SelectRoleListByUserId(ctx, userId)
}

// SelectRoleKeyByMenuIds 根据菜单ID获取角色Key
func (s *sRole) SelectRoleKeyByMenuIds(ctx context.Context, menuIds []int64) (roleKeys []string, err error) {
	value, err := dao.Role.Ctx(ctx).As("r").
		FieldsPrefix("r", dao.Role.Columns().RoleKey).
		LeftJoin(dao.RoleMenu.Table(), "rm", fmt.Sprintf("r.%s = rm.%s", dao.Role.Columns().RoleId, dao.RoleMenu.Columns().RoleId)).
		WhereIn(dao.RoleMenu.Columns().MenuId, menuIds).Array()
	if err != nil {
		return
	}
	for _, v := range value {
		roleKeys = append(roleKeys, v.String())
	}
	return
}

// SelectRoleById 通过角色ID查询角色
func (s *sRole) SelectRoleById(ctx context.Context, roleId int64) (*entity.Role, error) {
	role := (*entity.Role)(nil)
	err := dao.Role.Ctx(ctx).Scan(&role, dao.Role.Columns().RoleId, roleId)
	if err != nil {
		g.Log().Error(ctx, err)
		return nil, err
	}
	if role == nil {
		err = gerror.New("数据不存在")
		return nil, nil
	}
	return role, nil
}

// SelectRolesByIds 获取角色列表
func (s *sRole) SelectRolesByIds(ctx context.Context, roleIds []int64) (roles []*entity.Role, err error) {
	err = dao.Role.Ctx(ctx).WhereIn(dao.Role.Columns().RoleId, roleIds).Scan(&roles)
	return
}

// CheckRoleNameUnique 校验角色名称是否唯一
//	@param roleName 角色名
func (s *sRole) CheckRoleNameUnique(ctx context.Context, roleName string, roleId ...int64) (bool, error) {
	var rid int64
	if len(roleId) > 0 {
		rid = roleId[0]
	}
	role, err := dao.Role.CheckRoleNameUnique(ctx, roleName)
	if err != nil {
		return false, err
	}
	return role == nil || role.RoleId == rid, nil
}

// CheckRoleKeyUnique 校验角色权限是否唯一
//	@param roleKey 角色Key
func (s *sRole) CheckRoleKeyUnique(ctx context.Context, roleKey string, roleId ...int64) (bool, error) {
	var rid int64
	if len(roleId) > 0 {
		rid = roleId[0]
	}
	role, err := dao.Role.CheckRoleKeyUnique(ctx, roleKey)
	if err != nil {
		return false, err
	}
	return role == nil || role.RoleId == rid, nil
}

// CheckRoleAllowed 校验角色是否允许操作
//	@param roleId 角色Id
func (s *sRole) CheckRoleAllowed(roleId int64) error {
	if commonModel.IsAdminRole(roleId) {
		return gerror.New("不允许操作超级管理员角色")
	}
	return nil
}

// Add 新增保存角色信息
//	@param role 角色信息
func (s *sRole) Add(ctx context.Context, in *model.RoleAddInput) error {
	isUnique, err := sysService.Role().CheckRoleNameUnique(ctx, in.RoleName)
	if err != nil {
		return err
	}
	if !isUnique {
		err = gerror.New("新增角色'" + in.RoleName + "'失败，角色名称已存在")
		return err
	}
	isUnique, err = sysService.Role().CheckRoleKeyUnique(ctx, in.RoleKey)
	if err != nil {
		return err
	}
	if !isUnique {
		err = gerror.New("新增角色'" + in.RoleKey + "'失败，角色权限已存在")
		return err
	}

	err = dao.Role.Transaction(ctx, func(ctx context.Context, tx gdb.TX) error {
		roleId, err := dao.Role.Add(ctx, &do.Role{
			RoleName:          in.RoleName,
			RoleKey:           in.RoleKey,
			RoleSort:          in.RoleSort,
			MenuCheckStrictly: in.MenuCheckStrictly,
			ApiCheckStrictly:  in.ApiCheckStrictly,
			DeptCheckStrictly: in.DeptCheckStrictly,
			Status:            in.Status,
			CreateBy:          in.CreateBy,
			Remark:            in.Remark,
		}, tx)
		if err != nil {
			return err
		}
		if err = s.insertRoleMenu(ctx, roleId, in.MenuIds, tx); err != nil {
			return err
		}
		var apiIds []int64
		for _, apiId := range in.ApiIds {
			if apiId > 0 {
				apiIds = append(apiIds, apiId)
			}
		}
		if err = s.insertRoleApi(ctx, roleId, apiIds, tx); err != nil {
			return err
		}
		var rules [][]string
		rulesSet := gset.NewStrSet()
		casbin := sysService.Casbin().Casbin(ctx)
		// 菜单接口
		apis, err := sysService.Api().SelectApiListByMenuIds(ctx, in.MenuIds)
		if err != nil {
			return err
		}
		for _, api := range apis {
			key := fmt.Sprintf("%s:%s", api.ApiMethod, api.ApiUrl)
			// 过滤掉重复的
			if !rulesSet.ContainsI(key) {
				rules = append(rules, []string{fmt.Sprintf("r:%s", in.RoleKey), api.ApiUrl, api.ApiMethod})
				rulesSet.Add(key)
			}
		}
		// 接口授权
		apis, err = sysService.Api().SelectByIds(ctx, apiIds)
		if err != nil {
			return err
		}
		for _, api := range apis {
			key := fmt.Sprintf("%s:%s", api.ApiMethod, api.ApiUrl)
			// 过滤掉重复的
			if !rulesSet.ContainsI(key) {
				rules = append(rules, []string{fmt.Sprintf("r:%s", in.RoleKey), api.ApiUrl, api.ApiMethod})
				rulesSet.Add(key)
			}
		}

		if len(rules) > 0 {
			if _, err = casbin.AddPolicies(rules); err != nil {
				return err
			}
		}
		return nil
	})
	if err != nil {
		g.Log().Error(ctx, err)
		return err
	}
	return nil
}

// Edit 修改角色信息
func (s *sRole) Edit(ctx context.Context, in *model.RoleEditInput) error {
	err := sysService.Role().CheckRoleAllowed(in.RoleId)
	if err != nil {
		return err
	}
	isUnique, err := sysService.Role().CheckRoleNameUnique(ctx, in.RoleName, in.RoleId)
	if err != nil {
		return err
	}
	if !isUnique {
		err = gerror.New("修改角色'" + in.RoleName + "'失败，角色名称已存在")
		return err
	}
	isUnique, err = sysService.Role().CheckRoleKeyUnique(ctx, in.RoleKey, in.RoleId)
	if err != nil {
		return err
	}
	if !isUnique {
		err = gerror.New("修改角色'" + in.RoleKey + "'失败，角色权限已存在")
		return err
	}

	err = dao.Role.Transaction(ctx, func(ctx context.Context, tx gdb.TX) error {
		var err error
		// 修改角色信息
		if err = dao.Role.Edit(ctx, &do.Role{
			RoleId:            in.RoleId,
			RoleName:          in.RoleName,
			RoleKey:           in.RoleKey,
			RoleSort:          in.RoleSort,
			MenuCheckStrictly: in.MenuCheckStrictly,
			ApiCheckStrictly:  in.ApiCheckStrictly,
			DeptCheckStrictly: in.DeptCheckStrictly,
			Status:            in.Status,
			UpdateBy:          in.UpdateBy,
			Remark:            in.Remark,
		}, tx); err != nil {
			return err
		}
		// 删除角色与菜单关联
		if _, err = dao.RoleMenu.Ctx(ctx).TX(tx).Delete(dao.RoleMenu.Columns().RoleId, in.RoleId); err != nil {
			return err
		}
		if _, err = dao.RoleApi.Ctx(ctx).TX(tx).Delete(dao.RoleApi.Columns().RoleId, in.RoleId); err != nil {
			return err
		}

		if err = s.insertRoleMenu(ctx, in.RoleId, in.MenuIds, tx); err != nil {
			return err
		}
		var apiIds []int64
		for _, apiId := range in.ApiIds {
			if apiId > 0 {
				apiIds = append(apiIds, apiId)
			}
		}
		if err = s.insertRoleApi(ctx, in.RoleId, apiIds, tx); err != nil {
			return err
		}

		casbin := sysService.Casbin().Casbin(ctx)
		// 先删除该角色授权
		_, err = casbin.RemoveFilteredPolicy(0, fmt.Sprintf("r:%s", in.RoleKey))
		if err != nil {
			return err
		}

		var rules [][]string
		rulesSet := gset.NewStrSet()
		// 菜单接口
		apis, err := sysService.Api().SelectApiListByMenuIds(ctx, in.MenuIds)
		if err != nil {
			return err
		}
		for _, api := range apis {
			key := fmt.Sprintf("%s:%s", api.ApiMethod, api.ApiUrl)
			// 过滤掉重复的
			if !rulesSet.ContainsI(key) {
				rules = append(rules, []string{fmt.Sprintf("r:%s", in.RoleKey), api.ApiUrl, api.ApiMethod})
				rulesSet.Add(key)
			}
		}
		// 接口授权
		apis, err = sysService.Api().SelectByIds(ctx, apiIds)
		if err != nil {
			return err
		}
		for _, api := range apis {
			key := fmt.Sprintf("%s:%s", api.ApiMethod, api.ApiUrl)
			// 过滤掉重复的
			if !rulesSet.ContainsI(key) {
				rules = append(rules, []string{fmt.Sprintf("r:%s", in.RoleKey), api.ApiUrl, api.ApiMethod})
				rulesSet.Add(key)
			}
		}

		if len(rules) > 0 {
			if _, err = casbin.AddPolicies(rules); err != nil {
				return err
			}
		}

		return nil
	})
	if err != nil {
		g.Log().Error(ctx, err)
		return err
	}
	return nil
}

// UpdateRoleStatus 修改角色状态
//	@param roleId 角色ID
//	@param status 状态
func (s *sRole) UpdateRoleStatus(ctx context.Context, roleId int64, status string) (err error) {
	role, err := s.SelectRoleById(ctx, roleId)
	if err != nil {
		return err
	}

	err = dao.Role.Transaction(ctx, func(ctx context.Context, tx gdb.TX) error {
		_, err = dao.Role.Ctx(ctx).TX(tx).Update(&do.Role{
			Status:   status,
			UpdateBy: commonService.BizCtx().GetUserName(ctx),
		}, dao.Role.Columns().RoleId, roleId)
		if err != nil {
			return err
		}

		casbin := sysService.Casbin().Casbin(ctx)
		if status == consts.Normal {
			// 更新授权
			menuIds, err := sysService.Menu().SelectMenuListByRoleId(ctx, roleId)
			if err != nil {
				return err
			}
			apis, err := sysService.Api().SelectApiListByMenuIds(ctx, menuIds)
			if err != nil {
				return err
			}
			var rules [][]string
			rulesSet := gset.NewStrSet()
			for _, api := range apis {
				key := fmt.Sprintf("%s:%s", api.ApiMethod, api.ApiUrl)
				// 过滤掉重复的
				if !rulesSet.ContainsI(key) {
					rules = append(rules, []string{fmt.Sprintf("r:%s", role.RoleKey), api.ApiUrl, api.ApiMethod})
					rulesSet.Add(key)
				}
			}
			if _, err = casbin.AddPolicies(rules); err != nil {
				return err
			}
		} else {
			// 删除该角色授权
			_, err = casbin.RemoveFilteredPolicy(0, fmt.Sprintf("r:%s", role.RoleKey))
			if err != nil {
				return err
			}
		}
		return nil
	})
	return
}

// AuthDataScope 修改数据权限信息
//	@param role 角色信息
func (s *sRole) AuthDataScope(ctx context.Context, roleId int64, deptIds []int64, dataScope int) error {
	err := dao.Role.Transaction(ctx, func(ctx context.Context, tx gdb.TX) error {
		var err error
		// 更新数据权限
		if err = dao.Role.UpdateDataScope(ctx, roleId, dataScope, tx); err != nil {
			return err
		}
		// 删除角色与部门关联
		if _, err = dao.RoleDept.Ctx(ctx).TX(tx).Delete(dao.RoleDept.Columns().RoleId, roleId); err != nil {
			return err
		}
		// 新增角色和部门信息（数据权限）
		if err = s.insertRoleDept(ctx, roleId, deptIds, tx); err != nil {
			return err
		}
		return nil
	})
	if err != nil {
		g.Log().Error(ctx, err)
		return err
	}
	return nil
}

// 新增角色菜单信息
//	@param roleId 	角色Id
//	@param menuIds	菜单集合
//	@param tx		事务管理
func (s *sRole) insertRoleMenu(ctx context.Context, roleId int64, menuIds []int64, tx gdb.TX) error {
	menus := make([]*entity.RoleMenu, 0, len(menuIds))
	for _, menuId := range menuIds {
		menus = append(menus, &entity.RoleMenu{
			RoleId: roleId,
			MenuId: menuId,
		})
	}
	if len(menus) == 0 {
		return nil
	}
	_, err := dao.RoleMenu.Ctx(ctx).TX(tx).Insert(menus)
	return err
}

// 新增角色接口信息
//	@param roleId 	角色Id
//	@param apiIds	菜单集合
//	@param tx		事务管理
func (s *sRole) insertRoleApi(ctx context.Context, roleId int64, apiIds []int64, tx gdb.TX) error {
	apiList := make([]*entity.RoleApi, 0, len(apiIds))
	for _, apiId := range apiIds {
		if apiId > 0 {
			apiList = append(apiList, &entity.RoleApi{
				RoleId: roleId,
				ApiId:  apiId,
			})
		}
	}
	if len(apiList) == 0 {
		return nil
	}
	_, err := dao.RoleApi.Ctx(ctx).TX(tx).Insert(apiList)
	return err
}

// 新增角色部门信息(数据权限)
//	@param roleId 	角色Id
//	@param deptIds	部门集合
//	@param tx		事务管理
func (s *sRole) insertRoleDept(ctx context.Context, roleId int64, deptIds []int64, tx gdb.TX) error {
	depts := make([]*entity.RoleDept, 0, len(deptIds))
	for _, deptId := range deptIds {
		depts = append(depts, &entity.RoleDept{
			RoleId: roleId,
			DeptId: deptId,
		})
	}
	if len(depts) == 0 {
		return nil
	}
	_, err := dao.RoleDept.Ctx(ctx).TX(tx).Insert(depts)
	return err
}

// DeleteByIds 批量删除角色信息
//	@param roleIds 需要删除的角色ID
func (s *sRole) DeleteByIds(ctx context.Context, roleIds []int64) (err error) {
	roleKeys := make([]string, 0, len(roleIds))
	for _, roleId := range roleIds {
		if err = s.CheckRoleAllowed(roleId); err != nil {
			return
		}

		var (
			role  *entity.Role
			count int
		)

		if role, err = s.SelectRoleById(ctx, roleId); err != nil {
			return
		}

		if count, err = dao.Role.CountUserRoleByRoleId(ctx, roleId); err != nil {
			return
		}
		if count > 0 {
			return gerror.Newf("%s已分配,不能删除", role.RoleName)
		}
		roleKeys = append(roleKeys, role.RoleKey)
	}

	casbin := sysService.Casbin().Casbin(ctx)
	err = dao.RoleMenu.Transaction(ctx, func(ctx context.Context, tx gdb.TX) error {
		var err error
		if _, err = dao.RoleMenu.Ctx(ctx).TX(tx).Delete(dao.RoleMenu.Columns().RoleId, roleIds); err != nil {
			return err
		}
		if _, err = dao.RoleApi.Ctx(ctx).TX(tx).Delete(dao.RoleApi.Columns().RoleId, roleIds); err != nil {
			return err
		}
		if _, err = dao.RoleDept.Ctx(ctx).TX(tx).Delete(dao.RoleDept.Columns().RoleId, roleIds); err != nil {
			return err
		}
		if _, err = dao.Role.Ctx(ctx).TX(tx).Delete(dao.Role.Columns().RoleId, roleIds); err != nil {
			return err
		}
		for _, roleKey := range roleKeys {
			// 删除该角色授权
			if _, err = casbin.RemoveFilteredPolicy(0, fmt.Sprintf("r:%s", roleKey)); err != nil {
				return err
			}
		}
		return nil
	})
	return
}

// DeleteAuthUser 取消授权用户角色
// 	@param roleId 角色ID
// 	@param userId 需要取消授权的用户数据ID
func (s *sRole) DeleteAuthUser(ctx context.Context, roleId int64, userId int64) (err error) {
	role, err := s.SelectRoleById(ctx, roleId)
	if err != nil {
		return
	}
	user, err := sysService.User().SelectUserById(ctx, userId)
	if err != nil {
		return err
	}
	casbin := sysService.Casbin().Casbin(ctx)
	_, _ = casbin.RemoveGroupingPolicy(user.UserName, fmt.Sprintf("r:%s", role.RoleKey))

	err = dao.UserRole.DeleteUserRoleInfo(ctx, roleId, userId)
	return
}

// DeleteAuthUsers 批量取消授权用户角色
// 	@param roleId 角色ID
// 	@param userIds 需要取消授权的用户数据ID
func (s *sRole) DeleteAuthUsers(ctx context.Context, roleId int64, userIds []int64) (err error) {
	if g.IsEmpty(userIds) {
		return
	}

	role, err := s.SelectRoleById(ctx, roleId)
	if err != nil {
		return
	}
	var rules [][]string
	for _, userId := range userIds {
		user, err := sysService.User().SelectUserById(ctx, userId)
		if err != nil {
			return err
		}
		rules = append(rules, []string{user.UserName, fmt.Sprintf("r:%s", role.RoleKey)})
	}
	casbin := sysService.Casbin().Casbin(ctx)
	_, _ = casbin.RemoveGroupingPolicies(rules)

	err = dao.UserRole.DeleteUserRoleInfos(ctx, roleId, userIds)
	return
}

// InsertAuthUsers 批量选择授权用户角色
// 	@param roleId 角色ID
// 	@param userIds 需要取消授权的用户数据ID
func (s *sRole) InsertAuthUsers(ctx context.Context, roleId int64, userIds []int64) (err error) {
	if len(userIds) <= 0 {
		return
	}

	role, err := s.SelectRoleById(ctx, roleId)
	if err != nil {
		return
	}

	casbin := sysService.Casbin().Casbin(ctx)
	urList := make([]*entity.UserRole, 0, len(userIds))
	var rules [][]string
	for _, userId := range userIds {
		urList = append(urList, &entity.UserRole{
			UserId: userId,
			RoleId: roleId,
		})
		user, err := sysService.User().SelectUserById(ctx, userId)
		if err != nil {
			return err
		}
		rules = append(rules, []string{user.UserName, fmt.Sprintf("r:%s", role.RoleKey)})
	}
	_, _ = casbin.AddGroupingPolicies(rules)

	_, err = dao.UserRole.Ctx(ctx).Insert(urList)
	return
}
