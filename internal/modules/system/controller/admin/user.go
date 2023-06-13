package admin

import (
	"context"
	"github.com/gogf/gf/v2/frame/g"
	"github.com/kennylixi/gadmin/internal/consts/mime_type"
	commonModel "github.com/kennylixi/gadmin/internal/modules/common/model"
	commonService "github.com/kennylixi/gadmin/internal/modules/common/service"
	"github.com/kennylixi/gadmin/internal/modules/system/api/v1/admin"
	sysModel "github.com/kennylixi/gadmin/internal/modules/system/model"
	"github.com/kennylixi/gadmin/internal/modules/system/model/entity"
	"github.com/kennylixi/gadmin/internal/modules/system/service"
	"github.com/kennylixi/gadmin/utility/poi"
)

// User 用户管理
var User = cUser{}

type cUser struct{}

// List 获取用户列表
func (c *cUser) List(ctx context.Context, req *admin.UserListReq) (res *admin.UserListRes, err error) {
	out, err := service.User().SelectUserList(ctx, &sysModel.UserListInput{
		DeptId:      req.DeptId,
		UserName:    req.UserName,
		Phonenumber: req.Phonenumber,
		Status:      req.Status,
	})
	if err != nil {
		return
	}
	res = &admin.UserListRes{}
	res.List = out.List
	res.Total = out.Total
	return
}

// Export 导出
func (c *cUser) Export(ctx context.Context, req *admin.UserExportReq) (res *admin.UserExportRes, err error) {
	commonService.BizCtx().SetNoPage(ctx)
	out, err := service.User().SelectUserList(ctx, &sysModel.UserListInput{
		DeptId:      req.DeptId,
		UserName:    req.UserName,
		Phonenumber: req.Phonenumber,
		Status:      req.Status,
	})
	if err != nil {
		return
	}
	e, err := poi.NewExcel(ctx, (*sysModel.UserListItem)(nil))
	if err != nil {
		return
	}
	err = e.ExportExcel(g.NewVar(out.List).Maps(), "用户管理", "")
	return
}

// ImportData 导入数据
func (c *cUser) ImportData(ctx context.Context, req *admin.UserImportDataReq) (res *admin.UserImportDataRes, err error) {
	e, err := poi.NewExcel(ctx, (*sysModel.UserImportMeta)(nil))
	if err != nil {
		return
	}
	file, err := req.File.Open()
	if err != nil {
		return
	}
	datas, err := e.ImportExcel("用户管理", file)
	if err != nil {
		return
	}
	userList := make([]*sysModel.UserImportMeta, 0, len(datas))
	if err = g.NewVar(datas).Scan(&userList); err != nil {
		return
	}
	out, err := service.User().ImportUser(ctx, &sysModel.UserImportUserInput{
		Users:         userList,
		UpdateSupport: req.UpdateSupport,
		OperName:      commonService.BizCtx().GetUserName(ctx),
	})
	if err != nil {
		return
	}
	res = &admin.UserImportDataRes{
		Msg: out.Msg,
	}
	return
}

// ImportTemplate 下载导入模板
func (c *cUser) ImportTemplate(ctx context.Context, req *admin.UserImportTemplateReq) (res *admin.UserImportTemplateRes, err error) {
	e, err := poi.NewExcel(ctx, (*sysModel.UserImportMeta)(nil))
	if err != nil {
		return
	}
	err = e.ExportTemplate("用户管理")
	return
}

// Search 搜索用户列表
func (c *cUser) Search(ctx context.Context, req *admin.UserSearchReq) (res admin.UserSearchRes, err error) {
	out, err := service.User().Search(ctx, &sysModel.UserSearchInput{
		UserName: req.UserName,
	})
	if err != nil {
		return
	}
	res = admin.UserSearchRes(out)
	return
}

