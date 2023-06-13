package tasks

import (
	"context"
	"github.com/hibiken/asynq"
	sysService "github.com/kennylixi/gadmin/internal/modules/system/service"
)

// 备份数据库
func handleBackupTask(ctx context.Context, t *asynq.Task) (err error) {
	return sysService.SqlBackups().Backup(ctx)
}
