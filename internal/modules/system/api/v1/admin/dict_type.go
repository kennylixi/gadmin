package admin

import (
	"github.com/gogf/gf/v2/frame/g"
	"github.com/kennylixi/gadmin/internal/modules/system/model"
	"github.com/kennylixi/gadmin/internal/modules/system/model/entity"
)

// DictTypeListReq 获取列表
type DictTypeListReq struct {
	g.Meta   `path:"/dict/type/list" tags:"字典类型管理" method:"get" summary:"获取字典类型列表"`
	DictName string // 字典名称
	DictType string // 字典类型
	Status   string // 状态（0正常 1停用）
}
type DictTypeListRes struct {
	List  []*model.DictTypeItemList `json:"list"`  // 列表
	Total int                       `json:"total"` // 数据总数
}

// DictTypeExportReq 导出Excel数据
type DictTypeExportReq struct {
	g.Meta   `path:"/dict/type/export" tags:"字典类型管理" method:"post" summary:"导出Excel数据"`
	DictName string // 字典名称
	DictType string // 字典类型
	Status   string // 状态（0正常 1停用）
}
type DictTypeExportRes struct {
}

// DictTypeGetInfoReq 查询字典数据详细
type DictTypeGetInfoReq struct {
	g.Meta `path:"/dict/type/{DictId}" tags:"字典类型管理" method:"get" summary:"获取字典类型详细"`
	DictId int64
}
type DictTypeGetInfoRes struct {
	entity.DictType
}

// DictTypeAddReq 新增字典数据
type DictTypeAddReq struct {
	g.Meta   `path:"/dict/type" tags:"字典类型管理" method:"post" summary:"新增字典类型"`
	DictName string // 字典名称
	DictType string // 字典类型
	Status   string // 状态（0正常 1停用）
	Remark   string // 备注
}
type DictTypeAddRes struct{}

// DictTypeEditReq 修改保存字典数据
type DictTypeEditReq struct {
	g.Meta   `path:"/dict/type" tags:"字典类型管理" method:"put" summary:"修改字典类型"`
	DictId   int64  // 字典主键
	DictName string // 字典名称
	DictType string // 字典类型
	Status   string // 状态（0正常 1停用）
	Remark   string // 备注
}
type DictTypeEditRes struct{}

// DictTypeDeleteReq 删除字典数据
type DictTypeDeleteReq struct {
	g.Meta  `path:"/dict/type" tags:"字典类型管理" method:"delete" summary:"删除字典类型"`
	DictIds []int64
}
type DictTypeDeleteRes struct{}

type DictTypeClearCacheReq struct {
	g.Meta `path:"/dict/type/clearCache" tags:"字典类型管理" method:"delete" summary:"清除字典缓存"`
}
type DictTypeClearCacheRes struct{}

type DictTypeOptionselectReq struct {
	g.Meta `path:"/dict/type/optionselect" tags:"字典类型管理" method:"get" summary:"获取字典选择框列表"`
}
type DictTypeOptionselectRes []*entity.DictType

type DictTypeRefreshCacheReq struct {
	g.Meta `path:"/dict/type/refreshCache" tags:"字典类型管理" method:"delete" summary:"刷新字典缓存"`
}
type DictTypeRefreshCacheRes struct{}
