package model

import "github.com/kennylixi/gadmin/internal/modules/system/model/entity"

type Menu struct {
	entity.Menu
	Children []*Menu       `json:"children"`
	ApiList  []*entity.Api `json:"apiList"`
}

// RouterVo 路由配置信息
type RouterVo struct {
	Name       string      `json:"name"`               //路由名字
	Path       string      `json:"path"`               //路由地址
	Hidden     bool        `json:"hidden"`             //是否隐藏路由，当设置 true 的时候该路由不会再侧边栏出现
	Redirect   string      `json:"redirect"`           //重定向地址，当设置 noRedirect 的时候该路由在面包屑导航中不可被点击
	Component  string      `json:"component"`          //组件地址
	AlwaysShow bool        `json:"alwaysShow"`         //当你一个路由下面的 children 声明的路由大于1个时，自动会变成嵌套的模式--如组件页面
	Meta       MetaVo      `json:"meta"`               //其他元素
	Children   []*RouterVo `json:"children,omitempty"` //子路由
}

// MetaVo 路由显示信息
type MetaVo struct {
	Title   string `json:"title"`   //设置该路由在侧边栏和面包屑中展示的名字
	Icon    string `json:"icon"`    //设置该路由的图标，对应路径src/assets/icons/svg
	NoCache bool   `json:"noCache"` //设置为true，则不会被 <keep-alive>缓存
}

type MenuSelectListInput struct {
	MenuName string // 菜单名称
	Status   string // 菜单状态（0正常 1停用）
	UserId   int64
}

type MenuAddInput struct {
	MenuName  string // 菜单名称
	ParentId  int64  // 父菜单ID
	OrderNum  int    // 显示顺序
	Component string // 组件路径
	Status    string // 菜单状态（0正常 1停用）
	Perms     string // 权限标识
	Icon      string // 菜单图标
	Visible   string // 菜单状态（0显示 1隐藏）
	Path      string // 路由地址
	MenuType  string // 菜单类型（M目录 C菜单 F按钮）
	IsFrame   string // 是否为外链（0是 1否）
	IsCache   string // 是否缓存（0缓存 1不缓存）
	IsLog     string // 记录日志（0记录，1不记录）
	Remark    string // 备注
	CreateBy  string
	ApiIds    []int64 // 接口列表
}
type MenuEditInput struct {
	MenuId    int64  // 菜单ID
	MenuName  string // 菜单名称
	ParentId  int64  // 父菜单ID
	OrderNum  int    // 显示顺序
	Component string // 组件路径
	Status    string // 菜单状态（0正常 1停用）
	Perms     string // 权限标识
	Icon      string // 菜单图标
	Visible   string // 菜单状态（0显示 1隐藏）
	Path      string // 路由地址
	MenuType  string // 菜单类型（M目录 C菜单 F按钮）
	IsFrame   string // 是否为外链（0是 1否）
	IsCache   string // 是否缓存（0缓存 1不缓存）
	IsLog     string // 记录日志（0记录，1不记录）
	Remark    string // 备注
	UpdateBy  string
	ApiIds    []int64 // 接口列表
}
