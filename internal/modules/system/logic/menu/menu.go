package menu

import (
	"context"
	"fmt"
	"github.com/gogf/gf/v2/database/gdb"
	"github.com/gogf/gf/v2/errors/gerror"
	"github.com/kennylixi/gadmin/internal/consts"
	"github.com/kennylixi/gadmin/internal/consts/user_consts"
	commonModel "github.com/kennylixi/gadmin/internal/modules/common/model"
	"github.com/kennylixi/gadmin/internal/modules/system/dao"
	"github.com/kennylixi/gadmin/internal/modules/system/model"
	"github.com/kennylixi/gadmin/internal/modules/system/model/do"
	"github.com/kennylixi/gadmin/internal/modules/system/model/entity"
	sysService "github.com/kennylixi/gadmin/internal/modules/system/service"
	"github.com/kennylixi/gadmin/utility/utils"
	"strings"
)

type sMenu struct{}

func init() {
	sysService.RegisterMenu(New())
}

func New() *sMenu {
	return &sMenu{}
}

// SelectMenuList 查询系统菜单列表
// @param req 		请求参数
// @param userId	当前用户ID，用于判断当前用户是否是管理员
func (s *sMenu) SelectMenuList(ctx context.Context, in *model.MenuSelectListInput) ([]*model.Menu, error) {
	menu := &entity.Menu{
		MenuName: in.MenuName,
		Status:   in.Status,
	}
	if commonModel.IsAdmin(in.UserId) {
		return dao.Menu.SelectMenuList(ctx, menu)
	} else {
		return dao.Menu.SelectMenuListByUserId(ctx, menu, in.UserId)
	}
}

// SelectMenuTreeByUserId 根据用户ID查询菜单
// @param userId	当前用户ID，用于判断当前用户是否是管理员
func (s *sMenu) SelectMenuTreeByUserId(ctx context.Context, userId int64) ([]*model.Menu, error) {
	var (
		err      error
		menuList []*model.Menu
	)
	if commonModel.IsAdmin(userId) {
		menuList, err = dao.Menu.SelectMenuTreeAll(ctx)
	} else {
		menuList, err = dao.Menu.SelectMenuTreeByUserId(ctx, userId)
	}
	if err != nil {
		return nil, err
	}
	return s.getChildPerms(menuList, 0), nil
}

// 根据父节点的ID获取所有子节点
// @param menus		菜单列表
// @param parentId	上级菜单Id
// @return 返回树状结构的菜单列表
func (s *sMenu) getChildPerms(menus []*model.Menu, parentId int64) []*model.Menu {
	returnList := make([]*model.Menu, 0, len(menus))
	for _, menu := range menus {
		// 如果是顶级节点, 遍历该父节点的所有子节点
		if menu.ParentId == parentId {
			returnList = append(returnList, s.recursionFn(menus, menu))
		}
	}

	return returnList
}

// 递归组装树
func (s *sMenu) recursionFn(menus []*model.Menu, menu *model.Menu) *model.Menu {
	for _, item := range menus {
		if item.ParentId == menu.MenuId {
			if menu.Children == nil {
				menu.Children = make([]*model.Menu, 0)
			}
			menu.Children = append(menu.Children, s.recursionFn(menus, item))
		}
	}
	return menu
}

// SelectMenuById 根据部门编号获取详细信息
func (s *sMenu) SelectMenuById(ctx context.Context, menuId int64) (*model.Menu, error) {
	menu := (*model.Menu)(nil)
	err := dao.Menu.Ctx(ctx).Scan(&menu, dao.Menu.Columns().MenuId, menuId)
	if err != nil {
		return nil, err
	}
	if menu == nil {
		err = gerror.New("数据不存在")
		return nil, nil
	}
	err = dao.MenuApi.Ctx(ctx).
		LeftJoinOnField(dao.Api.Table(), dao.Api.Columns().ApiId).
		FieldsPrefix(dao.Api.Table(), "*").
		Scan(&menu.ApiList, dao.Menu.Columns().MenuId, menuId)
	return menu, err
}

// SelectMenuPermsByUserId 根据用户ID查询权限
// @param userId 用户ID
// @return 权限列表
func (s *sMenu) SelectMenuPermsByUserId(ctx context.Context, userId int64) ([]string, error) {
	return dao.Menu.SelectMenuPermsByUserId(ctx, userId)
}

// SelectMenuListByRoleId 根据角色ID查询菜单树信息
func (s *sMenu) SelectMenuListByRoleId(ctx context.Context, roleId int64) ([]int64, error) {
	role, err := sysService.Role().SelectRoleById(ctx, roleId)
	if err != nil {
		return nil, err
	}
	return dao.Menu.SelectMenuListByRoleId(ctx, roleId, role.MenuCheckStrictly != 0)
}

