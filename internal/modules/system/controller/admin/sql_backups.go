// ============================================================================
// This is auto-generated by gen tool only once. Fill this file as you wish.
// 数据库备份表Controller层
// @author kennylixi
// @date 2023-05-07 13:31:59
// ============================================================================

package admin

import (
	"context"
	"github.com/kennylixi/gadmin/internal/modules/system/api/v1/admin"
	"github.com/kennylixi/gadmin/internal/modules/system/model"
	sysService "github.com/kennylixi/gadmin/internal/modules/system/service"
)

// SqlBackups 数据库备份表管理
var SqlBackups = cSqlBackups{}

type cSqlBackups struct{}

// List 查询数据库备份表列表
func (c *cSqlBackups) List(ctx context.Context, req *admin.SqlBackupsListReq) (res *admin.SqlBackupsListRes, err error) {
	out, err := sysService.SqlBackups().SelectList(ctx, &model.SqlBackupsListInput{
		FileName: req.FileName,
	})
	if err != nil {
		return
	}
	res = &admin.SqlBackupsListRes{
		List:  out.List,
		Total: out.Total,
	}
	return
}

// Pwd 获取解压密码
func (c *cSqlBackups) Pwd(ctx context.Context, req *admin.SqlBackupsPwdReq) (res admin.SqlBackupsPwdRes, err error) {
	backup, err := sysService.SqlBackups().SelectById(ctx, req.BackupsId)
	if err != nil {
		return
	}
	res = admin.SqlBackupsPwdRes(backup.Password)
	return
}

// Backup 备份数据库
func (c *cSqlBackups) Backup(ctx context.Context, req *admin.SqlBackupsBackUpReq) (res *admin.SqlBackupsBackUpRes, err error) {
	err = sysService.SqlBackups().Backup(ctx)
	return
}

// Recover 恢复数据库备份
func (c *cSqlBackups) Recover(ctx context.Context, req *admin.SqlBackupsRecoverReq) (res *admin.SqlBackupsRecoverRes, err error) {
	err = sysService.SqlBackups().Recover(ctx, req.BackupsId)
	return
}

// Delete 删除数据库备份表
func (c *cSqlBackups) Delete(ctx context.Context, req *admin.SqlBackupsDeleteReq) (res *admin.SqlBackupsDeleteRes, err error) {
	err = sysService.SqlBackups().DeleteByIds(ctx, req.BackupsIds)
	return
}
