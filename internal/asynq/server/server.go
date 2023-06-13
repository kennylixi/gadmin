package server

import (
	"context"
	"fmt"
	"github.com/gogf/gf/v2/encoding/gjson"
	"github.com/gogf/gf/v2/errors/gerror"
	"github.com/gogf/gf/v2/frame/g"
	"github.com/gogf/gf/v2/os/gtime"
	"github.com/gogf/gf/v2/util/gconv"
	"github.com/hibiken/asynq"
	"github.com/kennylixi/gadmin/internal/asynq/logger"
	"github.com/kennylixi/gadmin/internal/asynq/model"
	"github.com/kennylixi/gadmin/internal/consts"
	"github.com/kennylixi/gadmin/internal/consts/cache_consts"
	"github.com/kennylixi/gadmin/internal/modules/system/model/do"
	"sync"
	"time"
)

var (
	server    *asynq.Server
	handleMap = make(map[string]asynq.HandlerFunc)
	m         sync.Mutex
)

func RegisterHandler(hType string, handler asynq.HandlerFunc) (err error) {
	m.Lock()
	defer m.Unlock()
	if _, ok := handleMap[hType]; ok {
		err = gerror.Newf("任务[%s]重复注册", hType)
		return
	}
	handleMap[hType] = handler
	return
}

// NewServer 实例化server
func NewServer(ctx context.Context, cfg *model.Cfg) error {
	redisOpt := asynq.RedisClientOpt{Addr: cfg.Redis.Addr, Username: cfg.Redis.Username, Password: cfg.Redis.Password, DB: cfg.Redis.DB}
	server = asynq.NewServer(
		redisOpt,
		asynq.Config{
			Concurrency: cfg.Server.Concurrency,
			Queues:      cfg.Server.Queues,
			LogLevel:    asynq.LogLevel(cfg.LogLevel),
			Logger:      logger.NewLogger(g.Log()),
			IsFailure: func(err error) bool {
				return false
			},
			ErrorHandler: asynq.ErrorHandlerFunc(reportError),
			RetryDelayFunc: func(n int, e error, t *asynq.Task) time.Duration {
				payload := (*model.Payload)(nil)
				if err := gjson.DecodeTo(t.Payload(), &payload); err != nil {
					g.Log().Errorf(ctx, "定时任务[%s]参数[%s]错误: %+v", t.Type(), t.Payload(), err)
				}
				if payload != nil && payload.RetryDelay > 0 {
					return time.Duration(payload.RetryDelay) * time.Second
				}
				if cfg.Server.RetryDelay != 0 {
					return time.Duration(cfg.Server.RetryDelay) * time.Second
				}
				return asynq.DefaultRetryDelayFunc(n, e, t)
			},
		},
	)

	mux := asynq.NewServeMux()
	mux.Use(loggingMiddleware)

	for t, handlerFunc := range handleMap {
		mux.HandleFunc(t, handlerFunc)
	}

	return server.Start(mux)
}

func reportError(ctx context.Context, task *asynq.Task, err error) {
	retried, _ := asynq.GetRetryCount(ctx)
	maxRetry, _ := asynq.GetMaxRetry(ctx)
	if retried >= maxRetry {
		g.Log().Errorf(ctx, "retry exhausted for task %s: %w", task.Type, err)
	}
}

func loggingMiddleware(h asynq.Handler) asynq.Handler {
	return asynq.HandlerFunc(func(ctx context.Context, t *asynq.Task) error {
		start := gtime.Now()

		payload := (*model.Payload)(nil)
		if err := gjson.DecodeTo(t.Payload(), &payload); err != nil {
			g.Log().Errorf(ctx, "定时任务[%s]参数[%s]错误: %+v", t.Type(), string(t.Payload()), err)
			return err
		}

		err := h.ProcessTask(ctx, t)

		if payload.IsRecordLog {
			// 是否记录日志
			jobLog := &do.JobLog{
				InvokeTarget: t.Type(),
				Status:       gconv.String(consts.Success),
				JobMessage:   fmt.Sprintf("耗时 %d 毫秒", gtime.Now().Sub(start).Milliseconds()),
				CreatedAt:    start,
			}
			jobLog.InvokeParams = payload.Payload.String()
			if err != nil {
				jobLog.Status = gconv.String(consts.Fail)
				jobLog.ExceptionInfo = fmt.Sprintf("%#v", err)
			}

			_, err = g.Redis().RPush(ctx, cache_consts.SysTaskLogKey, &jobLog)
			if err != nil {
				g.Log().Errorf(ctx, "记录任务执行记录失败, err = %#v", gtime.Now().Sub(start).Milliseconds(), err)
			}
		}
		if err != nil {
			g.Log().Errorf(ctx, "[失败]任务类型 = %s, 参数 = %s, 耗时 = %dmm, err = %#v", t.Type(), payload.Payload.String(), gtime.Now().Sub(start).Milliseconds(), err)
			return err
		}
		g.Log().Debugf(ctx, "[成功]任务类型 = %s, 参数 = %s, 耗时 = %dmm", t.Type(), payload.Payload.String(), gtime.Now().Sub(start).Milliseconds())
		return nil
	})
}
