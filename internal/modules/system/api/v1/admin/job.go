package admin

import (
	"github.com/gogf/gf/v2/frame/g"
	"github.com/kennylixi/gadmin/internal/modules/system/model"
)

// JobListReq 定时任务列表
type JobListReq struct {
	g.Meta   `path:"/job/list" tags:"定时任务管理" method:"get" summary:"定时任务列表"`
	JobName  string // 任务名称
	JobGroup string // 任务组名
	Status   string // 状态（0正常 1暂停）
}
type JobListRes struct {
	List  []*model.Job `json:"list"`  // 列表
	Total int          `json:"total"` // 数据总数
}

type JobGetInfoReq struct {
	g.Meta `path:"/job/{JobId}" tags:"定时任务管理" method:"get" summary:"获取定时任务详细"`
	JobId  int64
}
type JobGetInfoRes model.Job

type JobAddReq struct {
	g.Meta         `path:"/job" tags:"定时任务管理" method:"post" summary:"新增定时任务"`
	JobName        string `v:"required#请输入任务名称"`    // 任务名称
	JobGroup       string `v:"required#请输入任务组名"`    // 任务组名
	InvokeTarget   string `v:"required#请输入调用目标字符串"` // 调用目标字符串
	InvokeParams   string // 调用目标参数
	CronExpression string `v:"required#请输入cron表达式"` // cron执行表达式
	MaxRetry       int    `v:"min:0#重试次数必须大于等于0"`   // 重试次数
	RetryDelay     int    `v:"min:0#重试间隔必须大于等于0"`   // 重试间隔
	IsRecordLog    bool   // 是否记录执行日志
	Status         string `v:"in:0,1#任务状态非法" d:"0"` // 状态
	Remark         string // 备注信息
}
type JobAddRes struct{}

type JobEditReq struct {
	g.Meta         `path:"/job" tags:"定时任务管理" method:"put" summary:"修改定时任务"`
	JobId          int64  `v:"required#请输入定时任务调度表Id"` // 定时任务调度表ID
	JobName        string `v:"required#请输入任务名称"`      // 任务名称
	JobGroup       string `v:"required#请输入任务组名"`      // 任务组名
	InvokeTarget   string `v:"required#请输入调用目标字符串"`   // 调用目标字符串
	InvokeParams   string // 调用目标参数
	CronExpression string `v:"required#请输入cron表达式"` // cron执行表达式
	MaxRetry       int    `v:"min:0#重试次数必须大于等于0"`   // 重试次数
	RetryDelay     int    `v:"min:0#重试间隔必须大于等于0"`   // 重试间隔
	IsRecordLog    bool   // 是否记录执行日志
	Status         string `v:"in:0,1#任务状态非法" d:"0"` // 状态
	Remark         string // 备注信息
}
type JobEditRes struct{}

type JobChangeStatusReq struct {
	g.Meta `path:"/job/changeStatus" tags:"定时任务管理" method:"put" summary:"修改定时任务状态"`
	JobId  int64  `v:"required#请输入定时任务调度表Id"` // 定时任务调度表ID
	Status string // 状态
}
type JobChangeStatusRes struct{}

type JobRunReq struct {
	g.Meta `path:"/job/run" tags:"定时任务管理" method:"put" summary:"执行一次任务"`
	JobId  int64 `v:"required#请输入定时任务调度表Id"` // 定时任务调度表ID
}
type JobRunRes struct{}

type JobDeleteReq struct {
	g.Meta `path:"/job" tags:"定时任务管理" method:"delete" summary:"删除定时任务"`
	JobIds []int64
}
type JobDeleteRes struct{}
