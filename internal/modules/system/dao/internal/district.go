// ==========================================================================
// Code generated by GoFrame CLI tool. DO NOT EDIT.
// ==========================================================================

package internal

import (
	"context"

	"github.com/gogf/gf/v2/database/gdb"
	"github.com/gogf/gf/v2/frame/g"
)

// DistrictDao is the data access object for table sys_district.
type DistrictDao struct {
	table   string          // table is the underlying table name of the DAO.
	group   string          // group is the database configuration group name of current DAO.
	columns DistrictColumns // columns contains all the column names of Table for convenient usage.
}

// DistrictColumns defines and stores column names for table sys_district.
type DistrictColumns struct {
	Id          string // 编号
	ParentId    string // 上级编号
	Ancestors   string // 祖级列表
	Name        string // 地区名称
	Center      string // 经纬度
	Citycode    string // 城市编码
	Adcode      string // 邮编
	Pinyin      string // 拼音
	FirstPinyin string // 拼音第一个字母
	Level       string // 级别
	Status      string // 是否开放
	OrderNum    string // 排序
	CreateBy    string // 创建者
	CreatedAt   string // 创建时间
	UpdateBy    string // 更新者
	UpdatedAt   string // 更新时间
	DeletedAt   string // 删除时间
}

// districtColumns holds the columns for table sys_district.
var districtColumns = DistrictColumns{
	Id:          "id",
	ParentId:    "parent_id",
	Ancestors:   "ancestors",
	Name:        "name",
	Center:      "center",
	Citycode:    "citycode",
	Adcode:      "adcode",
	Pinyin:      "pinyin",
	FirstPinyin: "first_pinyin",
	Level:       "level",
	Status:      "status",
	OrderNum:    "order_num",
	CreateBy:    "create_by",
	CreatedAt:   "created_at",
	UpdateBy:    "update_by",
	UpdatedAt:   "updated_at",
	DeletedAt:   "deleted_at",
}

// NewDistrictDao creates and returns a new DAO object for table data access.
func NewDistrictDao() *DistrictDao {
	return &DistrictDao{
		group:   "default",
		table:   "sys_district",
		columns: districtColumns,
	}
}

// DB retrieves and returns the underlying raw database management object of current DAO.
func (dao *DistrictDao) DB() gdb.DB {
	return g.DB(dao.group)
}

// Table returns the table name of current dao.
func (dao *DistrictDao) Table() string {
	return dao.table
}

// Columns returns all column names of current dao.
func (dao *DistrictDao) Columns() DistrictColumns {
	return dao.columns
}

// Group returns the configuration group name of database of current dao.
func (dao *DistrictDao) Group() string {
	return dao.group
}

// Ctx creates and returns the Model for current DAO, It automatically sets the context for current operation.
func (dao *DistrictDao) Ctx(ctx context.Context) *gdb.Model {
	return dao.DB().Model(dao.table).Safe().Ctx(ctx)
}

// Transaction wraps the transaction logic using function f.
// It rollbacks the transaction and returns the error from function f if it returns non-nil error.
// It commits the transaction and returns nil if function f returns nil.
//
// Note that, you should not Commit or Rollback the transaction in function f
// as it is automatically handled by this function.
func (dao *DistrictDao) Transaction(ctx context.Context, f func(ctx context.Context, tx gdb.TX) error) (err error) {
	return dao.Ctx(ctx).Transaction(ctx, f)
}
