package admin

import (
	"context"
	"github.com/gogf/gf/v2/frame/g"
	commonService "github.com/kennylixi/gadmin/internal/modules/common/service"
	"github.com/kennylixi/gadmin/internal/modules/system/api/v1/admin"
	"github.com/kennylixi/gadmin/internal/modules/system/model"
	sysService "github.com/kennylixi/gadmin/internal/modules/system/service"
	"github.com/kennylixi/gadmin/utility/poi"
)

// Role 角色管理
var Role = cRole{}

type cRole struct{}

// List 获取角色列表
func (c *cRole) List(ctx context.Context, req *admin.RoleListReq) (res *admin.RoleListRes, err error) {
	res = &admin.RoleListRes{}
	out, err := sysService.Role().SelectRoleList(ctx, &model.RoleListInput{
		RoleName: req.RoleName,
		RoleKey:  req.RoleKey,
		Status:   req.Status,
	})
	if err != nil {
		return
	}
	res.List = out.List
	res.Total = out.Total
	return
}

// Export 导出
func (c *cRole) Export(ctx context.Context, req *admin.RoleExportReq) (res *admin.RoleExportRes, err error) {
	commonService.BizCtx().SetNoPage(ctx)
	out, err := sysService.Role().SelectRoleList(ctx, &model.RoleListInput{
		RoleName: req.RoleName,
		RoleKey:  req.RoleKey,
		Status:   req.Status,
	})
	if err != nil {
		return
	}
	e, err := poi.NewExcel(ctx, (*model.RoleListItem)(nil))
	if err != nil {
		return
	}
	err = e.ExportExcel(g.NewVar(out.List).Maps(), "角色管理", "")
	return
}

// GetInfo 根据角色编号获取详细信息
func (c *cRole) GetInfo(ctx context.Context, req *admin.RoleGetInfoReq) (res *admin.RoleGetInfoRes, err error) {
	res = &admin.RoleGetInfoRes{}
	res.Role, err = sysService.Role().SelectRoleById(ctx, req.RoleId)
	return
}

// Add 新增角色
func (c *cRole) Add(ctx context.Context, req *admin.RoleAddReq) (res *admin.RoleAddRes, err error) {
	role := &model.RoleAddInput{
		RoleName:          req.RoleName,
		RoleKey:           req.RoleKey,
		RoleSort:          req.RoleSort,
		MenuCheckStrictly: req.MenuCheckStrictly,
		ApiCheckStrictly:  req.ApiCheckStrictly,
		DeptCheckStrictly: req.DeptCheckStrictly,
		Status:            req.Status,
		Remark:            req.Remark,
		CreateBy:          commonService.BizCtx().GetUserName(ctx),
		MenuIds:           req.MenuIds,
		ApiIds:            req.ApiIds,
	}
	err = sysService.Role().Add(ctx, role)
	return
}

// Edit 修改保存角色
func (c *cRole) Edit(ctx context.Context, req *admin.RoleEditReq) (res *admin.RoleEditRes, err error) {
	role := &model.RoleEditInput{
		RoleId:            req.RoleId,
		RoleName:          req.RoleName,
		RoleKey:           req.RoleKey,
		RoleSort:          req.RoleSort,
		MenuCheckStrictly: req.MenuCheckStrictly,
		ApiCheckStrictly:  req.ApiCheckStrictly,
		DeptCheckStrictly: req.DeptCheckStrictly,
		Status:            req.Status,
		Remark:            req.Remark,
		UpdateBy:          commonService.BizCtx().GetUserName(ctx),
		MenuIds:           req.MenuIds,
		ApiIds:            req.ApiIds,
	}
	err = sysService.Role().Edit(ctx, role)
	return
}

// DataScope 修改保存数据权限
func (c *cRole) DataScope(ctx context.Context, req *admin.RoleDataScopeReq) (res *admin.RoleDataScopeRes, err error) {
	err = sysService.Role().CheckRoleAllowed(req.RoleId)
	if err != nil {
		return
	}
	err = sysService.Role().AuthDataScope(ctx, req.RoleId, req.DeptIds, req.DataScope)
	return
}

