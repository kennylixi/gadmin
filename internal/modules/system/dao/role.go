// =================================================================================
// This is auto-generated by GoFrame CLI tool only once. Fill this file as you wish.
// =================================================================================

package dao

import (
	"context"
	"fmt"
	"github.com/gogf/gf/v2/database/gdb"
	"github.com/gogf/gf/v2/frame/g"
	"github.com/gogf/gf/v2/text/gstr"
	commonService "github.com/kennylixi/gadmin/internal/modules/common/service"
	"github.com/kennylixi/gadmin/internal/modules/system/dao/internal"
	"github.com/kennylixi/gadmin/internal/modules/system/model"
	"github.com/kennylixi/gadmin/internal/modules/system/model/do"
	"github.com/kennylixi/gadmin/internal/modules/system/model/entity"
)

// internalRoleDao is internal type for wrapping internal DAO implements.
type internalRoleDao = *internal.RoleDao

// roleDao is the data access object for table sys_role.
// You can define custom methods on it to extend its functionality as you wish.
type roleDao struct {
	internalRoleDao
}

var (
	// Role is globally public accessible object for table sys_role operations.
	Role = roleDao{
		internal.NewRoleDao(),
	}
)

// Fill with you ideas below.

func (d *roleDao) getModel(ctx context.Context, fields bool) *gdb.Model {
	m := Role.Ctx(ctx).Distinct().As("r").
		LeftJoin(UserRole.Table(), "ur", fmt.Sprintf("ur.%s = r.%s", UserRole.Columns().RoleId, Role.Columns().RoleId)).
		LeftJoin(User.Table(), "u", fmt.Sprintf("u.%s = ur.%s", User.Columns().UserId, UserRole.Columns().UserId)).
		LeftJoin(Dept.Table(), "d", fmt.Sprintf("u.%s = d.%s", User.Columns().DeptId, Dept.Columns().DeptId))
	if fields {
		m = m.Fields(
			"r."+Role.Columns().RoleId,
			"r."+Role.Columns().RoleName,
			"r."+Role.Columns().RoleKey,
			"r."+Role.Columns().RoleSort,
			"r."+Role.Columns().Status,
			"r."+Role.Columns().CreatedAt,
		)
	}
	return m
}

// SelectRoleList 根据条件分页查询角色数据
//	@param req 角色过滤信息
//	@return 角色数据集合信息
func (d *roleDao) SelectRoleList(ctx context.Context, role *entity.Role) (list []*model.RoleListItem, total int, err error) {
	m := d.getModel(ctx, false)
	if roleName := gstr.Trim(role.RoleName); len(roleName) > 0 {
		m = m.WhereLike("r."+Role.Columns().RoleName, "%"+roleName+"%")
	}
	if roleKey := gstr.Trim(role.RoleKey); len(roleKey) > 0 {
		m = m.WhereLike("r."+Role.Columns().RoleKey, "%"+roleKey+"%")
	}
	if status := gstr.Trim(role.Status); len(status) > 0 {
		m = m.Where("r."+Role.Columns().Status, status)
	}
	m = commonService.BizCtx().WhereBeginTime(ctx, Role.Columns().CreatedAt, m, "r")
	m = commonService.BizCtx().WhereEndTime(ctx, Role.Columns().CreatedAt, m, "r")

	total, err = m.Fields("*").Count()
	if err != nil || total == 0 {
		return
	}

	list = ([]*model.RoleListItem)(nil)
	err = commonService.BizCtx().Page(ctx, m).Fields(
		"r."+Role.Columns().RoleId,
		"r."+Role.Columns().RoleName,
		"r."+Role.Columns().RoleKey,
		"r."+Role.Columns().RoleSort,
		"r."+Role.Columns().Status,
		"r."+Role.Columns().CreatedAt,
	).Order("r." + Role.Columns().RoleSort).Scan(&list)

	return
}

// SelectRolePermissionByUserId 根据用户ID查询角色
// @param userId 用户ID
// @return 角色列表
func (d *roleDao) SelectRolePermissionByUserId(ctx context.Context, userId int64) (results []*model.Role, err error) {
	m := d.getModel(ctx, true).Where(fmt.Sprintf("ur.%s = ?", UserRole.Columns().UserId), userId)
	if err = m.Scan(&results); err != nil {
		return nil, err
	}
	return results, nil
}

// SelectRoleAll 查询所有角色
//	@return 角色列表
func (d *roleDao) SelectRoleAll(ctx context.Context) (results []*model.Role, err error) {
	if err = Role.Ctx(ctx).Fields(model.Role{}).Scan(&results); err != nil {
		return nil, err
	}
	return results, nil
}

