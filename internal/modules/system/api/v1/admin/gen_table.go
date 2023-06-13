package admin

import (
	"github.com/gogf/gf/v2/frame/g"
	"github.com/kennylixi/gadmin/internal/modules/system/model"
	"github.com/kennylixi/gadmin/internal/modules/system/model/entity"
)

type GenTableListReq struct {
	g.Meta       `path:"/gen/list" tags:"代码生成" method:"get" summary:"查询代码生成列表"`
	TableName    string // 表名
	TableComment string // 表注释
	CreateBy     string // 创建者
}
type GenTableListRes struct {
	List  []*entity.GenTable `json:"list"`  // 列表
	Total int                `json:"total"` // 数据总数
}

type GenTableGetInfoReq struct {
	g.Meta  `path:"/gen/{tableId}" tags:"代码生成" method:"get" summary:"获取详细信息"`
	TableId int64
}
type GenTableGetInfoRes struct {
	Info   *model.GenTableItem      `json:"info"`
	List   []*entity.GenTableColumn `json:"list"`
	Tables []*model.GenTableItem    `json:"tables"`
}

type GenTableDataListReq struct {
	g.Meta       `path:"/gen/db/list" tags:"代码生成" method:"get" summary:"查询数据库列表"`
	TableName    string // 表名
	TableComment string // 表注释
}

type GenTableDbTableRes struct {
	List  []*model.DbTableInfo `json:"list"`  // 列表
	Page  int                  `json:"page"`  // 分页码
	Size  int                  `json:"size"`  // 分页数量
	Total int                  `json:"total"` // 数据总数
}

// GenTableUpdateReq 更新
type GenTableUpdateReq struct {
	g.Meta `path:"/gen" tags:"代码生成" method:"put" summary:"更新业务表"`
	model.GenTableItem
	Params map[string]interface{}
}
type GenTableUpdateRes struct {
}

// GenTableDeleteReq 删除
type GenTableDeleteReq struct {
	g.Meta   `path:"/gen" tags:"代码生成" method:"delete" summary:"删除业务表"`
	TableIds []int64
}
type GenTableDeleteRes struct {
}

// GenTableImportTableReq 导入
type GenTableImportTableReq struct {
	g.Meta     `path:"/gen/importTable" tags:"代码生成" method:"post" summary:"导入业务表"`
	TableNames []string
}
type GenTableImportTableRes struct {
}

// GenTablePreviewReq 预览代码
type GenTablePreviewReq struct {
	g.Meta  `path:"/gen/preview/{tableId}" tags:"代码生成" method:"get" summary:"预览业务表代码"`
	TableId int64
}
type GenTablePreviewRes map[string]string

// GenTableGenCodeReq 生成代码到目录
type GenTableGenCodeReq struct {
	g.Meta    `path:"/gen/genCode/{tableName}" tags:"代码生成" method:"get" summary:"生成业务表代码"`
	TableName string
}
type GenTableGenCodeRes struct {
}

// GenTableSynchDbReq 同步数据库
type GenTableSynchDbReq struct {
	g.Meta    `path:"/gen/synchDb/{tableName}" tags:"代码生成" method:"get" summary:"同步业务表"`
	TableName string
}
type GenTableSynchDbRes struct {
}

// GenTableBatchGenCodeReq 批量生成代码
type GenTableBatchGenCodeReq struct {
	g.Meta `path:"/gen/batchGenCode" tags:"代码生成" method:"get" summary:"批量生成业务表代码"`
	Tables string `v:"required#请选择表"`
}
type GenTableBatchGenCodeRes struct {
}
