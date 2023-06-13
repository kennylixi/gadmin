package admin

import (
	"github.com/gogf/gf/v2/frame/g"
	"github.com/kennylixi/gadmin/internal/modules/system/model"
	"github.com/kennylixi/gadmin/internal/modules/system/model/entity"
)

// GetInfoReq 获取用户信息
type GetInfoReq struct {
	g.Meta `path:"/getInfo" tags:"系统" method:"get" summary:"获取用户信息"`
}
type GetInfoRes struct {
	User        *entity.User `json:"user"`
	Roles       []string     `json:"roles"`
	Permissions []string     `json:"permissions"`
}

// GetRoutersReq 获取路由信息
type GetRoutersReq struct {
	g.Meta `path:"/getRouters" tags:"系统" method:"get" summary:"获取路由信息"`
}
type GetRoutersRes []*model.RouterVo
