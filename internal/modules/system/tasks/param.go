package tasks

import (
	"context"
	"fmt"
	"github.com/gogf/gf/v2/container/gvar"
	"github.com/hibiken/asynq"
	"github.com/kennylixi/gadmin/internal/asynq/model"
)

func handleParam(ctx context.Context, t *asynq.Task) (err error) {
	payload := (*model.Payload)(nil)
	if err = gvar.New(t.Payload()).Scan(&payload); err != nil {
		return
	}

	fmt.Println("有参数任务", payload.Payload.String())
	return
}
