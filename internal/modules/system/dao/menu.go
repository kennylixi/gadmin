// =================================================================================
// This is auto-generated by GoFrame CLI tool only once. Fill this file as you wish.
// =================================================================================

package dao

import (
	"context"
	"fmt"
	"github.com/gogf/gf/v2/container/gset"
	"github.com/gogf/gf/v2/frame/g"
	"github.com/gogf/gf/v2/text/gstr"
	"github.com/kennylixi/gadmin/internal/consts/user_consts"
	"github.com/kennylixi/gadmin/internal/modules/system/dao/internal"
	"github.com/kennylixi/gadmin/internal/modules/system/model"
	"github.com/kennylixi/gadmin/internal/modules/system/model/entity"
)

// internalMenuDao is internal type for wrapping internal DAO implements.
type internalMenuDao = *internal.MenuDao

// menuDao is the data access object for table sys_menu.
// You can define custom methods on it to extend its functionality as you wish.
type menuDao struct {
	internalMenuDao
}

var (
	// Menu is globally public accessible object for table sys_menu operations.
	Menu = menuDao{
		internal.NewMenuDao(),
	}
)

// Fill with you ideas below.

func (d *menuDao) SelectMenuList(ctx context.Context, con *entity.Menu) ([]*model.Menu, error) {
	m := Menu.Ctx(ctx).Fields(entity.Menu{})
	if status := gstr.Trim(con.Status); len(status) > 0 {
		m = m.Where(Menu.Columns().Status, status)
	}
	if visible := gstr.Trim(con.Visible); len(visible) > 0 {
		m = m.Where(Menu.Columns().Visible, visible)
	}
	if menuName := gstr.Trim(con.MenuName); len(menuName) > 0 {
		m = m.WhereLike(Menu.Columns().MenuName, "%"+menuName+"%")
	}
	menus := make([]*model.Menu, 0)
	if err := m.Order(Menu.Columns().ParentId + "," + Menu.Columns().OrderNum).Scan(&menus); err != nil {
		return nil, err
	}
	return menus, nil
}

// SelectMenuListByUserId 获取指定用户的菜单列表
func (d *menuDao) SelectMenuListByUserId(ctx context.Context, con *entity.Menu, userId int64) ([]*model.Menu, error) {
	m := Menu.Ctx(ctx).Distinct().Fields(entity.Menu{}).As("m").
		LeftJoin(RoleMenu.Table(), "rm", fmt.Sprintf("m.%s = rm.%s", Menu.Columns().MenuId, RoleMenu.Columns().MenuId)).
		LeftJoin(UserRole.Table(), "ur", fmt.Sprintf("rm.%s = ur.%s", RoleMenu.Columns().RoleId, UserRole.Columns().RoleId)).
		LeftJoin(Role.Table(), "ro", fmt.Sprintf("ur.%s = ro.%s", UserRole.Columns().RoleId, Role.Columns().RoleId)).
		Where("ur."+User.Columns().UserId, userId)
	if status := gstr.Trim(con.Status); len(status) > 0 {
		m = m.Where(Menu.Columns().Status, status)
	}
	if visible := gstr.Trim(con.Visible); len(visible) > 0 {
		m = m.Where(Menu.Columns().Visible, visible)
	}
	if menuName := gstr.Trim(con.MenuName); len(menuName) > 0 {
		m = m.WhereLike(Menu.Columns().MenuName, "%"+menuName+"%")
	}
	menus := make([]*model.Menu, 0)
	if err := m.Order(Menu.Columns().ParentId + "," + Menu.Columns().OrderNum).Scan(&menus); err != nil {
		return nil, err
	}
	return menus, nil
}

// SelectMenuPermsByUserId 根据用户ID查询权限
func (s *menuDao) SelectMenuPermsByUserId(ctx context.Context, userId int64) ([]string, error) {
	m := Menu.Ctx(ctx).Distinct().Fields("m."+Menu.Columns().Perms).As("m").
		LeftJoin(RoleMenu.Table(), "rm", fmt.Sprintf("m.%s = rm.%s", Menu.Columns().MenuId, RoleMenu.Columns().MenuId)).
		LeftJoin(UserRole.Table(), "ur", fmt.Sprintf("rm.%s = ur.%s", RoleMenu.Columns().RoleId, UserRole.Columns().RoleId)).
		LeftJoin(Role.Table(), "ro", fmt.Sprintf("ur.%s = ro.%s", UserRole.Columns().RoleId, Role.Columns().RoleId)).
		Where("ur."+User.Columns().UserId, userId).
		Where("m."+Menu.Columns().Status, "0").
		Where("ro."+Role.Columns().Status, "0")

	values, err := m.Array()
	if err != nil {
		return nil, err
	}
	prems := gset.NewStrSet()
	for _, value := range values {
		prem := gstr.Trim(value.String())
		if len(prem) > 0 {
			prems.Add(gstr.Split(prem, ",")...)
		}
	}
	return prems.Slice(), nil
}