// BuildMenuTreeSelect 构建前端所需要下拉树结构
// @param menus 菜单列表
// @return 下拉树结构列表
func (s *sMenu) BuildMenuTreeSelect(menus []*model.Menu) []*commonModel.TreeSelect {
	menuIdMap := make(map[int64]int64)
	for _, menu := range menus {
		menuIdMap[menu.MenuId] = menu.MenuId
	}

	returnList := make([]*commonModel.TreeSelect, 0)
	for _, menu := range menus {
		// 如果是顶级节点, 遍历该父节点的所有子节点
		if _, ok := menuIdMap[menu.ParentId]; !ok {
			returnList = append(returnList, s.recursionTreeSelectFn(menus, menu))
		}
	}

	return returnList
}

// 递归组装树
func (s *sMenu) recursionTreeSelectFn(menus []*model.Menu, menu *model.Menu) *commonModel.TreeSelect {
	treeItem := &commonModel.TreeSelect{
		Id:    menu.MenuId,
		Label: menu.MenuName,
	}
	for _, item := range menus {
		if item.ParentId == menu.MenuId {
			if treeItem.Children == nil {
				treeItem.Children = make([]*commonModel.TreeSelect, 0)
			}
			treeItem.Children = append(treeItem.Children, s.recursionTreeSelectFn(menus, item))
		}
	}
	return treeItem
}

// 校验菜单名称是否唯一
// @param menu 菜单信息
// @return 结果 true 是唯一的， false 不是唯一
func (s *sMenu) checkMenuNameUnique(ctx context.Context, parentId int64, menuName string, menuId ...int64) (bool, error) {
	mid := int64(-1)
	if len(menuId) > 0 {
		mid = menuId[0]
	}
	menu := (*model.Menu)(nil)
	err := dao.Menu.Ctx(ctx).Where(dao.Menu.Columns().ParentId, parentId).
		Where(dao.Menu.Columns().MenuName, menuName).Scan(&menu)
	if err != nil {
		return false, err
	}
	if menu != nil && menu.MenuId != mid {
		return false, nil
	}
	return true, nil
}

// 查询菜单使用数量
// @param menuId 菜单ID
// @return 结果
func (s *sMenu) checkMenuExistRole(ctx context.Context, menuId int64) bool {
	result := dao.RoleMenu.CheckMenuExistRole(ctx, menuId)
	return result > 0
}

// 是否存在菜单子节点
// @param menuId 菜单ID
// @return 结果
func (s *sMenu) hasChildByMenuId(ctx context.Context, menuId int64) bool {
	result := dao.Menu.HasChildByMenuId(ctx, menuId)
	return result > 0
}

// BuildMenus 构建前端路由所需要的菜单
// @param menus 菜单列表
// @return 路由列表
func (s *sMenu) BuildMenus(menus []*model.Menu) []*model.RouterVo {
	routers := make([]*model.RouterVo, 0, 10)
	for _, menu := range menus {
		router := new(model.RouterVo)
		router.Hidden = menu.Visible == "1"
		router.Name = s.getRouteName(menu)
		router.Path = s.getRouterPath(menu)
		router.Component = s.getComponent(menu)
		router.Meta = model.MetaVo{
			Title:   menu.MenuName,
			Icon:    menu.Icon,
			NoCache: menu.IsCache != user_consts.Normal,
		}
		cMenus := menu.Children
		if len(cMenus) > 0 && user_consts.TypeDir == menu.MenuType {
			router.AlwaysShow = true
			router.Redirect = "noRedirect"
			router.Children = s.BuildMenus(cMenus)
		} else if s.isMenuFrame(menu) {
			childrenList := make([]*model.RouterVo, 0, 10)
			children := new(model.RouterVo)
			children.Name = s.getRouteName(menu)
			children.Path = s.getRouterPath(menu)
			children.Component = s.getComponent(menu)
			children.Meta = model.MetaVo{
				Title:   menu.MenuName,
				Icon:    menu.Icon,
				NoCache: menu.IsCache != user_consts.Normal,
			}
			childrenList = append(childrenList, children)
			router.Children = childrenList
		}
		routers = append(routers, router)
	}
	return routers
}

// 获取路由名称
// @param menu 菜单信息
// @return 路由名称
func (s *sMenu) getRouteName(menu *model.Menu) string {
	routerName := utils.Capitalize(menu.Path)
	// 非外链并且是一级目录（类型为目录）
	if s.isMenuFrame(menu) {
		routerName = ""
	}
	return routerName
}

