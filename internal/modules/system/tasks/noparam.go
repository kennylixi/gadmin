package tasks

import (
	"context"
	"fmt"
	"github.com/hibiken/asynq"
)

func handleNoParam(ctx context.Context, t *asynq.Task) (err error) {
	fmt.Println("无参数任务")
	return
}
