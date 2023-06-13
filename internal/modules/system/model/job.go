package model

import (
	"github.com/gogf/gf/v2/os/gtime"
	"github.com/kennylixi/gadmin/internal/modules/system/model/entity"
)

type Job struct {
	entity.Job
	LastTime *gtime.Time `json:"lastTime"` // 最后执行时间
	NextTime *gtime.Time `json:"nextTime"` // 下次执行时间
}

type JobListInput struct {
	JobName  string // 任务名称
	JobGroup string // 任务组名
	Status   string // 状态（0正常 1暂停）
}
type JobListOutput struct {
	List  []*Job `json:"list"`  // 列表
	Total int    `json:"total"` // 数据总数
}

type JobChangeStatusInput struct {
	JobId  int64
	Status string
}

type JobAddInput struct {
	JobName        string // 任务名称
	JobGroup       string // 任务组名
	InvokeTarget   string // 调用目标字符串
	InvokeParams   string // 调用目标参数
	CronExpression string // cron执行表达式
	MaxRetry       int    // 重试次数
	RetryDelay     int    // 重试间隔
	IsRecordLog    bool   // 是否记录执行日志
	Status         string // 状态
	Remark         string // 备注信息
	CreateBy       string
}

type JobEditInput struct {
	JobId          int64  // 定时任务调度表ID
	JobName        string // 任务名称
	JobGroup       string // 任务组名
	InvokeTarget   string // 调用目标字符串
	InvokeParams   string // 调用目标参数
	CronExpression string // cron执行表达式
	MaxRetry       int    // 重试次数
	RetryDelay     int    // 重试间隔
	IsRecordLog    bool   // 是否记录执行日志
	Status         string // 状态
	Remark         string // 备注信息
	UpdateBy       string
}
