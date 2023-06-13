package admin

import (
	"github.com/gogf/gf/v2/frame/g"
	"github.com/gogf/gf/v2/os/gtime"
	"github.com/kennylixi/gadmin/internal/modules/system/model/entity"
)

type JobLogListReq struct {
	g.Meta       `path:"/jobLog/list" tags:"任务日志管理" method:"get" summary:"获取任务日志列表"`
	InvokeTarget string // 任务名称
	Status       string // 执行状态（0正常 1失败）
}
type JobLogListRes struct {
	List  []*entity.JobLog `json:"list"`  // 列表
	Total int              `json:"total"` // 数据总数
}

type JobLogGetInfoReq struct {
	g.Meta   `path:"/jobLog/{JobLogId}" tags:"任务日志管理" method:"get" summary:"获取任务日志详情"`
	JobLogId int64
}
type JobLogGetInfoRes entity.JobLog

type JobLogAddReq struct {
	g.Meta        `path:"/jobLog/" tags:"任务日志管理" method:"post" summary:"新增任务日志"`
	JobLogId      int64       // 任务日志ID
	JobName       string      `v:"required#请输入任务名称"` // 任务名称
	JobGroup      string      `v:"required#请输入任务组名"` // 任务组名
	InvokeTarget  string      // 调用目标字符串
	InvokeParams  string      // 调用目标参数
	JobMessage    string      // 日志信息
	Status        string      `v:"required#请输入执行状态"` // 执行状态
	ExceptionInfo string      // 异常信息
	CreatedAt     *gtime.Time // 创建时间
}
type JobLogAddRes struct{}

type JobLogDeleteReq struct {
	g.Meta    `path:"/jobLog" tags:"任务日志管理" method:"delete" summary:"删除任务日志"`
	JobLogIds []int64
}
type JobLogDeleteRes struct{}

type JobLogCleanReq struct {
	g.Meta `path:"/jobLog/clean" tags:"任务日志管理" method:"delete" summary:"清空任务日志"`
}
type JobLogCleanRes struct{}
