package admin

import (
	"github.com/gogf/gf/v2/frame/g"
	commonModel "github.com/kennylixi/gadmin/internal/modules/common/model"
	"github.com/kennylixi/gadmin/internal/modules/system/model"
	"github.com/kennylixi/gadmin/internal/modules/system/model/entity"
)

type RoleListReq struct {
	g.Meta   `path:"/role/list" tags:"角色管理" method:"get" summary:"获取角色列表"`
	RoleName string // 角色名称
	RoleKey  string // 角色权限字符串
	Status   string // 角色状态（0正常 1停用）
}
type RoleListRes struct {
	List  []*model.RoleListItem `json:"list"`  // 列表
	Total int                   `json:"total"` // 数据总数
}

// RoleExportReq 导出Excel数据
type RoleExportReq struct {
	g.Meta   `path:"/role/export" tags:"角色管理" method:"post" summary:"导出Excel数据"`
	RoleName string // 角色名称
	RoleKey  string // 角色权限字符串
	Status   string // 角色状态（0正常 1停用）
}
type RoleExportRes struct {
}

type RoleGetInfoReq struct {
	g.Meta `path:"/role/{RoleId}" tags:"角色管理" method:"get" summary:"获取角色详情"`
	RoleId int64
}
type RoleGetInfoRes struct {
	*entity.Role
}

type RoleAddReq struct {
	g.Meta            `path:"/role" tags:"角色管理" method:"post" summary:"新增角色详情"`
	RoleName          string  // 角色名称
	RoleKey           string  // 角色权限字符串
	RoleSort          int     // 显示顺序
	MenuCheckStrictly int     // 菜单树选择项是否关联显示
	ApiCheckStrictly  int     // 接口树选择项是否关联显示
	DeptCheckStrictly int     // 部门树选择项是否关联显示（0：父子不互相关联显示 1：父子互相关联显示 ）
	Status            string  // 角色状态（0正常 1停用）
	Remark            string  // 备注
	MenuIds           []int64 // 菜单组
	ApiIds            []int64 // 接口组
}
type RoleAddRes struct{}

type RoleEditReq struct {
	g.Meta            `path:"/role" tags:"角色管理" method:"put" summary:"修改角色详情"`
	RoleId            int64   // 角色ID
	RoleName          string  // 角色名称
	RoleKey           string  // 角色权限字符串
	RoleSort          int     // 显示顺序
	MenuCheckStrictly int     // 菜单树选择项是否关联显示
	ApiCheckStrictly  int     // 接口树选择项是否关联显示
	DeptCheckStrictly int     // 部门树选择项是否关联显示（0：父子不互相关联显示 1：父子互相关联显示 ）
	Status            string  // 角色状态（0正常 1停用）
	Remark            string  // 备注
	MenuIds           []int64 // 菜单组
	ApiIds            []int64 // 接口组
}
type RoleEditRes struct{}

type RoleDataScopeReq struct {
	g.Meta    `path:"/role/dataScope" tags:"角色管理" method:"put" summary:"修改角色数据权限"`
	RoleId    int64
	DeptIds   []int64 // 部门组（数据权限）
	DataScope int     // 数据权限
}
type RoleDataScopeRes struct{}

type RoleChangeStatusReq struct {
	g.Meta `path:"/role/changeStatus" tags:"角色管理" method:"put" summary:"修改角色状态"`
	RoleId int64  // 角色ID
	Status string // 状态
}
type RoleChangeStatusRes struct{}

type RoleDeleteReq struct {
	g.Meta  `path:"/role" tags:"角色管理" method:"delete" summary:"删除角色"`
	RoleIds []int64
}
type RoleDeleteRes struct{}

type RoleOptionselectReq struct {
	g.Meta `path:"/role/optionselect" tags:"角色管理" method:"get" summary:"获取角色选择框列表"`
}
type RoleOptionselectRes []*model.Role

// RoleDeptTreeReq 获取对应角色部门树列表
type RoleDeptTreeReq struct {
	g.Meta `path:"/role/deptTree/{RoleId}" tags:"角色管理" method:"get" summary:"获取对应角色部门树列表"`
	RoleId int64
}
type RoleDeptTreeRes struct {
	CheckedKeys []int64                   `json:"checkedKeys"`
	Depts       []*commonModel.TreeSelect `json:"depts"`
}

// RoleAllocatedListReq 查询已分配用户角色列表
type RoleAllocatedListReq struct {
	g.Meta      `path:"/role/authUser/allocatedList" in:"query" tags:"角色管理" method:"get" summary:"查询已分配用户角色列表"`
	RoleId      int64
	UserName    string
	Phonenumber string
}
type RoleAllocatedListRes struct {
	List  []*model.UserListItem `json:"list"`  // 列表
	Total int                   `json:"total"` // 数据总数
}

// RoleUnallocatedListReq 查询未分配用户角色列表
type RoleUnallocatedListReq struct {
	g.Meta      `path:"/role/authUser/unallocatedList" in:"query" tags:"角色管理" method:"get" summary:"查询未分配用户角色列表"`
	RoleId      int64
	UserName    string
	Phonenumber string
}
type RoleUnallocatedListRes struct {
	List  []*model.UserListItem `json:"list"`  // 列表
	Total int                   `json:"total"` // 数据总数
}

// RoleSelectAuthUserAllReq 批量选择用户授权
type RoleSelectAuthUserAllReq struct {
	g.Meta  `path:"/role/authUser/selectAll" tags:"角色管理" method:"put" summary:"批量选择用户授权"`
	RoleId  int64
	UserIds []int64
}
type RoleSelectAuthUserAllRes struct {
}

// RoleCancelAuthUserAllReq 批量取消授权用户
type RoleCancelAuthUserAllReq struct {
	g.Meta  `path:"/role/authUser/cancelAll" tags:"角色管理" method:"put" summary:"批量取消授权用户"`
	RoleId  int64
	UserIds []int64
}
type RoleCancelAuthUserAllRes struct {
}

// RoleCancelAuthUserReq 取消授权用户
type RoleCancelAuthUserReq struct {
	g.Meta `path:"/role/authUser/cancel" in:"query" tags:"角色管理" method:"put" summary:"取消授权用户"`
	RoleId int64
	UserId int64
}
type RoleCancelAuthUserRes struct {
}
