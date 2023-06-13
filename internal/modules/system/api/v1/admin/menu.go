package admin

import (
	"github.com/gogf/gf/v2/frame/g"
	commonModel "github.com/kennylixi/gadmin/internal/modules/common/model"
	"github.com/kennylixi/gadmin/internal/modules/system/model"
)

type MenuListReq struct {
	g.Meta   `path:"/menu/list" tags:"菜单管理" method:"get" summary:"获取菜单列表"`
	MenuName string // 菜单名称
	Status   string // 菜单状态（0正常 1停用）
}
type MenuListRes []*model.Menu

type MenuGetInfoReq struct {
	g.Meta `path:"/menu/{MenuId}" tags:"菜单管理" method:"get" summary:"获取菜单详情"`
	MenuId int64
}
type MenuGetInfoRes model.Menu

type MenuTreeselectReq struct {
	g.Meta `path:"/menu/treeselect" tags:"菜单管理" method:"get" summary:"获取菜单下拉树列表"`
}
type MenuTreeselectRes []*commonModel.TreeSelect

type MenuRoleMenuTreeselectReq struct {
	g.Meta `path:"/menu/roleMenuTreeselect/{RoleId}" tags:"菜单管理" method:"get" summary:"获取对应角色菜单列表树"`
	RoleId int64
}
type MenuRoleMenuTreeselectRes struct {
	CheckedKeys []int64                   `json:"checkedKeys"`
	Menus       []*commonModel.TreeSelect `json:"menus"`
}

type MenuAddReq struct {
	g.Meta    `path:"/menu" tags:"菜单管理" method:"post" summary:"新增菜单"`
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
	Remark    string
	ApiIds    []int64 // 接口列表
}
type MenuAddRes struct{}

type MenuEditReq struct {
	g.Meta `path:"/menu" tags:"菜单管理" method:"put" summary:"修改菜单"`
	MenuAddReq
	MenuId int64 // 菜单ID
}
type MenuEditRes struct{}

type MenuDeleteReq struct {
	g.Meta `path:"/menu/{MenuId}" tags:"菜单管理" method:"delete" summary:"删除菜单"`
	MenuId int64
}
type MenuDeleteRes struct{}
