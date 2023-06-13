package model

import (
	"github.com/kennylixi/gadmin/internal/modules/system/model/entity"
)

type OperLogListInput struct {
	OperName string // 操作人员
	Status   int    // 操作状态（0正常 1异常）
}
type OperLogListOutput struct {
	List  []*entity.OperLog `json:"list"`  // 列表
	Total int               `json:"total"` // 数据总数
}