func (d *menuDao) SelectMenuTreeAll(ctx context.Context) (results []*model.Menu, err error) {
	m := Menu.Ctx(ctx).Fields(entity.Menu{}).
		WhereIn(Menu.Columns().MenuType, g.Slice{user_consts.TypeDir, user_consts.TypeMenu}).
		Where(Menu.Columns().Status, "0").
		Order(Menu.Columns().ParentId + "," + Menu.Columns().OrderNum)
	if err = m.Scan(&results); err != nil {
		return nil, err
	}
	return
}

// SelectMenuTreeByUserId 根据指定用户获取菜单树
func (d *menuDao) SelectMenuTreeByUserId(ctx context.Context, userId int64) (results []*model.Menu, err error) {
	m := Menu.Ctx(ctx).Distinct().FieldsPrefix("m", entity.Menu{}).As("m").
		LeftJoin(RoleMenu.Table(), "rm", fmt.Sprintf("m.%s = rm.%s", Menu.Columns().MenuId, RoleMenu.Columns().MenuId)).
		LeftJoin(UserRole.Table(), "ur", fmt.Sprintf("rm.%s = ur.%s", RoleMenu.Columns().RoleId, UserRole.Columns().RoleId)).
		LeftJoin(Role.Table(), "ro", fmt.Sprintf("ur.%s = ro.%s", UserRole.Columns().RoleId, Role.Columns().RoleId)).
		LeftJoin(User.Table(), "u", fmt.Sprintf("ur.%s = u.%s", UserRole.Columns().UserId, User.Columns().UserId)).
		Where("u."+User.Columns().UserId, userId).
		Where(fmt.Sprintf("m.%s in (?)", Menu.Columns().MenuType), g.Slice{user_consts.TypeDir, user_consts.TypeMenu}).
		Where("m."+Menu.Columns().Status, "0").
		Where("ro."+Role.Columns().Status, "0").
		OrderAsc("m." + Menu.Columns().ParentId).
		OrderAsc("m." + Menu.Columns().OrderNum)
	if err = m.Scan(&results); err != nil {
		return nil, err
	}
	return
}

// SelectMenuListByRoleId 根据角色获取菜单列表
func (d *menuDao) SelectMenuListByRoleId(ctx context.Context, roleId int64, isMenuCheckStrictly bool) ([]int64, error) {
	m := Menu.Ctx(ctx).Fields("m."+Menu.Columns().MenuId).As("m").
		LeftJoin(RoleMenu.Table(), "rm", fmt.Sprintf("m.%s = rm.%s", Menu.Columns().MenuId, RoleMenu.Columns().MenuId)).
		Where(fmt.Sprintf("rm.%s", RoleMenu.Columns().RoleId), roleId)
	if isMenuCheckStrictly {
		where := fmt.Sprintf("m.%s not in (select m.%s from %s m inner join %s rm on m.%s = rm.%s and rm.role_id = ?)",
			Menu.Columns().MenuId,
			Menu.Columns().ParentId,
			Menu.Table(),
			RoleMenu.Table(),
			Menu.Columns().MenuId,
			RoleMenu.Columns().MenuId)
		m = m.Where(where, roleId)
	}
	m = m.Order(fmt.Sprintf("m.%s, m.%s", Menu.Columns().ParentId, Menu.Columns().OrderNum))
	values, err := m.Array()
	if err != nil {
		return nil, err
	}
	menuIds := make([]int64, len(values))
	for _, value := range values {
		menuIds = append(menuIds, value.Int64())
	}
	return menuIds, nil
}

// HasChildByMenuId 是否存在菜单子节点
//	@param menuId 菜单ID
//	@return 结果
func (d *menuDao) HasChildByMenuId(ctx context.Context, menuId int64) int {
	result, err := Menu.Ctx(ctx).Count(Menu.Columns().ParentId, menuId)
	if err != nil {
		panic(err)
	}
	return result
}
