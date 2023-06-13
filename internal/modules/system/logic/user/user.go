package user

import (
	"context"
	"fmt"
	"github.com/gogf/gf/v2/database/gdb"
	"github.com/gogf/gf/v2/errors/gerror"
	"github.com/gogf/gf/v2/frame/g"
	"github.com/kennylixi/gadmin/internal/consts"
	"github.com/kennylixi/gadmin/internal/consts/cache_consts"
	commonModel "github.com/kennylixi/gadmin/internal/modules/common/model"
	commonService "github.com/kennylixi/gadmin/internal/modules/common/service"
	"github.com/kennylixi/gadmin/internal/modules/system/dao"
	"github.com/kennylixi/gadmin/internal/modules/system/model"
	"github.com/kennylixi/gadmin/internal/modules/system/model/do"
	"github.com/kennylixi/gadmin/internal/modules/system/model/entity"
	sysService "github.com/kennylixi/gadmin/internal/modules/system/service"
	"strings"
)

type sUser struct{}

func init() {
	sysService.RegisterUser(New())
}

func New() *sUser {
	return &sUser{}
}

// SelectUserList 根据条件分页查询用户列表
func (s *sUser) SelectUserList(ctx context.Context, in *model.UserListInput) (out *model.UserListOutput, err error) {
	out = &model.UserListOutput{}
	out.List, out.Total, err = dao.User.SelectUserList(ctx, &entity.User{
		DeptId:      in.DeptId,
		UserName:    in.UserName,
		Phonenumber: in.Phonenumber,
		Status:      in.Status,
	})
	return
}

// Search 根据用户名模糊搜索用户列表
func (s *sUser) Search(ctx context.Context, in *model.UserSearchInput) (out model.UserSearchOutput, err error) {
	out, err = dao.User.Search(ctx, &entity.User{
		UserName: in.UserName,
	})
	return
}

// ImportUser 导入用户数据
func (s *sUser) ImportUser(ctx context.Context, in *model.UserImportUserInput) (out *model.UserImportUserOutput, err error) {
	if g.IsEmpty(in.Users) {
		err = gerror.New("导入用户数据不能为空！")
		return
	}
	successNum, failureNum := 0, 0
	var (
		successMsg strings.Builder
		failureMsg strings.Builder
	)
	password, err := sysService.Config().GetByConfigKey(ctx, "sys.user.initPassword")
	if err != nil {
		return
	}
	password, err = commonService.Password().HashPassword(ctx, password)
	if err != nil {
		return
	}
	var user *entity.User
	for _, meta := range in.Users {
		// 验证是否存在这个用户
		user, err = s.SelectUserByUserName(ctx, meta.UserName)
		if err != nil {
			return
		}
		if user == nil {
			err = s.Add(ctx, &model.UserAddInput{
				DeptId:      meta.DeptId,
				NickName:    meta.NickName,
				UserName:    meta.UserName,
				Password:    password,
				Email:       meta.Email,
				Phonenumber: meta.Phonenumber,
				Status:      meta.Status,
				CreateBy:    in.OperName,
			})
			if err == nil {
				successNum += 1
				successMsg.WriteString(fmt.Sprintf("<br/>%d、账号 %s 导入成功", successNum, meta.UserName))
			}
		} else if in.UpdateSupport {
			if err = s.CheckUserAllowed(user.UserId); err == nil {
				if err = s.CheckUserDataScope(ctx, user.UserId); err == nil {
					err = s.Edit(ctx, &model.UserEditInput{
						UserId:      meta.UserId,
						DeptId:      meta.DeptId,
						NickName:    meta.NickName,
						UserName:    meta.UserName,
						Email:       meta.Email,
						Phonenumber: meta.Phonenumber,
						Status:      meta.Status,
						UpdateBy:    in.OperName,
					})
					if err == nil {
						successNum += 1
						successMsg.WriteString(fmt.Sprintf("<br/>%d、账号 %s 导入成功", successNum, meta.UserName))
					}
				}
			}
		} else {
			failureNum += 1
			failureMsg.WriteString(fmt.Sprintf("<br/>%d、账号 %s 已存在", failureNum, meta.UserName))
		}
		if err != nil {
			failureNum += 1
			failureMsg.WriteString(fmt.Sprintf("<br/>%d、账号 %s 导入失败: %v", failureNum, meta.UserName, err.Error()))
			g.Log().Error(ctx, err)
		}
	}

	out = &model.UserImportUserOutput{}
	if failureNum > 0 {
		out.Msg = fmt.Sprintf("很抱歉，导入失败！共 %d 条数据格式不正确，错误如下：%s", failureNum, failureMsg.String())
	} else {
		out.Msg = fmt.Sprintf("恭喜您，数据已全部导入成功！共 %d 条，数据如下：%s", successNum, successMsg.String())
	}
	return
}

