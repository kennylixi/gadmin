package model

import (
	"github.com/gogf/gf/v2/os/gtime"
)

type DictTypeItemList struct {
	DictId    int64       `json:"dictId" meta:"name|编号;cellType|0"`
	DictName  string      `json:"dictName" meta:"name|字典名称"`
	DictType  string      `json:"dictType" meta:"name|字典类型"`
	Status    string      `json:"status" meta:"name|状态;readConverterExp|0=正常,1=停用;combo|正常,停用"`
	CreatedAt *gtime.Time `json:"createdAt" meta:"name|创建时间;width|25;dateFormat|Y-m-d H:i:s"`
	Remark    string      `json:"remark" meta:"name|备注"`
}

// DictTypeListInput 获取列表
type DictTypeListInput struct {
	DictName string // 字典名称
	DictType string // 字典类型
	Status   string // 状态（0正常 1停用）
}
type DictTypeListOutput struct {
	List  []*DictTypeItemList // 列表
	Total int                 // 数据总数
}

// DictTypeAddInput 新增字典数据
type DictTypeAddInput struct {
	DictName string // 字典名称
	DictType string // 字典类型
	Status   string // 状态（0正常 1停用）
	Remark   string // 备注
	CreateBy string // 创建者
}

// DictTypeEditInput 修改保存字典数据
type DictTypeEditInput struct {
	DictId   int64  // 字典主键
	DictName string // 字典名称
	DictType string // 字典类型
	Status   string // 状态（0正常 1停用）
	Remark   string // 备注
	UpdateBy string // 更新者
}
