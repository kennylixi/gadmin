package model

import (
	"github.com/gogf/gf/v2/os/gtime"
	"github.com/kennylixi/gadmin/internal/modules/system/model/entity"
)

// User 用户数据
type User struct {
	*entity.User
	Dept    *entity.Dept   // 部门对象
	Roles   []*entity.Role // 角色对象
	RoleIds []int64        // 角色组
	PostIds []int64        // 岗位组
}

// UserImportMeta 用户数据导入
type UserImportMeta struct {
	UserId      int64  `json:"userId"      meta:"name|用户序号;cellType|0"`                             // 用户ID
	DeptId      int64  `json:"deptId"      meta:"name|部门编号"`                                        // 部门ID
	UserName    string `json:"userName"    meta:"name|登录名称"`                                        // 用户账号
	NickName    string `json:"nickName"    meta:"name|用户名称"`                                        // 用户昵称
	Email       string `json:"email"       meta:"name|用户邮箱"`                                        // 用户邮箱
	Phonenumber string `json:"phonenumber" meta:"name|手机号码"`                                        //手机号码
	Status      string `json:"status"      meta:"name|帐号状态;readConverterExp|0=正常,1=停用;combo|正常,停用"` // 帐号状态（0正常 1停用）
}

// UserListItem 用户数据列表数据项
type UserListItem struct {
	UserId      int64       `json:"userId"      meta:"name|用户序号;cellType|0"`                                 // 用户ID
	DeptId      int64       `json:"deptId"`                                                                  // 部门ID
	UserName    string      `json:"userName"    meta:"name|登录名称"`                                            // 用户账号
	NickName    string      `json:"nickName"    meta:"name|用户名称"`                                            // 用户昵称
	Email       string      `json:"email"       meta:"name|用户邮箱"`                                            // 用户邮箱
	Phonenumber string      `json:"phonenumber" meta:"name|手机号码"`                                            //手机号码
	Status      string      `json:"status"      meta:"name|帐号状态;readConverterExp|0=正常,1=停用;combo|正常,停用"`     // 帐号状态（0正常 1停用）
	DeptName    string      `json:"deptName"    meta:"name|部门名称"`                                            // 部门名称
	Sex         string      `json:"sex"         meta:"name|用户性别;readConverterExp|0=男,1=女,2=未知;combo|男,女,未知"` // 用户性别（0男 1女 2未知）
	LoginIp     string      `json:"loginIp"     meta:"name|最后登录IP"`                                          // 最后登录IP
	LoginDate   *gtime.Time `json:"loginDate"   meta:"name|最后登录时间;width|25;dateFormat|Y-m-d H:i:s"`          // 最后登录时间
	Avatar      string      `json:"avatar"`                                                                  // 头像地址
	CreatedAt   *gtime.Time `json:"createdAt"`                                                               // 创建时间
}

// UserListInput 查询用户列表入参
type UserListInput struct {
	UserId      int64  // 用户ID
	DeptId      int64  // 部门ID
	UserName    string // 用户名称
	Phonenumber string // 手机号码
	Status      string // 帐号状态（0正常 1停用）
}
type UserListOutput struct {
	List  []*UserListItem `json:"list"`  // 列表
	Total int             `json:"total"` // 数据总数
}

// UserSearchInput 根据用户名搜索用户列表入参
type UserSearchInput struct {
	UserName string // 用户名称
}
type UserSearchOutput []*UserListItem

// UserImportUserInput 导入用户数据
type UserImportUserInput struct {
	Users         []*UserImportMeta
	UpdateSupport bool
	OperName      string // 当前操作者
}
type UserImportUserOutput struct {
	Msg string
}

// UserAddInput 新增用户基本信息
type UserAddInput struct {
	DeptId      int64   // 部门ID
	NickName    string  // 用户昵称
	UserName    string  // 用户账号
	UserType    string  // 用户类型
	Password    string  // 密码
	Email       string  // 用户邮箱
	Phonenumber string  // 手机号码
	Sex         string  // 用户性别（0男 1女 2未知）
	Status      string  // 帐号状态（0正常 1停用）
	CreateBy    string  // 创建者
	Remark      string  // 备注"`
	RoleIds     []int64 // 角色组
	PostIds     []int64 // 岗位组
}

// UserEditInput 修改用户基本信息
type UserEditInput struct {
	UserId      int64   // 用户ID
	DeptId      int64   // 部门ID
	NickName    string  // 用户昵称
	UserName    string  // 用户账号
	UserType    string  // 用户类型
	Email       string  // 用户邮箱
	Phonenumber string  // 手机号码
	Sex         string  // 用户性别（0男 1女 2未知）
	Status      string  // 帐号状态（0正常 1停用）
	UpdateBy    string  // 创建者
	Remark      string  // 备注"`
	RoleIds     []int64 // 角色组
	PostIds     []int64 // 岗位组
}

// UserUpdateProfileInput 修改用户基本信息
type UserUpdateProfileInput struct {
	UserId      int64  // 用户ID
	NickName    string // 用户昵称
	Email       string // 用户邮箱
	Phonenumber string // 手机号码
	Sex         string // 用户性别（0男 1女 2未知）
	UpdateBy    string // 更新者
}

// UserUpdateAvatarInput 修改用户头像入参
type UserUpdateAvatarInput struct {
	UserId int64
	Avatar string
}

// UserUpdateStatusInput 修改用户状态入参
type UserUpdateStatusInput struct {
	UserId   int64
	Status   string
	UpdateBy string
}

// UserResetPwdInput 重置用户密码入参
type UserResetPwdInput struct {
	UserId   int64
	Password string
	UpdateBy string
}

// UserResetUserPwdInput 重置用户密码入参
type UserResetUserPwdInput struct {
	UserName string
	Password string
	UpdateBy string
}

// UserUpdatePwdInput 修改密码
type UserUpdatePwdInput struct {
	UserId      int64
	OldPassword string
	NewPassword string
	UpdateBy    string
}

// UserUpdateLoginInfoInput 修改登录信息
type UserUpdateLoginInfoInput struct {
	UserId    int64
	LoginDate *gtime.Time
	LoginIp   string
}

// UserSelectAllocatedListInput 查询已分配用户角色列表
type UserSelectAllocatedListInput struct {
	RoleId      int64
	UserName    string
	Phonenumber string
}
type UserSelectAllocatedListOutput struct {
	List  []*UserListItem `json:"list"`  // 列表
	Total int             `json:"total"` // 数据总数
}

// UserSelectUnallocatedListInput 查询未分配用户角色列表
type UserSelectUnallocatedListInput struct {
	RoleId      int64
	UserName    string
	Phonenumber string
}
type UserSelectUnallocatedListOutput struct {
	List  []*UserListItem `json:"list"`  // 列表
	Total int             `json:"total"` // 数据总数
}
