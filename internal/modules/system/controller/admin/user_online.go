package admin

import (
	"context"
	"github.com/kennylixi/gadmin/internal/modules/system/api/v1/admin"
	"github.com/kennylixi/gadmin/internal/modules/system/model"
	sysService "github.com/kennylixi/gadmin/internal/modules/system/service"
)

// UserOnline 用户在线管理
var UserOnline = cUserOnline{}

type cUserOnline struct{}

// List 获取在线用户状态列表
func (c *cUserOnline) List(ctx context.Context, req *admin.UserOnlineListReq) (res *admin.UserOnlineListRes, err error) {
	res = &admin.UserOnlineListRes{}
	out, err := sysService.UserOnline().SelectList(ctx, &model.UserOnlineListInput{
		UserName: req.UserName,
		Ipaddr:   req.Ipaddr,
	})
	if err != nil {
		return
	}
	res.List = out.List
	res.Total = out.Total
	return
}

// ForceLogout 强制退出
func (c *cUserOnline) ForceLogout(ctx context.Context, req *admin.ForceLogoutReq) (res *admin.ForceLogoutRes, err error) {
	err = sysService.UserOnline().ForceLogout(ctx, req.TokenId)
	return
}
