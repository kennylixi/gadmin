package admin

import (
	"context"
	commonService "github.com/kennylixi/gadmin/internal/modules/common/service"
	"github.com/kennylixi/gadmin/internal/modules/system/api/v1/admin"
	"github.com/kennylixi/gadmin/internal/modules/system/service"
)

// Sys 参数配置管理
var Sys = cSys{}

type cSys struct{}

// GetInfo 获取用户信息
func (c *cSys) GetInfo(ctx context.Context, req *admin.GetInfoReq) (res *admin.GetInfoRes, err error) {
	loginUser := commonService.BizCtx().Get(ctx).User
	user, err := service.User().SelectUserById(ctx, loginUser.UserId)
	if err != nil {
		return
	}
	// 角色集合
	roles, err := service.Permission().GetRolePermission(ctx, loginUser.UserId)
	if err != nil {
		return
	}
	// 权限集合
	permissions, err := service.Permission().GetMenuPermission(ctx, loginUser.UserId)
	if err != nil {
		return
	}

	res = &admin.GetInfoRes{
		User:        user,
		Roles:       roles,
		Permissions: permissions,
	}
	return
}

// GetRouters 获取路由信息
func (c *cSys) GetRouters(ctx context.Context, req *admin.GetRoutersReq) (res admin.GetRoutersRes, err error) {
	loginUser := commonService.BizCtx().Get(ctx).User
	menuItems, err := service.Menu().SelectMenuTreeByUserId(ctx, loginUser.UserId)
	if err != nil {
		return
	}

	res = service.Menu().BuildMenus(menuItems)
	return
}
