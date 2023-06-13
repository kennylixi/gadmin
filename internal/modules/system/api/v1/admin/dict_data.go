package admin

import (
	"github.com/gogf/gf/v2/frame/g"
	"github.com/kennylixi/gadmin/internal/modules/system/model"
	"github.com/kennylixi/gadmin/internal/modules/system/model/entity"
)

// DictDataListReq 获取列表
type DictDataListReq struct {
	g.Meta    `path:"/dict/data/list" tags:"字典数据管理" method:"get" summary:"获取字典数据列表"`
	DictLabel string // 字典标签
	DictValue string // 字典键值
	DictType  string // 字典类型
	Status    string // 状态（0正常 1停用）
}
type DictDataListRes struct {
	List  []*model.DictDataListItem `json:"list"`  // 列表
	Total int                       `json:"total"` // 数据总数
}

// DictDataExportReq 导出Excel数据
type DictDataExportReq struct {
	g.Meta    `path:"/dict/data/export" tags:"字典数据管理" method:"post" summary:"导出Excel数据"`
	DictLabel string // 字典标签
	DictValue string // 字典键值
	DictType  string // 字典类型
	Status    string // 状态（0正常 1停用）
}
type DictDataExportRes struct {
}

// DictDataGetInfoReq 查询字典数据详细
type DictDataGetInfoReq struct {
	g.Meta   `path:"/dict/data/{DictCode}" tags:"字典数据管理" method:"get" summary:"查询字典数据详细"`
	DictCode int64
}
type DictDataGetInfoRes entity.DictData

// DictDataGetByDictTypeReq 根据字典类型查询字典数据信息
type DictDataGetByDictTypeReq struct {
	g.Meta   `path:"/dict/data/type/{DictType}" tags:"字典数据管理" method:"get" summary:"根据字典类型查询字典数据信息"`
	DictType string // 字典类型
}
type DictDataGetByDictTypeRes []*entity.DictData

// DictDataAddReq 新增字典数据
type DictDataAddReq struct {
	g.Meta    `path:"/dict/data" tags:"字典数据管理" method:"post" summary:"新增字典数据"`
	DictSort  int    // 字典排序
	DictLabel string // 字典标签
	DictValue string // 字典键值
	DictType  string // 字典类型
	CssClass  string // 样式属性（其他样式扩展）
	ListClass string // 表格回显样式
	IsDefault string // 是否默认（Y是 N否）
	Status    string // 状态（0正常 1停用）
	Remark    string // 备注
}
type DictDataAddRes struct{}

// DictDataEditReq 修改保存字典数据
type DictDataEditReq struct {
	g.Meta `path:"/dict/data" tags:"字典数据管理" method:"put" summary:"修改字典数据"`
	DictDataAddReq
	DictCode int64 // 字典编码
}
type DictDataEditRes struct{}

// DictDataDeleteReq 删除字典数据
type DictDataDeleteReq struct {
	g.Meta    `path:"/dict/data" tags:"字典数据管理" method:"delete" summary:"删除字典数据"`
	DictCodes []int64
}
type DictDataDeleteRes struct{}