// GetInfo 根据用户编号获取详细信息
func (c *cUser) GetInfo(ctx context.Context, req *admin.UserGetInfoReq) (res *admin.UserGetInfoRes, err error) {
	var (
		user    *entity.User
		roles   []*sysModel.Role
		posts   []*entity.Post
		postIds []int64
		roleIds []int64
	)
	roles, err = service.Role().SelectRoleAll(ctx)
	if err != nil {
		return
	}
	if !commonModel.IsAdmin(req.UserId) {
		roleList := make([]*sysModel.Role, 0, len(roles))
		for i, role := range roles {
			if !commonModel.IsAdminRole(role.RoleId) {
				roleList = append(roleList, roles[i])
			}
		}
		roles = roleList
	}

	posts, err = service.Post().SelectPostAll(ctx)
	if err != nil {
		return
	}

	if req.UserId != 0 {
		user, err = service.User().SelectUserById(ctx, req.UserId)
		if err != nil {
			return
		}

		postIds, err = service.Post().SelectPostListByUserId(ctx, req.UserId)
		if err != nil {
			return
		}

		roleIds, err = service.Role().SelectRoleListByUserId(ctx, req.UserId)
		if err != nil {
			return
		}
	}
	res = &admin.UserGetInfoRes{
		User:    user,
		Roles:   roles,
		Posts:   posts,
		PostIds: postIds,
		RoleIds: roleIds,
	}
	return
}

// Add 新增用户
func (c *cUser) Add(ctx context.Context, req *admin.UserAddReq) (res *admin.UserAddRes, err error) {
	err = service.User().Add(ctx, &sysModel.UserAddInput{
		DeptId:      req.DeptId,
		UserName:    req.UserName,
		NickName:    req.NickName,
		Password:    req.Password,
		Email:       req.Email,
		Phonenumber: req.Phonenumber,
		Sex:         req.Sex,
		Status:      req.Status,
		Remark:      req.Remark,
		RoleIds:     req.RoleIds,
		PostIds:     req.PostIds,
		CreateBy:    commonService.BizCtx().GetUserName(ctx),
	})
	return
}

// Edit 修改用户
func (c *cUser) Edit(ctx context.Context, req *admin.UserEditReq) (res *admin.UserEditRes, err error) {
	err = service.User().Edit(ctx, &sysModel.UserEditInput{
		UserId:      req.UserId,
		DeptId:      req.DeptId,
		UserName:    req.UserName,
		NickName:    req.NickName,
		Email:       req.Email,
		Phonenumber: req.Phonenumber,
		Sex:         req.Sex,
		Status:      req.Status,
		Remark:      req.Remark,
		RoleIds:     req.RoleIds,
		PostIds:     req.PostIds,
		UpdateBy:    commonService.BizCtx().GetUserName(ctx),
	})
	return
}

// Delete 删除用户
func (c *cUser) Delete(ctx context.Context, req *admin.UserDeleteReq) (res *admin.UserDeleteRes, err error) {
	err = service.User().DeleteByIds(ctx, req.UserIds)
	return
}

// ResetPwd 重置密码
func (c *cUser) ResetPwd(ctx context.Context, req *admin.UserResetPwdReq) (res *admin.UserResetPwdRes, err error) {
	err = service.User().CheckUserAllowed(req.UserId)
	if err != nil {
		return
	}

	err = service.User().ResetPwd(ctx, &sysModel.UserResetPwdInput{
		UserId:   req.UserId,
		Password: req.Password,
		UpdateBy: commonService.BizCtx().GetUserName(ctx),
	})
	return
}

// ChangeStatus 状态修改
func (c *cUser) ChangeStatus(ctx context.Context, req *admin.UserChangeStatusReq) (res *admin.UserChangeStatusRes, err error) {
	err = service.User().CheckUserAllowed(req.UserId)
	if err != nil {
		return
	}

	err = service.User().UpdateStatus(ctx, &sysModel.UserUpdateStatusInput{
		UserId:   req.UserId,
		Status:   req.Status,
		UpdateBy: commonService.BizCtx().GetUserName(ctx),
	})
	return
}

// GetDeptTree 获取部门树列表
func (c *cUser) GetDeptTree(ctx context.Context, req *admin.UserGetDeptTreeReq) (res admin.UserGetDeptTreeRes, err error) {
	res, err = service.Dept().SelectDeptTreeList(ctx, nil)
	return
}

