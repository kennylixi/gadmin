package model

import (
	"github.com/gogf/gf/v2/container/gvar"
)

type Cfg struct {
	Redis     RedisCfg
	Scheduler SchedulerCfg
	Server    ServerCfg
	LogLevel  int
	MaxRetry  int // 重试次数
}

type RedisCfg struct {
	Addr     string
	Username string
	Password string
	DB       int
}

type SchedulerCfg struct {
	SyncInterval int64  // 配置同步时间
	Location     string // 时间时区
}

type ServerCfg struct {
	Concurrency int            // 并发
	RetryDelay  int64          // 重试间隔
	Queues      map[string]int // 队列
}

type Payload struct {
	TaskId      int64     `json:"taskId"`      // 任务ID
	RetryDelay  int       `json:"retryDelay"`  // 重试间隔
	IsRecordLog bool      `json:"isRecordLog"` // 记录运行日志
	Payload     *gvar.Var `json:"payload"`     // 数据
}

// PayloadPush 推送数据负载
type PayloadPush struct {
	TemplateId     int64             `json:"templateId"`     // 模板ID
	ChannelId      int64             `json:"channelId"`      // 渠道ID
	Accounts       []string          `json:"accounts"`       // 账号
	Template       interface{}       `json:"template"`       // 模板信息
	TemplateParams map[string]string `json:"templateParams"` // 模板参数
}
