package asynq

import (
	"context"
	"github.com/gogf/gf/v2/frame/g"
	"github.com/kennylixi/gadmin/internal/asynq/client"
	"github.com/kennylixi/gadmin/internal/asynq/model"
	"github.com/kennylixi/gadmin/internal/asynq/scheduler"
	"github.com/kennylixi/gadmin/internal/asynq/server"
)

const (
	cfgKey = "asynq"
)

// 初始化配置信息
func initCfg(ctx context.Context) (cfg *model.Cfg, err error) {
	cfgVar, err := g.Cfg().Get(ctx, cfgKey)
	if err != nil {
		return
	}
	err = cfgVar.Scan(&cfg)
	if err != nil {
		return
	}
	if cfg.Redis.Addr == "" {
		cfg.Redis.Addr = "localhost:6379"
	}
	return
}

// NewScheduler 初始化调度器
func NewScheduler(ctx context.Context) (err error) {
	cfg, err := initCfg(ctx)
	if err != nil {
		return
	}
	err = scheduler.NewScheduler(ctx, cfg)
	return
}

// NewClient 初始化客户端
func NewClient(ctx context.Context) (err error) {
	cfg, err := initCfg(ctx)
	if err != nil {
		return
	}
	err = client.NewClient(ctx, cfg)
	return
}

// NewServer 初始化任务服务器
func NewServer(ctx context.Context) (err error) {
	cfg, err := initCfg(ctx)
	if err != nil {
		return
	}

	err = server.NewServer(ctx, cfg)
	return
}
