// =================================================================================
// Code generated by GoFrame CLI tool. DO NOT EDIT.
// =================================================================================

package do

import (
	"github.com/gogf/gf/v2/frame/g"
	"github.com/gogf/gf/v2/os/gtime"
)

// Menu is the golang structure of table sys_menu for DAO operations like Where/Data.
type Menu struct {
	g.Meta    `orm:"table:sys_menu, do:true"`
	MenuId    interface{} // 菜单ID
	MenuName  interface{} // 菜单名称
	ParentId  interface{} // 父菜单ID
	OrderNum  interface{} // 显示顺序
	Path      interface{} // 路由地址
	Component interface{} // 组件路径
	IsFrame   interface{} // 是否为外链（0是 1否）
	IsCache   interface{} // 是否缓存（0缓存 1不缓存）
	MenuType  interface{} // 菜单类型（M目录 C菜单 F按钮）
	Visible   interface{} // 菜单状态（0显示 1隐藏）
	Status    interface{} // 菜单状态（0正常 1停用）
	Perms     interface{} // 权限标识
	Icon      interface{} // 菜单图标
	IsLog     interface{} // 记录日志（0记录，1不记录）
	CreateBy  interface{} // 创建者
	CreatedAt *gtime.Time // 创建时间
	UpdateBy  interface{} // 更新者
	UpdatedAt *gtime.Time // 更新时间
	Remark    interface{} // 备注
}