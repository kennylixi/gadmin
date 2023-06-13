package model

import (
	"github.com/gogf/gf/v2/os/gtime"
	"github.com/kennylixi/gadmin/internal/modules/system/model/entity"
)

type DbTableInfo struct {
	TableName    string      `json:"tableName"`    // 表名称
	TableComment string      `json:"tableComment"` // 表描述
	CreateTime   *gtime.Time `json:"createTime"`   // 创建时间
	UpdateTime   *gtime.Time `json:"updateTime"`   // 更新时间
}

type GenTableItem struct {
	Table          *entity.GenTable         `json:"table"`          // 表信息
	Columns        []*entity.GenTableColumn `json:"columns"`        // 表列信息
	PkColumn       *entity.GenTableColumn   `json:"pkColumn"`       // 主键
	SubTable       *GenTableItem            `json:"subTable"`       // 子表信息
	TreeCode       string                   `json:"treeCode"`       // Options 树编码字段
	TreeParentCode string                   `json:"treeParentCode"` // Options 树父编码字段
	TreeName       string                   `json:"treeName"`       // Options 树名称字段
	ParentMenuId   int64                    `json:"parentMenuId"`   // Options 上级菜单ID字段
	ParentMenuName string                   `json:"parentMenuName"` // Options 上级菜单名称字段
}

type GenTableListInput struct {
	TableName    string // 表名
	TableComment string // 表注释
	CreateBy     string // 创建者
}
type GenTableListOutput struct {
	List  []*entity.GenTable `json:"list"`  // 列表
	Total int                `json:"total"` // 数据总数
}

type GenTableDataListInput struct {
	TableName    string // 表名
	TableComment string // 表注释
}

type GenTableDbTableOutput struct {
	List  []*DbTableInfo `json:"list"`  // 列表
	Page  int            `json:"page"`  // 分页码
	Size  int            `json:"size"`  // 分页数量
	Total int            `json:"total"` // 数据总数
}

type GenTableUpdateInput struct {
	GenTableItem
	Params map[string]interface{}
}