// SelectUserByUserName 通过用户名查询用户
func (s *sUser) SelectUserByUserName(ctx context.Context, userName string) (*entity.User, error) {
	return dao.User.SelectUserByUserName(ctx, userName)
}

// SelectUserByUserNameAndPwd 通过用户名和密码查询用户
func (s *sUser) SelectUserByUserNameAndPwd(ctx context.Context, userName, pwd string) (*entity.User, error) {
	return dao.User.SelectUserByUserNameAndPwd(ctx, userName, pwd)
}

// SelectUserById 通过用户ID查询用户
func (s *sUser) SelectUserById(ctx context.Context, userId int64) (*entity.User, error) {
	return dao.User.SelectUserById(ctx, userId)
}

// SelectUserDetailById 通过用户ID查询用户详细数据，包括部门、角色、岗位等信息
func (s *sUser) SelectUserDetailById(ctx context.Context, userId int64) (*model.User, error) {
	return dao.User.SelectUserDetailById(ctx, userId)
}

// SelectUserDetailByUserName 通过用户ID查询用户详细数据，包括部门、角色、岗位等信息
func (s *sUser) SelectUserDetailByUserName(ctx context.Context, userName string) (*model.User, error) {
	return dao.User.SelectUserDetailByUserName(ctx, userName)
}

// SelectUserRoleGroup 根据用户ID查询用户所属角色组
func (s *sUser) SelectUserRoleGroup(ctx context.Context, userName string) (string, error) {
	roles, err := dao.Role.SelectRolesByUserName(ctx, userName)
	if err != nil {
		return "", err
	}
	var idsStr string
	for _, role := range roles {
		idsStr = idsStr + role.RoleName + ","
	}
	if len(idsStr) > 0 {
		idsStr = idsStr[:len(idsStr)-1]
	}
	return idsStr, nil
}

// SelectUserPostGroup 根据用户ID查询用户所属岗位组
func (s *sUser) SelectUserPostGroup(ctx context.Context, userName string) (string, error) {
	posts, err := dao.Post.SelectPostsByUserName(ctx, userName)
	if err != nil {
		return "", err
	}
	var idsStr string
	for _, post := range posts {
		idsStr = idsStr + post.PostName + ","
	}
	if len(idsStr) > 0 {
		idsStr = idsStr[:len(idsStr)-1]
	}
	return idsStr, nil
}

// CheckUserNameUnique 校验用户名称是否唯一
func (s *sUser) CheckUserNameUnique(ctx context.Context, userName string) (bool, error) {
	count, err := dao.User.CheckUserNameUnique(ctx, userName)
	if err != nil {
		return false, err
	}
	if count > 0 {
		return false, nil
	}
	return true, nil
}

// CheckPhoneUnique 校验手机号码是否唯一
func (s *sUser) CheckPhoneUnique(ctx context.Context, phone string, userId ...int64) (bool, error) {
	uid := int64(-1)
	if len(userId) > 0 {
		uid = userId[0]
	}
	user, err := dao.User.CheckPhoneUnique(ctx, phone)
	if err != nil {
		return false, err
	}
	if user != nil && user.UserId != uid {
		return false, nil
	}
	return true, nil
}

// CheckEmailUnique 校验email是否唯一
func (s *sUser) CheckEmailUnique(ctx context.Context, email string, userId ...int64) (bool, error) {
	uid := int64(-1)
	if len(userId) > 0 {
		uid = userId[0]
	}
	user, err := dao.User.CheckEmailUnique(ctx, email)
	if err != nil {
		return false, err
	}
	if user != nil && user.UserId != uid {
		return false, nil
	}
	return true, nil
}

// CheckUserAllowed 校验用户是否允许操作
func (s *sUser) CheckUserAllowed(userId int64) error {
	if commonModel.IsAdmin(userId) {
		return gerror.New("不允许操作超级管理员用户")
	}
	return nil
}