// 获取路由地址
// @param menu 菜单信息
// @return 路由地址
func (s *sMenu) getRouterPath(menu *model.Menu) string {
	routerPath := menu.Path
	if menu.ParentId == 0 &&
		user_consts.TypeDir == menu.MenuType &&
		user_consts.NoFrame == menu.IsFrame {
		// 非外链并且是一级目录（类型为目录）
		routerPath = "/" + menu.Path
	} else if s.isMenuFrame(menu) {
		// 非外链并且是一级目录（类型为菜单）
		routerPath = "/"
	}
	return routerPath
}

// 获取组件信息
// @param menu 菜单信息
// @return 组件信息
func (s *sMenu) getComponent(menu *model.Menu) string {
	component := user_consts.Layout
	if len(menu.Component) > 0 && !s.isMenuFrame(menu) {
		component = menu.Component
	} else if len(menu.Component) == 0 && s.isParentView(menu) {
		component = user_consts.ParentView
	}
	return component
}

// 是否为菜单内部跳转
// @param menu 菜单信息
// @return 结果
func (s *sMenu) isMenuFrame(menu *model.Menu) bool {
	return menu.ParentId == 0 &&
		user_consts.TypeMenu == menu.MenuType &&
		user_consts.NoFrame == menu.IsFrame
}

// 是否为parent_view组件
// @param menu 菜单信息
// @return 结果
func (s *sMenu) isParentView(menu *model.Menu) bool {
	return menu.ParentId != 0 &&
		user_consts.TypeDir == menu.MenuType
}

// Add 新增保存菜单信息
// @param ctx  上下文
// @param menu 菜单信息
func (s *sMenu) Add(ctx context.Context, in *model.MenuAddInput) (err error) {
	isUnique, err := s.checkMenuNameUnique(ctx, in.ParentId, in.MenuName)
	if err != nil {
		return gerror.New("新增失败")
	}
	if !isUnique {
		return gerror.New("新增菜单'" + in.MenuName + "'失败，菜单名称已存在")
	}
	if user_consts.YesFrame == in.IsFrame &&
		!strings.HasPrefix(in.Path, consts.HTTP) &&
		!strings.HasPrefix(in.Path, consts.HTTPS) {
		return gerror.New("新增菜单'" + in.MenuName + "'失败，地址必须以http(s)://开头")
	}

	err = dao.Menu.Transaction(ctx, func(ctx context.Context, tx gdb.TX) error {
		menuId, err := dao.Menu.Ctx(ctx).TX(tx).InsertAndGetId(&do.Menu{
			MenuName:  in.MenuName,
			ParentId:  in.ParentId,
			OrderNum:  in.OrderNum,
			Path:      in.Path,
			Component: in.Component,
			IsFrame:   in.IsFrame,
			IsCache:   in.IsCache,
			MenuType:  in.MenuType,
			Visible:   in.Visible,
			Status:    in.Status,
			Perms:     in.Perms,
			Icon:      in.Icon,
			IsLog:     in.IsLog,
			CreateBy:  in.CreateBy,
			Remark:    in.Remark,
		})
		if err != nil {
			return err
		}

		// 授权新接口
		if len(in.ApiIds) > 0 {
			menuApis := make([]*do.MenuApi, 0, len(in.ApiIds))
			for _, apiId := range in.ApiIds {
				menuApis = append(menuApis, &do.MenuApi{
					MenuId: menuId,
					ApiId:  apiId,
				})
			}
			_, err = dao.MenuApi.Ctx(ctx).TX(tx).Insert(menuApis)
			if err != nil {
				return err
			}
		}
		return nil
	})
	if err != nil {
		err = gerror.Wrap(err, "新增失败")
	}
	return
}

