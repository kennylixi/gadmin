package scheduler

import (
	"context"
	"github.com/gogf/gf/v2/container/gvar"
	"github.com/gogf/gf/v2/frame/g"
	"github.com/gogf/gf/v2/os/gtime"
	"github.com/hibiken/asynq"
	"github.com/kennylixi/gadmin/internal/asynq/logger"
	"github.com/kennylixi/gadmin/internal/asynq/model"
	"github.com/kennylixi/gadmin/internal/consts/cache_consts"
	"time"
)

// NewScheduler 实例化调度器
func NewScheduler(ctx context.Context, cfg *model.Cfg) error {
	provider := &ConfigProvider{}

	var location *time.Location
	if cfg.Scheduler.Location != "" {
		location, _ = time.LoadLocation(cfg.Scheduler.Location)
	}
	redisOpt := asynq.RedisClientOpt{Addr: cfg.Redis.Addr, Username: cfg.Redis.Username, Password: cfg.Redis.Password, DB: cfg.Redis.DB}

	mgr, err := asynq.NewPeriodicTaskManager(
		asynq.PeriodicTaskManagerOpts{
			RedisConnOpt:               redisOpt,
			PeriodicTaskConfigProvider: provider,                                                // this provider object is the interface to your config source
			SyncInterval:               time.Duration(cfg.Scheduler.SyncInterval) * time.Second, // this field specifies how often sync should happen
			SchedulerOpts: &asynq.SchedulerOpts{
				Location: location,
				Logger:   logger.NewLogger(g.Log()),
				PreEnqueueFunc: func(task *asynq.Task, opts []asynq.Option) {
					payload := (*model.Payload)(nil)
					if err := gvar.New(task.Payload()).Scan(&payload); err != nil || payload.TaskId <= 0 {
						return
					}
					// 记录执行开始时间
					g.Redis().HSet(ctx, cache_consts.SysTaskLastTimeKey, map[string]interface{}{
						string(payload.TaskId): gtime.Now(),
					})
				},
				PostEnqueueFunc: func(info *asynq.TaskInfo, err error) {
					if err != nil {
						g.Log().Error(ctx, err)
					}
				},
			},
		})
	if err != nil {
		return err
	}

	return mgr.Run()
}