// Add 新增用户信息
func (s *sUser) Add(ctx context.Context, in *model.UserAddInput) error {
	casbin := sysService.Casbin().Casbin(ctx)
	err := dao.User.Transaction(ctx, func(ctx context.Context, tx gdb.TX) error {
		pwd, err := commonService.Password().HashPassword(ctx, in.Password)
		if err != nil {
			return gerror.Wrap(err, "新增用户失败")
		}
		userId, err := dao.User.Add(ctx, &do.User{
			DeptId:   in.DeptId,
			UserName: in.UserName,
			NickName: in.NickName,
			//UserType:    in.UserType,
			Password:    pwd,
			Email:       in.Email,
			Phonenumber: in.Phonenumber,
			Sex:         in.Sex,
			Status:      in.Status,
			CreateBy:    in.CreateBy,
			Remark:      in.Remark,
		}, tx)
		if err != nil {
			return err
		}
		// 新增用户岗位关联
		if err = s.insertUserPost(ctx, userId, in.PostIds, tx); err != nil {
			return err
		}

		// 删除用户权限
		_, _ = casbin.RemoveFilteredGroupingPolicy(0, in.UserName)
		if !g.IsEmpty(in.RoleIds) {
			// 新增用户与角色管理
			if err = s.insertUserRole(ctx, userId, in.RoleIds, tx); err != nil {
				return err
			}
			roles, err := sysService.Role().SelectRolesByIds(ctx, in.RoleIds)
			if err != nil {
				return err
			}
			var rules [][]string
			for _, role := range roles {
				rules = append(rules, []string{in.UserName, fmt.Sprintf("r:%s", role.RoleKey)})
			}
			_, _ = casbin.AddGroupingPolicies(rules)
		}
		return nil
	})
	if err != nil {
		g.Log().Error(ctx, err)
		return err
	}
	return nil
}

// UpdateLoginInfo 更新用户登录信息
func (s *sUser) UpdateLoginInfo(ctx context.Context, user *model.UserUpdateLoginInfoInput) error {
	_, err := dao.User.Ctx(ctx).WherePri(user.UserId).Update(do.User{
		LoginDate: user.LoginDate,
		LoginIp:   user.LoginIp,
	})
	return err
}

// Edit 修改用户信息
func (s *sUser) Edit(ctx context.Context, in *model.UserEditInput) error {
	err := sysService.User().CheckUserAllowed(in.UserId)
	if err != nil {
		return err
	}

	casbin := sysService.Casbin().Casbin(ctx)
	err = dao.UserRole.Transaction(ctx, func(ctx context.Context, tx gdb.TX) error {
		var err error
		// 删除用户与角色关联
		if err = dao.UserRole.DeleteUserRoleByUserId(ctx, in.UserId, tx); err != nil {
			return err
		}
		// 先删除权限
		_, _ = casbin.RemoveFilteredGroupingPolicy(0, in.UserName)
		// 新增用户与角色管理
		if !g.IsEmpty(in.RoleIds) {
			if err = s.insertUserRole(ctx, in.UserId, in.RoleIds, tx); err != nil {
				return err
			}
			roles, err := sysService.Role().SelectRolesByIds(ctx, in.RoleIds)
			if err != nil {
				return err
			}
			var rules [][]string
			for _, role := range roles {
				rules = append(rules, []string{in.UserName, fmt.Sprintf("r:%s", role.RoleKey)})
			}
			_, _ = casbin.AddGroupingPolicies(rules)
		}
		// 删除用户与岗位关联
		if err = dao.UserPost.DeleteUserPostByUserId(ctx, in.UserId, tx); err != nil {
			return err
		}
		// 新增用户与岗位管理
		if err = s.insertUserPost(ctx, in.UserId, in.PostIds, tx); err != nil {
			return err
		}
		if err = dao.User.Edit(ctx, &do.User{
			UserId:   in.UserId,
			UserName: in.UserName,
			DeptId:   in.DeptId,
			NickName: in.NickName,
			//UserType:    in.UserType,
			Email:       in.Email,
			Phonenumber: in.Phonenumber,
			Sex:         in.Sex,
			Status:      in.Status,
			UpdateBy:    in.UpdateBy,
			Remark:      in.Remark,
		}, tx); err != nil {
			return err
		}
		return nil
	})
	if err != nil {
		g.Log().Error(ctx, err)
		return err
	}
	return nil
}

