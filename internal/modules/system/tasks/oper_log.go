package tasks

import (
	"context"
	"github.com/gogf/gf/v2/container/gvar"
	"github.com/hibiken/asynq"
	"github.com/kennylixi/gadmin/internal/asynq/model"
	sysService "github.com/kennylixi/gadmin/internal/modules/system/service"
)

// 管理员操作日志队列
func handleOperlogTask(ctx context.Context, t *asynq.Task) (err error) {
	payload := (*model.Payload)(nil)
	if err = gvar.New(t.Payload()).Scan(&payload); err != nil {
		return
	}

	return sysService.OperLog().BatchInsert(ctx, payload.Payload.Int64())
}
