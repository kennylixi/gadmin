package model

import (
	"github.com/kennylixi/gadmin/internal/modules/system/model/entity"
)

// LoginInforListInput 用户登录日志列表请求
type LoginInforListInput struct {
	UserName string // 用户名称
	Ipaddr   string // 登录地址
	Status   string // 状态
}
type LoginInforListOutput struct {
	List  []*entity.Logininfor `json:"list"`  // 列表
	Total int                  `json:"total"` // 数据总数
}
