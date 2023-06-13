package permission

import (
	"context"
	"github.com/gogf/gf/v2/container/gset"
	"github.com/kennylixi/gadmin/internal/modules/common/model"
	"github.com/kennylixi/gadmin/internal/modules/system/service"
)

// sPermission 权限管理服务
type sPermission struct{}

func init() {
	service.RegisterPermission(New())
}

func New() *sPermission {
	return &sPermission{}
}

// GetRolePermission 获取角色数据权限
// @param userId 用户Id
// @return 角色权限信息
func (s *sPermission) GetRolePermission(ctx context.Context, userId int64) (roles []string, err error) {
	rolesSet := gset.NewStrSet()
	if model.IsAdmin(userId) {
		rolesSet.Add("admin")
	} else {
		var roleList []string
		roleList, err = service.Role().SelectRolePermissionByUserId(ctx, userId)
		rolesSet.Add(roleList...)
	}
	roles = rolesSet.Slice()
	return
}

// GetMenuPermission 获取菜单数据权限
// @param userId 用户Id
// @return 菜单权限信息
func (s *sPermission) GetMenuPermission(ctx context.Context, userId int64) (perms []string, err error) {
	permsSet := gset.NewStrSet()
	if model.IsAdmin(userId) {
		permsSet.Add("*:*:*")
	} else {
		var permList []string
		permList, err = service.Menu().SelectMenuPermsByUserId(ctx, userId)
		permsSet.Add(permList...)
	}
	perms = permsSet.Slice()
	return
}