// ChangeStatus 状态修改
func (c *cRole) ChangeStatus(ctx context.Context, req *admin.RoleChangeStatusReq) (res *admin.RoleChangeStatusRes, err error) {
	err = sysService.Role().CheckRoleAllowed(req.RoleId)
	if err != nil {
		return
	}

	err = sysService.Role().UpdateRoleStatus(ctx, req.RoleId, req.Status)
	return
}

// Delete 删除角色
func (c *cRole) Delete(ctx context.Context, req *admin.RoleDeleteReq) (res *admin.RoleDeleteRes, err error) {
	err = sysService.Role().DeleteByIds(ctx, req.RoleIds)
	return
}

// Optionselect 获取角色选择框列表
func (c *cRole) Optionselect(ctx context.Context, req *admin.RoleOptionselectReq) (res admin.RoleOptionselectRes, err error) {
	res, err = sysService.Role().SelectRoleAll(ctx)
	return
}

// DeptTree 获取对应角色部门树列表
func (c *cRole) DeptTree(ctx context.Context, req *admin.RoleDeptTreeReq) (res *admin.RoleDeptTreeRes, err error) {
	checkedKeys, err := sysService.Dept().SelectDeptListByRoleId(ctx, req.RoleId)
	if err != nil {
		return
	}
	depts, err := sysService.Dept().SelectDeptTreeList(ctx, &model.DeptSelectDeptTreeListInput{})
	if err != nil {
		return
	}
	res = &admin.RoleDeptTreeRes{
		CheckedKeys: checkedKeys,
		Depts:       depts,
	}
	return
}

// AllocatedList 查询已分配用户角色列表
func (c *cRole) AllocatedList(ctx context.Context, req *admin.RoleAllocatedListReq) (res *admin.RoleAllocatedListRes, err error) {
	out, err := sysService.User().SelectAllocatedList(ctx, &model.UserSelectAllocatedListInput{
		RoleId:      req.RoleId,
		UserName:    req.UserName,
		Phonenumber: req.Phonenumber,
	})
	if err != nil {
		return
	}
	res = &admin.RoleAllocatedListRes{
		List:  out.List,
		Total: out.Total,
	}
	return
}

// UnallocatedList 查询未分配用户角色列表
func (c *cRole) UnallocatedList(ctx context.Context, req *admin.RoleUnallocatedListReq) (res *admin.RoleUnallocatedListRes, err error) {
	out, err := sysService.User().SelectUnallocatedList(ctx, &model.UserSelectUnallocatedListInput{
		RoleId:      req.RoleId,
		UserName:    req.UserName,
		Phonenumber: req.Phonenumber,
	})
	if err != nil {
		return
	}
	res = &admin.RoleUnallocatedListRes{
		List:  out.List,
		Total: out.Total,
	}
	return
}

// SelectAuthUserAll 批量选择用户授权
func (c *cRole) SelectAuthUserAll(ctx context.Context, req *admin.RoleSelectAuthUserAllReq) (res *admin.RoleSelectAuthUserAllRes, err error) {
	res = &admin.RoleSelectAuthUserAllRes{}
	err = sysService.Role().InsertAuthUsers(ctx, req.RoleId, req.UserIds)
	return
}

// CancelAuthUserAll 批量取消授权用户
func (c *cRole) CancelAuthUserAll(ctx context.Context, req *admin.RoleCancelAuthUserAllReq) (res *admin.RoleCancelAuthUserAllRes, err error) {
	res = &admin.RoleCancelAuthUserAllRes{}
	err = sysService.Role().DeleteAuthUsers(ctx, req.RoleId, req.UserIds)
	return
}

// CancelAuthUser 取消授权用户
func (c *cRole) CancelAuthUser(ctx context.Context, req *admin.RoleCancelAuthUserReq) (res *admin.RoleCancelAuthUserRes, err error) {
	res = &admin.RoleCancelAuthUserRes{}
	err = sysService.Role().DeleteAuthUser(ctx, req.RoleId, req.UserId)
	return
}
