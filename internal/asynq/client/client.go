package client

import (
	"context"
	"github.com/gogf/gf/v2/encoding/gjson"
	"github.com/gogf/gf/v2/errors/gerror"
	"github.com/hibiken/asynq"
	"github.com/kennylixi/gadmin/internal/asynq/model"
)

var (
	client *asynq.Client
	cfg    *model.Cfg
)

func NewClient(ctx context.Context, c *model.Cfg) error {
	if client != nil {
		return gerror.New("asynq客户端已初始化")
	}
	redisOpt := asynq.RedisClientOpt{
		Addr:     c.Redis.Addr,
		Username: c.Redis.Username,
		Password: c.Redis.Password,
		DB:       c.Redis.DB,
	}
	client = asynq.NewClient(redisOpt)
	cfg = c
	return nil
}

// NewTask 立即执行一次任务
func NewTask(ctx context.Context, taskType string, payload *model.Payload, opts ...asynq.Option) (err error) {
	bs, err := gjson.Encode(payload)
	if err != nil {
		return
	}
	task := asynq.NewTask(taskType, bs, opts...)

	_, err = EnqueueContext(ctx, task)
	return
}

func EnqueueContext(ctx context.Context, task *asynq.Task) (*asynq.TaskInfo, error) {
	if client == nil {
		return nil, gerror.New("asynq客户端未初始化")
	}
	return client.EnqueueContext(ctx, task, asynq.MaxRetry(cfg.MaxRetry))
}
