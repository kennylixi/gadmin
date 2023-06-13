package admin

import (
	"github.com/gogf/gf/v2/frame/g"
	"github.com/kennylixi/gadmin/internal/modules/system/model/entity"
)

type OperLogListReq struct {
	g.Meta   `path:"/operlog/list" tags:"操作日志" method:"get" summary:"获取操作日志列表"`
	OperName string // 操作人员
	Status   int    // 操作状态（0正常 1异常）
}
type OperLogListRes struct {
	List  []*entity.OperLog `json:"list"`  // 列表
	Total int               `json:"total"` // 数据总数
}

// OperLogExportReq 导出Excel
type OperLogExportReq struct {
	g.Meta   `path:"/operlog/export" tags:"操作日志" method:"post" summary:"导出操作日志"`
	OperName string // 操作人员
	Status   int    // 操作状态（0正常 1异常）
}
type OperLogExportRes struct {
}

type OperLogDeleteReq struct {
	g.Meta  `path:"/operlog" tags:"操作日志" method:"delete" summary:"删除操作日志"`
	OperIds []int64
}
type OperLogDeleteRes struct{}

type OperLogCleanReq struct {
	g.Meta `path:"/operlog/clean" tags:"操作日志" method:"delete" summary:"清空操作日志"`
}
type OperLogCleanRes struct{}