// DeleteByIds 批量删除用户信息
// @param userIds 需要删除的用户ID
func (s *sUser) DeleteByIds(ctx context.Context, userIds []int64) error {
	for _, userId := range userIds {
		if err := s.CheckUserAllowed(userId); err != nil {
			return err
		}
	}

	casbin := sysService.Casbin().Casbin(ctx)
	err := dao.UserRole.Transaction(ctx, func(ctx context.Context, tx gdb.TX) error {
		var err error
		for _, userId := range userIds {
			user, _ := s.SelectUserById(ctx, userId)
			if user != nil {
				_, _ = casbin.RemoveFilteredGroupingPolicy(0, user.UserName)
			}
		}
		if err = dao.UserRole.DeleteUserRoleByUserIds(ctx, userIds, tx); err != nil {
			return err
		}
		if err = dao.UserPost.DeleteUserPostByUserIds(ctx, userIds, tx); err != nil {
			return err
		}
		if err = dao.User.DeleteUserByIds(ctx, userIds, tx); err != nil {
			return err
		}
		return nil
	})
	if err != nil {
		g.Log().Error(ctx, err)
		return err
	}
	return nil
}

// UpdateStatus 修改用户状态
func (s *sUser) UpdateStatus(ctx context.Context, in *model.UserUpdateStatusInput) error {
	user, err := s.SelectUserById(ctx, in.UserId)
	if err != nil {
		return err
	}

	casbin := sysService.Casbin().Casbin(ctx)
	_, _ = casbin.RemoveFilteredGroupingPolicy(0, user.UserName)
	if in.Status == consts.Normal {
		roles, err := sysService.Role().SelectRolesByUserId(ctx, in.UserId)
		if err != nil {
			return err
		}
		if !g.IsEmpty(roles) {
			var rules [][]string
			for _, role := range roles {
				rules = append(rules, []string{user.UserName, fmt.Sprintf("r:%s", role.RoleKey)})
			}
			_, _ = casbin.AddGroupingPolicies(rules)
		}
	}

	return dao.User.UpdateUserByUserId(ctx, &do.User{
		UserId:   in.UserId,
		Status:   in.Status,
		UpdateBy: in.UpdateBy,
	})
}

// UpdateProfile 修改用户基本信息
func (s *sUser) UpdateProfile(ctx context.Context, in *model.UserUpdateProfileInput) error {
	return dao.User.UpdateUserByUserId(ctx, &do.User{
		UserId:      in.UserId,
		NickName:    in.NickName,
		Email:       in.Email,
		Phonenumber: in.Phonenumber,
		Sex:         in.Sex,
		UpdateBy:    in.UpdateBy,
	})
}

// UpdateUserAvatar 修改用户头像
// @param userName 	用户名
// @param avatar	头像
func (s *sUser) UpdateUserAvatar(ctx context.Context, in *model.UserUpdateAvatarInput) error {
	return dao.User.UpdateUserByUserName(ctx, &do.User{
		UserId: in.UserId,
		Avatar: in.Avatar,
	})
}

// ResetPwd 重置用户密码
// @param ctx 		上下文
// @param userId 	用户Id
// @param password	新密码
func (s *sUser) ResetPwd(ctx context.Context, in *model.UserResetPwdInput) error {
	cbcPwd, err := commonService.Password().HashPassword(ctx, in.Password)
	if err != nil {
		g.Log().Error(ctx, "密码加密错误", err)
		return gerror.Wrap(err, "重置用户密码失败")
	}
	return dao.User.UpdateUserByUserId(ctx, &do.User{
		UserId:   in.UserId,
		Password: cbcPwd,
		UpdateBy: in.UpdateBy,
	})
}

// ResetUserPwd 重置用户密码
// @param userName 用户名
// @param password 密码
func (s *sUser) ResetUserPwd(ctx context.Context, in *model.UserResetUserPwdInput) error {
	cbcPwd, err := commonService.Password().HashPassword(ctx, in.Password)
	if err != nil {
		g.Log().Error(ctx, "密码加密错误", err)
		return gerror.Wrap(err, "重置用户密码失败")
	}
	return dao.User.UpdateUserByUserName(ctx, &do.User{
		UserName: in.UserName,
		Password: cbcPwd,
		UpdateBy: in.UpdateBy,
	})
}

