// ==========================================================================
// Code generated by GoFrame CLI tool. DO NOT EDIT.
// ==========================================================================

package internal

import (
	"context"

	"github.com/gogf/gf/v2/database/gdb"
	"github.com/gogf/gf/v2/frame/g"
)

// ConfigDao is the data access object for table sys_config.
type ConfigDao struct {
	table   string        // table is the underlying table name of the DAO.
	group   string        // group is the database configuration group name of current DAO.
	columns ConfigColumns // columns contains all the column names of Table for convenient usage.
}

// ConfigColumns defines and stores column names for table sys_config.
type ConfigColumns struct {
	ConfigId    string // 参数主键
	ConfigName  string // 参数名称
	ConfigKey   string // 参数键名
	ConfigValue string // 参数键值
	ConfigType  string // 系统内置（Y是 N否）
	CreateBy    string // 创建者
	CreatedAt   string // 创建时间
	UpdateBy    string // 更新者
	UpdatedAt   string // 更新时间
	Remark      string // 备注
}

// configColumns holds the columns for table sys_config.
var configColumns = ConfigColumns{
	ConfigId:    "config_id",
	ConfigName:  "config_name",
	ConfigKey:   "config_key",
	ConfigValue: "config_value",
	ConfigType:  "config_type",
	CreateBy:    "create_by",
	CreatedAt:   "created_at",
	UpdateBy:    "update_by",
	UpdatedAt:   "updated_at",
	Remark:      "remark",
}

// NewConfigDao creates and returns a new DAO object for table data access.
func NewConfigDao() *ConfigDao {
	return &ConfigDao{
		group:   "default",
		table:   "sys_config",
		columns: configColumns,
	}
}

// DB retrieves and returns the underlying raw database management object of current DAO.
func (dao *ConfigDao) DB() gdb.DB {
	return g.DB(dao.group)
}

// Table returns the table name of current dao.
func (dao *ConfigDao) Table() string {
	return dao.table
}

// Columns returns all column names of current dao.
func (dao *ConfigDao) Columns() ConfigColumns {
	return dao.columns
}

// Group returns the configuration group name of database of current dao.
func (dao *ConfigDao) Group() string {
	return dao.group
}

// Ctx creates and returns the Model for current DAO, It automatically sets the context for current operation.
func (dao *ConfigDao) Ctx(ctx context.Context) *gdb.Model {
	return dao.DB().Model(dao.table).Safe().Ctx(ctx)
}

// Transaction wraps the transaction logic using function f.
// It rollbacks the transaction and returns the error from function f if it returns non-nil error.
// It commits the transaction and returns nil if function f returns nil.
//
// Note that, you should not Commit or Rollback the transaction in function f
// as it is automatically handled by this function.
func (dao *ConfigDao) Transaction(ctx context.Context, f func(ctx context.Context, tx gdb.TX) error) (err error) {
	return dao.Ctx(ctx).Transaction(ctx, f)
}
