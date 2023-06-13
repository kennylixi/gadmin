package model

import (
	"github.com/kennylixi/gadmin/internal/modules/system/model/entity"
)

type JobLogListInput struct {
	InvokeTarget string // 任务名称
	Status       string // 执行状态（0正常 1失败）
}
type JobLogListOutput struct {
	List  []*entity.JobLog `json:"list"`  // 列表
	Total int              `json:"total"` // 数据总数
}