// UpdatePwd 重置用户密码
// @param userName 用户名
// @param password 密码
func (s *sUser) UpdatePwd(ctx context.Context, in *model.UserUpdatePwdInput) error {
	user, err := dao.User.SelectUserById(ctx, in.UserId)
	if err != nil {
		return gerror.Wrap(err, "用户不存在")
	}
	err = commonService.Password().Validate(ctx, fmt.Sprintf("%s:%s", cache_consts.PwdErrCntKey, user.UserName), in.OldPassword, user.Password)
	if err != nil {
		return err
	}
	cbcPwd, err := commonService.Password().HashPassword(ctx, in.NewPassword)
	if err != nil {
		g.Log().Error(ctx, "密码加密错误", err)
		return gerror.Wrap(err, "修改密码失败")
	}
	return dao.User.UpdateUserByUserId(ctx, &do.User{
		UserId:   in.UserId,
		Password: cbcPwd,
		UpdateBy: in.UpdateBy,
	})
}

// 新增用户岗位信息
func (s *sUser) insertUserPost(ctx context.Context, userId int64, postIds []int64, tx gdb.TX) error {
	if len(postIds) == 0 {
		return nil
	}
	userPosts := make([]*entity.UserPost, 0, len(postIds))
	for _, postId := range postIds {
		userPosts = append(userPosts, &entity.UserPost{
			UserId: userId,
			PostId: postId,
		})
	}
	_, err := dao.UserPost.Ctx(ctx).TX(tx).Data(userPosts).Insert()
	return err
}

// 新增用户角色信息
func (s *sUser) insertUserRole(ctx context.Context, userId int64, roleIds []int64, tx ...gdb.TX) error {
	if len(roleIds) == 0 {
		return nil
	}
	userRoles := make([]*entity.UserRole, 0, len(roleIds))
	for _, roleId := range roleIds {
		userRoles = append(userRoles, &entity.UserRole{
			UserId: userId,
			RoleId: roleId,
		})
	}
	m := dao.UserRole.Ctx(ctx)
	if len(tx) > 0 {
		m = m.TX(tx[0])
	}
	_, err := m.Data(userRoles).Insert()
	return err
}

// InsertUserRole 新增用户角色信息
func (s *sUser) InsertUserRole(ctx context.Context, userId int64, roleIds []int64) error {
	return dao.User.Transaction(ctx, func(ctx context.Context, tx gdb.TX) error {
		// 删除用户与角色关联
		if err := dao.UserRole.DeleteUserRoleByUserId(ctx, userId, tx); err != nil {
			return err
		}
		return s.insertUserRole(ctx, userId, roleIds)
	})
}

// CheckUserDataScope 校验用户是否有数据权限
func (s *sUser) CheckUserDataScope(ctx context.Context, userId int64) error {
	owerUserId := commonService.BizCtx().GetUserId(ctx)
	if !commonModel.IsAdmin(owerUserId) {
		users, err := sysService.User().SelectUserList(ctx, &model.UserListInput{
			UserId: userId,
		})
		if err != nil {
			return err
		}
		if users != nil && users.Total == 0 {
			return gerror.New("没有权限访问用户数据！")
		}
	}
	return nil
}

// SelectAllocatedList 查询已分配用户角色列表
func (s *sUser) SelectAllocatedList(ctx context.Context, in *model.UserSelectAllocatedListInput) (out *model.UserSelectAllocatedListOutput, err error) {
	users, total, err := dao.User.SelectAllocatedList(ctx, in.RoleId, in.UserName, in.Phonenumber)
	if err != nil {
		return
	}
	out = &model.UserSelectAllocatedListOutput{
		List:  users,
		Total: total,
	}
	return
}

// SelectUnallocatedList 查询未分配用户角色列表
func (s *sUser) SelectUnallocatedList(ctx context.Context, in *model.UserSelectUnallocatedListInput) (out *model.UserSelectUnallocatedListOutput, err error) {
	users, total, err := dao.User.SelectUnallocatedList(ctx, in.RoleId, in.UserName, in.Phonenumber)
	if err != nil {
		return
	}
	out = &model.UserSelectUnallocatedListOutput{
		List:  users,
		Total: total,
	}
	return
}
