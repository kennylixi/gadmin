// =================================================================================
// Code generated by GoFrame CLI tool. DO NOT EDIT.
// =================================================================================

package do

import (
	"github.com/gogf/gf/v2/frame/g"
	"github.com/gogf/gf/v2/os/gtime"
)

// PushTemplate is the golang structure of table sys_push_template for DAO operations like Where/Data.
type PushTemplate struct {
	g.Meta    `orm:"table:sys_push_template, do:true"`
	Id        interface{} // 编号
	Name      interface{} // 模板名称
	Code      interface{} // 模板编码
	ChannelId interface{} // 渠道ID
	Params    interface{} // 渠道信息
	Status    interface{} // 状态（0开启 1禁用）
	Cron      interface{} // 执行时间(0实时，定时cron表达式)
	MsgType   interface{} // 消息类型
	Remark    interface{} // 备注
	CreateBy  interface{} // 创建者
	CreatedAt *gtime.Time // 创建时间
	UpdateBy  interface{} // 更新者
	UpdatedAt *gtime.Time // 更新时间
}