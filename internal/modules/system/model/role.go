package model

import (
	"github.com/gogf/gf/v2/os/gtime"
	"github.com/kennylixi/gadmin/internal/modules/system/model/entity"
)

type Role struct {
	entity.Role
	MenuIds []int64 `json:"menuIds"` // 菜单组
	Flag    bool    `json:"flag"`    //用户是否存在此角色标识 默认不存在
}

// RoleListInput 查询角色列表
type RoleListInput struct {
	RoleName string // 角色名称
	RoleKey  string // 角色权限字符串
	Status   string // 角色状态（0正常 1停用）
}
type RoleListOutput struct {
	List  []*RoleListItem `json:"list"`  // 列表
	Total int             `json:"total"` // 数据总数
}

// RoleListItem 角色列表数据项
type RoleListItem struct {
	RoleId    int64       `json:"roleId" meta:"name|角色编号;cellType|0"`                             // 角色ID
	RoleName  string      `json:"roleName" meta:"name|角色名称"`                                      // 角色名称
	RoleKey   string      `json:"roleKey" meta:"name|角色名称"`                                       // 角色权限字符串
	RoleSort  int         `json:"roleSort" meta:"name|角色名称"`                                      // 显示顺序
	Status    string      `json:"status" meta:"name|帐号状态;readConverterExp|0=正常,1=停用;combo|正常,停用"` // 角色状态（0正常 1停用）
	CreatedAt *gtime.Time `json:"createdAt" meta:"name|创建时间;width|25;dateFormat|Y-m-d H:i:s"`
}

// RoleAddInput 添加角色参数结构
type RoleAddInput struct {
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
	CreateBy          string  //创建者
}

// RoleEditInput 修改角色参数结构
type RoleEditInput struct {
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
	UpdateBy          string  //创建者
}
