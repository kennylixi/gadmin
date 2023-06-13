package admin

import (
	"github.com/gogf/gf/v2/frame/g"
	"github.com/kennylixi/gadmin/internal/modules/system/model/entity"
)

// UserOnlineListReq 用户在线状态列表请求
type UserOnlineListReq struct {
	g.Meta   `path:"/online/list" tags:"在线用户" method:"get" summary:"获取在线用户状态列表"`
	UserName string // 用户名
	Ipaddr   string // 登录ip
}
type UserOnlineListRes struct {
	List  []*entity.UserOnline `json:"list"`  // 列表
	Total int                  `json:"total"` // 数据总数
}

// ForceLogoutReq 强制退出登录请求
type ForceLogoutReq struct {
	g.Meta  `path:"/online/{TokenId}" tags:"在线用户" method:"delete" summary:"强退用户"`
	TokenId string
}
type ForceLogoutRes struct {
}
