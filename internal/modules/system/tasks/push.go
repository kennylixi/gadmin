package tasks

import (
	"context"
	"github.com/gogf/gf/v2/container/gvar"
	"github.com/hibiken/asynq"
	"github.com/kennylixi/gadmin/internal/asynq/model"
	"github.com/kennylixi/gadmin/internal/modules/system/service"
)

// 消息推送队列
func handlePushTask(ctx context.Context, t *asynq.Task) (err error) {
	payload := (*model.Payload)(nil)
	if err = gvar.New(t.Payload()).Scan(&payload); err != nil {
		return
	}

	pushPayload := (*model.PayloadPush)(nil)
	if err = payload.Payload.Scan(&pushPayload); err != nil {
		return
	}

	adapter, err := service.PushChannel().GetAdapter(ctx, pushPayload.ChannelId)
	if err != nil {
		return
	}

	err = adapter.Send(ctx, pushPayload.Accounts, pushPayload.Template, pushPayload.TemplateParams)

	// TODO 记录推送日志 直接先记录到redis，然后批量同步到数据库

	return
}