// Edit 修改保存菜单信息
// @param ctx  上下文
// @param menu 菜单信息
func (s *sMenu) Edit(ctx context.Context, in *model.MenuEditInput) (err error) {
	isUnique, err := s.checkMenuNameUnique(ctx, in.ParentId, in.MenuName, in.MenuId)
	if err != nil {
		return gerror.New("编辑失败")
	}
	if !isUnique {
		return gerror.New("修改菜单'" + in.MenuName + "'失败，菜单名称已存在")
	}
	if user_consts.YesFrame == in.IsFrame &&
		!strings.HasPrefix(in.Path, consts.HTTP) &&
		!strings.HasPrefix(in.Path, consts.HTTPS) {
		return gerror.New("修改菜单'" + in.MenuName + "'失败，地址必须以http(s)://开头")
	}
	if in.MenuId == in.ParentId {
		return gerror.New("修改菜单'" + in.MenuName + "'失败，上级菜单不能选择自己")
	}

	casbin := sysService.Casbin().Casbin(ctx)
	menuIds := []int64{in.MenuId}
	// 获取原有API
	oldApis, err := sysService.Api().SelectApiListByMenuIds(ctx, menuIds)
	if err != nil {
		return err
	}

	// 获取菜单涉及角色
	roleKeys, err := sysService.Role().SelectRoleKeyByMenuIds(ctx, menuIds)
	if err != nil {
		return err
	}

	err = dao.Menu.Transaction(ctx, func(ctx context.Context, tx gdb.TX) error {

		// 删除原有接口授权
		_, err = dao.MenuApi.Ctx(ctx).TX(tx).Delete(dao.MenuApi.Columns().MenuId, in.MenuId)
		if err != nil {
			return err
		}

		// 删除原有授权接口
		for _, roleKey := range roleKeys {
			for _, api := range oldApis {
				_, _ = casbin.RemoveFilteredPolicy(0, fmt.Sprintf("r:%s", roleKey), api.ApiUrl, api.ApiMethod)
			}
		}

		// 重新授权新接口
		if len(in.ApiIds) > 0 {
			menuApis := make([]*do.MenuApi, 0, len(in.ApiIds))
			for _, apiId := range in.ApiIds {
				menuApis = append(menuApis, &do.MenuApi{
					MenuId: in.MenuId,
					ApiId:  apiId,
				})
			}

			if _, err = dao.MenuApi.Ctx(ctx).TX(tx).Insert(menuApis); err != nil {
				return err
			}

			apiList := ([]*entity.Api)(nil)
			if err = dao.Api.Ctx(ctx).Fields(&entity.Api{}).WhereIn(dao.Api.Columns().ApiId, in.ApiIds).Scan(&apiList); err != nil {
				return err
			}
			if apiList != nil {
				// 授权新接口
				var rules [][]string
				for _, roleKey := range roleKeys {
					for _, api := range apiList {
						rules = append(rules, []string{fmt.Sprintf("r:%s", roleKey), api.ApiUrl, api.ApiMethod})
					}
				}
				_, _ = casbin.AddPolicies(rules)
			}
		}

		_, err = dao.Menu.Ctx(ctx).TX(tx).Update(&do.Menu{
			MenuName:  in.MenuName,
			ParentId:  in.ParentId,
			OrderNum:  in.OrderNum,
			Path:      in.Path,
			Component: in.Component,
			IsFrame:   in.IsFrame,
			IsCache:   in.IsCache,
			MenuType:  in.MenuType,
			Visible:   in.Visible,
			Status:    in.Status,
			Perms:     in.Perms,
			Icon:      in.Icon,
			IsLog:     in.IsLog,
			UpdateBy:  in.UpdateBy,
			Remark:    in.Remark,
		}, dao.Menu.Columns().MenuId, in.MenuId)
		return err
	})
	if err != nil {
		err = gerror.Wrap(err, "更新失败")
	}
	return
}

// Delete 删除菜单管理信息
// @param ctx  上下文
// @param menu 菜单信息
func (s *sMenu) Delete(ctx context.Context, menuId int64) (err error) {
	if s.hasChildByMenuId(ctx, menuId) {
		return gerror.New("存在子菜单,不允许删除")
	}
	if s.checkMenuExistRole(ctx, menuId) {
		return gerror.New("菜单已分配,不允许删除")
	}
	err = dao.Menu.Transaction(ctx, func(ctx context.Context, tx gdb.TX) error {
		// 获取菜单涉及角色
		menuIds := []int64{menuId}
		var roleKeys []string
		roleKeys, err = sysService.Role().SelectRoleKeyByMenuIds(ctx, menuIds)
		if err != nil {
			return err
		}

		apiList, err := sysService.Api().SelectApiListByMenuIds(ctx, menuIds)
		if err != nil {
			return err
		}
		// 删除授权信息
		var rules [][]string
		for _, roleKey := range roleKeys {
			for _, api := range apiList {
				rules = append(rules, []string{roleKey, api.ApiUrl, api.ApiMethod})
			}
		}
		_, _ = sysService.Casbin().Casbin(ctx).RemovePolicies(rules)

		_, err = dao.MenuApi.Ctx(ctx).TX(tx).Delete(dao.MenuApi.Columns().MenuId, menuId)
		if err != nil {
			return err
		}
		_, err = dao.Menu.Ctx(ctx).TX(tx).Delete(dao.Menu.Columns().MenuId, menuId)
		return err
	})

	return
}