// AuthRole 根据用户编号获取授权角色
func (c *cUser) AuthRole(ctx context.Context, req *admin.UserAuthRoleReq) (res *admin.UserAuthRoleRes, err error) {
	user, err := service.User().SelectUserById(ctx, req.UserId)
	if err != nil {
		return
	}
	allRoles, err := service.Role().SelectAllRolesByUserId(ctx, req.UserId)
	if err != nil {
		return
	}
	res = &admin.UserAuthRoleRes{
		User:  user,
		Roles: allRoles,
	}
	if commonModel.IsAdmin(user.UserId) {
		return
	}
	roles := make([]*sysModel.Role, 0, len(allRoles))
	for _, role := range allRoles {
		if !commonModel.IsAdminRole(role.RoleId) {
			roles = append(roles, role)
		}
	}
	return
}

// InsertAuthRole 用户授权角色
func (c *cUser) InsertAuthRole(ctx context.Context, req *admin.UserInsertAuthRoleReq) (res *admin.UserInsertAuthRoleRes, err error) {
	if err = service.User().CheckUserDataScope(ctx, req.UserId); err != nil {
		return
	}

	err = service.User().InsertUserRole(ctx, req.UserId, req.RoleIds)
	return
}

// GetProfile 获取用户资料
func (c *cUser) GetProfile(ctx context.Context, req *admin.UserGetProfileReq) (res *admin.UserGetProfileRes, err error) {
	userId := commonService.BizCtx().GetUserId(ctx)
	user, err := service.User().SelectUserById(ctx, userId)
	if err != nil {
		return
	}
	dept, err := service.Dept().SelectDeptById(ctx, user.DeptId)
	if err != nil {
		return
	}
	roleGroup, err := service.User().SelectUserRoleGroup(ctx, user.UserName)
	if err != nil {
		return
	}
	postGroup, err := service.User().SelectUserPostGroup(ctx, user.UserName)
	if err != nil {
		return
	}
	res = &admin.UserGetProfileRes{
		UserName:    user.UserName,
		NickName:    user.NickName,
		Email:       user.Email,
		Phonenumber: user.Phonenumber,
		Sex:         user.Sex,
		Avatar:      user.Avatar,
		CreatedAt:   user.CreatedAt,
		DeptName:    dept.DeptName,
		RoleGroup:   roleGroup,
		PostGroup:   postGroup,
	}
	return
}

// UpdateProfile 更新用户资料
func (c *cUser) UpdateProfile(ctx context.Context, req *admin.UserUpdateProfileReq) (res *admin.UserUpdateProfileRes, err error) {
	err = service.User().UpdateProfile(ctx, &sysModel.UserUpdateProfileInput{
		UserId:      req.UserId,
		NickName:    req.NickName,
		Email:       req.Email,
		Phonenumber: req.Phonenumber,
		Sex:         req.Sex,
		UpdateBy:    commonService.BizCtx().GetUserName(ctx),
	})
	// TODO 更新token
	return
}

// UpdatePwd 更新用户密码
func (c *cUser) UpdatePwd(ctx context.Context, req *admin.UserUpdatePwdReq) (res *admin.UserUpdatePwdRes, err error) {
	err = service.User().UpdatePwd(ctx, &sysModel.UserUpdatePwdInput{
		UserId:      commonService.BizCtx().GetUserId(ctx),
		OldPassword: req.OldPassword,
		NewPassword: req.NewPassword,
		UpdateBy:    commonService.BizCtx().GetUserName(ctx),
	})
	// TODO 更新token
	return
}

// Avatar 头像上传
func (c *cUser) Avatar(ctx context.Context, req *admin.UserAvatarReq) (res *admin.UserAvatarRes, err error) {
	fileInfo, err := service.File().Upload(ctx, &sysModel.FileUploadInput{
		File:             req.Avatarfile,
		AllowedExtension: mime_type.ImageExtension,
	})
	if err != nil {
		return nil, err
	}
	err = service.User().UpdateUserAvatar(ctx, &sysModel.UserUpdateAvatarInput{
		UserId: commonService.BizCtx().GetUserId(ctx),
		Avatar: fileInfo.FileName,
	})

	// TODO 更新token

	res = &admin.UserAvatarRes{
		ImgUrl: fileInfo.FileName,
	}
	return
}
