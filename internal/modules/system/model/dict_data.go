package model

import (
	"github.com/gogf/gf/v2/os/gtime"
)

type DictDataListItem struct {
	DictCode  int64       `json:"dictCode"  meta:"name|编码;cellType|0"`
	DictSort  int         `json:"dictSort"  meta:"name|字典排序"`
	DictLabel string      `json:"dictLabel" meta:"name|字典标签"`
	DictValue string      `json:"dictValue" meta:"name|字典键值"`
	Status    string      `json:"status"    meta:"name|状态;readConverterExp|0=正常,1=停用;combo|正常,停用"`
	CreatedAt *gtime.Time `json:"createdAt" meta:"name|创建时间;width|25;dateFormat|Y-m-d H:i:s"`
	Remark    string      `json:"remark"    meta:"name|备注"`
}

// DictDataListInput 获取列表
type DictDataListInput struct {
	DictLabel string // 字典标签
	DictValue string // 字典键值
	DictType  string // 字典类型
	Status    string // 状态（0正常 1停用）
}

type DictDataListOutput struct {
	List  []*DictDataListItem // 列表
	Total int                 // 数据总数
}

// DictDataAddInput 新增字典数据
type DictDataAddInput struct {
	DictSort  int    // 字典排序
	DictLabel string // 字典标签
	DictValue string // 字典键值
	DictType  string // 字典类型
	CssClass  string // 样式属性（其他样式扩展）
	ListClass string // 表格回显样式
	IsDefault string // 是否默认（Y是 N否）
	Status    string // 状态（0正常 1停用）
	Remark    string // 备注
	CreateBy  string
}

// DictDataEditInput 修改保存字典数据
type DictDataEditInput struct {
	DictCode  int64  // 字典编码
	DictSort  int    // 字典排序
	DictLabel string // 字典标签
	DictValue string // 字典键值
	DictType  string // 字典类型
	CssClass  string // 样式属性（其他样式扩展）
	ListClass string // 表格回显样式
	IsDefault string // 是否默认（Y是 N否）
	Status    string // 状态（0正常 1停用）
	Remark    string // 备注
	UpdateBy  string
}
