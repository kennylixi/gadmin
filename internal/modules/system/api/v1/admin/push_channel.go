// ============================================================================
// This is auto-generated by gen tool only once. Fill this file as you wish.
// 渠道管理 API操作定义
// @author kennylixi
// @date 2023-03-27 08:32:42
// ============================================================================

package admin

import (
	"github.com/gogf/gf/v2/frame/g"
	"github.com/kennylixi/gadmin/internal/modules/system/model"
	"github.com/kennylixi/gadmin/internal/modules/system/model/entity"
)

// PushChannelListReq 查询渠道管理列表
type PushChannelListReq struct {
	g.Meta `path:"/pushChannel/list" tags:"推送渠道" method:"get" summary:"查询渠道管理列表"`
	Name   string // 渠道名称
	TypeId int64  // 渠道类型
	Status string // 状态
}
type PushChannelListRes struct {
	List  []*model.PushChannelListItem `json:"list"`  // 列表
	Total int                          `json:"total"` // 数据总数
}

// PushChannelSimpleListReq 查询渠道管理列表
type PushChannelSimpleListReq struct {
	g.Meta `path:"/pushChannel/list/simple" tags:"推送渠道" method:"get" summary:"查询渠道管理列表（简单）"`
	Name   string // 渠道名称
	TypeId int64  // 渠道类型
	Status string // 状态
}
type PushChannelSimpleListRes []*model.PushChannelSimpleListItem

// PushChannelGetInfoReq 获取渠道管理详情
type PushChannelGetInfoReq struct {
	g.Meta `path:"/pushChannel/{Id}" tags:"推送渠道" method:"get" summary:"获取渠道管理详情"`
	Id     int64
}
type PushChannelGetInfoRes entity.PushChannel

// PushChannelGetTemplateParamsReq 获取渠道模板参数
type PushChannelGetTemplateParamsReq struct {
	g.Meta `path:"/pushChannel/template_params/{Id}" tags:"推送渠道" method:"get" summary:"获取渠道模板参数"`
	Id     int64
}
type PushChannelGetTemplateParamsRes string

// PushChannelAddReq 新增渠道管理
type PushChannelAddReq struct {
	g.Meta         `path:"/pushChannel" tags:"推送渠道" method:"post" summary:"新增渠道管理"`
	Name           string `v:"required#请输入渠道名称"` // 渠道名称
	TypeId         int64  `v:"required#请输入渠道类型"` // 渠道类型
	Remark         string // 备注
	Config         string `v:"required#请输入渠道配置"`  // 渠道配置
	Status         string `v:"in:0,1#状态非法" d:"0"` // 状态
	TemplateParams string // 模板参数
}
type PushChannelAddRes struct {
}

// PushChannelEditReq 修改渠道管理
type PushChannelEditReq struct {
	g.Meta `path:"/pushChannel" tags:"推送渠道" method:"put" summary:"修改渠道管理"`
	Id     int64  `v:"required#请输入渠道管理Id"` // 渠道管理ID
	Name   string `v:"required#请输入渠道名称"`   // 渠道名称
	TypeId int64  `v:"required#请输入渠道类型"`   // 渠道类型
	Remark string // 备注
	Config string `v:"required#请输入渠道配置"`  // 渠道配置
	Status string `v:"in:0,1#状态非法" d:"0"` // 状态
}
type PushChannelEditRes struct {
}

// PushChannelDeleteReq 删除渠道管理
type PushChannelDeleteReq struct {
	g.Meta `path:"/pushChannel" tags:"推送渠道" method:"delete" summary:"删除渠道管理"`
	Ids    []int64
}
type PushChannelDeleteRes struct {
}
