package model

import (
	"github.com/kennylixi/gadmin/internal/modules/system/model/entity"
)

// UserOnlineListInput 用户在线状态列表请求
type UserOnlineListInput struct {
	UserName string // 用户名
	Ipaddr   string // 登录ip
}
type UserOnlineListOutput struct {
	List  []*entity.UserOnline `json:"list"`  // 列表
	Total int                  `json:"total"` // 数据总数
}