// SelectRoleListByUserId 根据用户ID获取角色选择框列表
//	@param userId 用户ID
//	@return 选中角色ID列表
func (d *roleDao) SelectRoleListByUserId(ctx context.Context, userId int64) ([]int64, error) {
	values, err := Role.Ctx(ctx).Fields("r."+Role.Columns().RoleId).As("r").
		LeftJoin(UserRole.Table(), "ur", fmt.Sprintf("ur.%s = r.%s", UserRole.Columns().RoleId, Role.Columns().RoleId)).
		LeftJoin(User.Table(), "u", fmt.Sprintf("u.%s = ur.%s", User.Columns().UserId, UserRole.Columns().UserId)).
		Where(fmt.Sprintf("u.%s = ?", User.Columns().UserId), userId).Array()
	if err != nil {
		return nil, err
	}
	roleIds := make([]int64, 0, len(values))
	for _, value := range values {
		roleIds = append(roleIds, value.Int64())
	}
	return roleIds, nil
}

// SelectRoleById 通过角色ID查询角色
//	@param roleId 角色ID
//	@return 角色对象信息
func (d *roleDao) SelectRoleById(ctx context.Context, roleId int64) (role *entity.Role, err error) {
	err = d.getModel(ctx, true).Where(fmt.Sprintf("r.%s = ?", Role.Columns().RoleId), roleId).Scan(&role)
	return role, err
}

// SelectRolesByUserName 根据用户ID查询角色
//	@param userName 用户名
//	@return 角色列表
func (d *roleDao) SelectRolesByUserName(ctx context.Context, userName string) (roles []*entity.Role, err error) {
	err = d.getModel(ctx, true).Where(fmt.Sprintf("u.%s = ?", User.Columns().UserName), userName).Scan(&roles)
	return roles, err
}

// CheckRoleNameUnique 校验角色名称是否唯一
//	@param roleName 角色名称
//	@return 角色信息
func (d *roleDao) CheckRoleNameUnique(ctx context.Context, roleName string) (role *entity.Role, err error) {
	err = d.getModel(ctx, true).Where(fmt.Sprintf("r.%s = ?", Role.Columns().RoleName), roleName).Scan(&role)
	return role, err
}

// CheckRoleKeyUnique 校验角色权限是否唯一
//	@param roleKey 角色权限
//	@return 角色信息
func (d *roleDao) CheckRoleKeyUnique(ctx context.Context, roleKey string) (role *entity.Role, err error) {
	err = d.getModel(ctx, true).Where(fmt.Sprintf("r.%s = ?", Role.Columns().RoleKey), roleKey).Scan(&role)
	return role, err
}

// Add 新增角色信息
//	@param role 角色信息
//	@return 结果
func (d *roleDao) Add(ctx context.Context, role *do.Role, tx ...gdb.TX) (int64, error) {
	m := Role.Ctx(ctx).Data(role)
	if len(tx) > 0 {
		m = m.TX(tx[0])
	}
	return m.InsertAndGetId()
}

// Edit 修改角色信息
//	@param role 角色信息
//	@return 结果
func (d *roleDao) Edit(ctx context.Context, role *do.Role, tx ...gdb.TX) (err error) {
	m := Role.Ctx(ctx)
	if len(tx) > 0 {
		m = m.TX(tx[0])
	}
	_, err = m.Update(role, Role.Columns().RoleId, role.RoleId)

	return err
}

// DeleteRoleById 删除角色信息
//	@param roleId 需要删除的角色ID
//	@return 结果
func (d *roleDao) DeleteRoleById(ctx context.Context, roleId int64) error {
	_, err := Role.Ctx(ctx).Where(Role.Columns().RoleId, roleId).Delete()
	return err
}

// DeleteRoleByIds 批量删除角色信息
//	@param roleIds 需要删除的角色ID
//	@return 结果
func (d *roleDao) DeleteRoleByIds(ctx context.Context, roleIds []int64) error {
	_, err := Role.Ctx(ctx).Where(Role.Columns().RoleId, roleIds).Delete()
	return err
}

// UpdateRoleStatus 修改角色状态
//	@param roleId 角色ID
//	@param status 状态
//	@param updateBy 更新者
func (d *roleDao) UpdateRoleStatus(ctx context.Context, roleId int64, status string, updateBy string) error {
	_, err := Role.Ctx(ctx).Data(g.Map{
		Role.Columns().Status:   status,
		Role.Columns().UpdateBy: updateBy,
	}).Where(Role.Columns().RoleId, roleId).Update()
	return err
}

// UpdateDataScope 修改角色数据权限
//	@param roleId 角色ID
//	@param status 状态
func (d *roleDao) UpdateDataScope(ctx context.Context, roleId int64, dataScope int, tx ...gdb.TX) error {
	data := g.Map{
		Role.Columns().DataScope: dataScope,
	}
	m := Role.Ctx(ctx).Data(data)
	if len(tx) > 0 {
		m = m.TX(tx[0])
	}
	_, err := m.Where(Role.Columns().RoleId, roleId).Update()
	return err
}

// CountUserRoleByRoleId 通过角色ID查询角色使用数量
//	@param roleId 角色ID
func (d *roleDao) CountUserRoleByRoleId(ctx context.Context, roleId int64) (int, error) {
	return UserRole.Ctx(ctx).Where(UserRole.Columns().RoleId, roleId).Count()
}
