package admin

import (
	"github.com/gogf/gf/v2/frame/g"
	"github.com/gogf/gf/v2/net/ghttp"
	"github.com/gogf/gf/v2/os/gtime"
	commonModel "github.com/kennylixi/gadmin/internal/modules/common/model"
	"github.com/kennylixi/gadmin/internal/modules/system/model"
	"github.com/kennylixi/gadmin/internal/modules/system/model/entity"
)

type UserListReq struct {
	g.Meta      `path:"/user/list" tags:"用户管理" method:"get" summary:"获取用户列表"`
	DeptId      int64  // 部门ID
	UserName    string // 用户名称
	Phonenumber string // 手机号码
	Status      string // 帐号状态（0正常 1停用）
}

type UserListRes struct {
	List  []*model.UserListItem `json:"list"`  // 列表
	Total int                   `json:"total"` // 数据总数
}

// UserExportReq 导出Excel数据
type UserExportReq struct {
	g.Meta      `path:"/user/export" tags:"用户管理" method:"post" summary:"导出Excel数据"`
	UserId      int64  // 用户ID
	DeptId      int64  // 部门ID
	UserName    string // 用户名称
	Phonenumber string // 手机号码
	Status      string // 帐号状态（0正常 1停用）
}
type UserExportRes struct {
}

// UserImportDataReq 导入Excel数据
type UserImportDataReq struct {
	g.Meta        `path:"/user/importData" tags:"用户管理" method:"post" mime:"multipart/form-data" summary:"导入Excel数据"`
	File          *ghttp.UploadFile `type:"file" v:"required#请上传Excel文件"`
	UpdateSupport bool
}
type UserImportDataRes struct {
	Msg string `json:"msg"`
}

// UserImportTemplateReq 导出Excel模板
type UserImportTemplateReq struct {
	g.Meta `path:"/user/importTemplate" tags:"用户管理" method:"post" summary:"导出Excel模板"`
}
type UserImportTemplateRes struct {
}

type UserSearchReq struct {
	g.Meta   `path:"/user/search" tags:"用户管理" method:"get" summary:"获取用户列表"`
	UserName string // 用户名称
}

type UserSearchRes []*model.UserListItem

type UserGetInfoReq struct {
	g.Meta `path:"/user/{UserId}" tags:"用户管理" method:"get" summary:"获取用户详情"`
	UserId int64 `in:"path"`
}
type UserGetInfoRes struct {
	User    *entity.User   `json:"user"`
	Roles   []*model.Role  `json:"roles"`
	Posts   []*entity.Post `json:"posts"`
	PostIds []int64        `json:"postIds"`
	RoleIds []int64        `json:"roleIds"`
}

type UserAddReq struct {
	g.Meta      `path:"/user" tags:"用户管理" method:"post" summary:"新增用户"`
	DeptId      int64   `json:"deptId"`      // 部门ID
	PostIds     []int64 `json:"postIds"`     // 岗位
	RoleIds     []int64 `json:"roleIds"`     // 角色
	UserName    string  `json:"userName"`    // 用户账号
	NickName    string  `json:"nickName"`    // 用户昵称
	Email       string  `json:"email"`       // 用户邮箱
	Phonenumber string  `json:"phonenumber"` // 手机号码
	Sex         string  `json:"sex"`         // 用户性别（0男 1女 2未知）
	Password    string  `json:"password"`    // 密码
	Status      string  `json:"status"`      // 帐号状态（0正常 1停用）
	Remark      string  `json:"remark"`      // 备注
}
type UserAddRes struct{}

type UserEditReq struct {
	g.Meta `path:"/user" tags:"用户管理" method:"put" summary:"修改用户"`
	UserAddReq
	UserId int64 `json:"userId"` // 用户ID
}
type UserEditRes struct{}

type UserDeleteReq struct {
	g.Meta  `path:"/user" tags:"用户管理" method:"delete" summary:"删除用户"`
	UserIds []int64
}
type UserDeleteRes struct{}

type UserResetPwdReq struct {
	g.Meta   `path:"/user/resetPwd" tags:"用户管理" method:"put" summary:"修改用户密码"`
	UserId   int64  `json:"userId"`
	Password string `json:"password"`
}
type UserResetPwdRes struct{}

type UserChangeStatusReq struct {
	g.Meta `path:"/user/changeStatus" tags:"用户管理" method:"put" summary:"修改用户状态"`
	UserId int64  `json:"userId"`
	Status string `json:"status"`
}
type UserChangeStatusRes struct{}

// UserGetDeptTreeReq 获取部门树列表
type UserGetDeptTreeReq struct {
	g.Meta `path:"/user/deptTree" tags:"用户管理" method:"get" summary:"获取部门树列表"`
}
type UserGetDeptTreeRes []*commonModel.TreeSelect

// UserAuthRoleReq 根据用户编号获取授权角色
type UserAuthRoleReq struct {
	g.Meta `path:"/user/authRole/{UserId}" tags:"用户管理" method:"get" summary:"根据用户编号获取授权角色"`
	UserId int64
}
type UserAuthRoleRes struct {
	User  *entity.User  `json:"user"`
	Roles []*model.Role `json:"roles"`
}

// UserInsertAuthRoleReq 用户授权角色
type UserInsertAuthRoleReq struct {
	g.Meta  `path:"/user/authRole" tags:"用户管理" method:"put" summary:"用户授权角色"`
	UserId  int64
	RoleIds []int64
}
type UserInsertAuthRoleRes struct {
}

// UserGetProfileReq 获取个人信息
type UserGetProfileReq struct {
	g.Meta `path:"/user/profile" tags:"用户管理" method:"get" summary:"获取个人信息"`
}
type UserGetProfileRes struct {
	UserName    string      `json:"userName"`    // 用户账号
	NickName    string      `json:"nickName"`    // 用户昵称
	Email       string      `json:"email"`       // 用户邮箱
	Phonenumber string      `json:"phonenumber"` // 手机号码
	Sex         string      `json:"sex"`         // 用户性别（0男 1女 2未知）
	Avatar      string      `json:"avatar"`      // 头像地址
	CreatedAt   *gtime.Time `json:"createdAt"`   // 创建时间
	DeptName    string      `json:"deptName"`
	RoleGroup   string      `json:"roleGroup"`
	PostGroup   string      `json:"postGroup"`
}

// UserUpdateProfileReq 更新个人信息
type UserUpdateProfileReq struct {
	g.Meta      `path:"/user/profile" tags:"用户管理" method:"put" summary:"更新个人信息"`
	UserId      int64  // 用户ID
	NickName    string // 用户昵称
	Email       string // 用户邮箱
	Phonenumber string // 手机号码
	Sex         string // 用户性别（0男 1女 2未知）
}
type UserUpdateProfileRes struct {
}

// UserUpdatePwdReq 更新密码
type UserUpdatePwdReq struct {
	g.Meta      `path:"/user/profile/updatePwd" tags:"用户管理" method:"put" summary:"修改密码"`
	OldPassword string `json:"oldPassword"`
	NewPassword string `json:"newPassword"`
}
type UserUpdatePwdRes struct{}

// UserAvatarReq 头像上传
type UserAvatarReq struct {
	g.Meta     `path:"/user/profile/avatar" tags:"用户管理" method:"post" mime:"multipart/form-data" summary:"头像上传"`
	Avatarfile *ghttp.UploadFile
}
type UserAvatarRes struct {
	ImgUrl string `json:"imgUrl"`
}
