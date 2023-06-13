package admin

import (
	"context"
	commonService "github.com/kennylixi/gadmin/internal/modules/common/service"
	"github.com/kennylixi/gadmin/internal/modules/system/api/v1/admin"
	"github.com/kennylixi/gadmin/internal/modules/system/model"
	sysService "github.com/kennylixi/gadmin/internal/modules/system/service"
)

// Menu 菜单管理
var Menu = cMenu{}

type cMenu struct{}

// List 获取菜单列表
func (c *cMenu) List(ctx context.Context, req *admin.MenuListReq) (res admin.MenuListRes, err error) {
	userId := commonService.BizCtx().GetUserId(ctx)
	res, err = sysService.Menu().SelectMenuList(ctx, &model.MenuSelectListInput{
		MenuName: req.MenuName,
		Status:   req.Status,
		UserId:   userId,
	})
	return
}

// GetInfo 根据菜单编号获取详细信息
func (c *cMenu) GetInfo(ctx context.Context, req *admin.MenuGetInfoReq) (res *admin.MenuGetInfoRes, err error) {
	out, err := sysService.Menu().SelectMenuById(ctx, req.MenuId)
	if err != nil {
		return
	}
	res = (*admin.MenuGetInfoRes)(out)
	return
}

// Treeselect 获取菜单下拉树列表
func (c *cMenu) Treeselect(ctx context.Context, req *admin.MenuTreeselectReq) (res admin.MenuTreeselectRes, err error) {
	userId := commonService.BizCtx().GetUserId(ctx)
	menus, err := sysService.Menu().SelectMenuList(ctx, &model.MenuSelectListInput{
		UserId: userId,
	})
	if err != nil {
		return
	}

	res = sysService.Menu().BuildMenuTreeSelect(menus)
	return
}

// RoleMenuTreeselect 加载对应角色菜单列表树
func (c *cMenu) RoleMenuTreeselect(ctx context.Context, req *admin.MenuRoleMenuTreeselectReq) (res *admin.MenuRoleMenuTreeselectRes, err error) {
	userId := commonService.BizCtx().GetUserId(ctx)
	menus, err := sysService.Menu().SelectMenuList(ctx, &model.MenuSelectListInput{
		UserId: userId,
	})
	if err != nil {
		return
	}
	menuIds, err := sysService.Menu().SelectMenuListByRoleId(ctx, req.RoleId)
	if err != nil {
		return
	}

	res = &admin.MenuRoleMenuTreeselectRes{
		CheckedKeys: menuIds,
		Menus:       sysService.Menu().BuildMenuTreeSelect(menus),
	}
	return
}

// Add 新增菜单
func (c *cMenu) Add(ctx context.Context, req *admin.MenuAddReq) (res *admin.MenuAddRes, err error) {
	err = sysService.Menu().Add(ctx, &model.MenuAddInput{
		MenuName:  req.MenuName,
		ParentId:  req.ParentId,
		OrderNum:  req.OrderNum,
		Component: req.Component,
		Status:    req.Status,
		Perms:     req.Perms,
		Icon:      req.Icon,
		Visible:   req.Visible,
		Path:      req.Path,
		MenuType:  req.MenuType,
		IsFrame:   req.IsFrame,
		IsCache:   req.IsCache,
		IsLog:     req.IsLog,
		Remark:    req.Remark,
		ApiIds:    req.ApiIds,
		CreateBy:  commonService.BizCtx().GetUserName(ctx),
	})
	return
}

// Edit 修改菜单
func (c *cMenu) Edit(ctx context.Context, req *admin.MenuEditReq) (res *admin.MenuEditRes, err error) {
	err = sysService.Menu().Edit(ctx, &model.MenuEditInput{
		MenuId:    req.MenuId,
		MenuName:  req.MenuName,
		ParentId:  req.ParentId,
		OrderNum:  req.OrderNum,
		Component: req.Component,
		Status:    req.Status,
		Perms:     req.Perms,
		Icon:      req.Icon,
		Visible:   req.Visible,
		Path:      req.Path,
		MenuType:  req.MenuType,
		IsFrame:   req.IsFrame,
		IsCache:   req.IsCache,
		IsLog:     req.IsLog,
		Remark:    req.Remark,
		ApiIds:    req.ApiIds,
		UpdateBy:  commonService.BizCtx().GetUserName(ctx),
	})
	return
}

// Delete 删除菜单
func (c *cMenu) Delete(ctx context.Context, req *admin.MenuDeleteReq) (res *admin.MenuDeleteRes, err error) {
	err = sysService.Menu().Delete(ctx, req.MenuId)
	return
}
