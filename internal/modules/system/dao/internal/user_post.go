// ==========================================================================
// Code generated by GoFrame CLI tool. DO NOT EDIT.
// ==========================================================================

package internal

import (
	"context"

	"github.com/gogf/gf/v2/database/gdb"
	"github.com/gogf/gf/v2/frame/g"
)

// UserPostDao is the data access object for table sys_user_post.
type UserPostDao struct {
	table   string          // table is the underlying table name of the DAO.
	group   string          // group is the database configuration group name of current DAO.
	columns UserPostColumns // columns contains all the column names of Table for convenient usage.
}

// UserPostColumns defines and stores column names for table sys_user_post.
type UserPostColumns struct {
	UserId string // 用户ID
	PostId string // 岗位ID
}

// userPostColumns holds the columns for table sys_user_post.
var userPostColumns = UserPostColumns{
	UserId: "user_id",
	PostId: "post_id",
}

// NewUserPostDao creates and returns a new DAO object for table data access.
func NewUserPostDao() *UserPostDao {
	return &UserPostDao{
		group:   "default",
		table:   "sys_user_post",
		columns: userPostColumns,
	}
}

// DB retrieves and returns the underlying raw database management object of current DAO.
func (dao *UserPostDao) DB() gdb.DB {
	return g.DB(dao.group)
}

// Table returns the table name of current dao.
func (dao *UserPostDao) Table() string {
	return dao.table
}

// Columns returns all column names of current dao.
func (dao *UserPostDao) Columns() UserPostColumns {
	return dao.columns
}

// Group returns the configuration group name of database of current dao.
func (dao *UserPostDao) Group() string {
	return dao.group
}

// Ctx creates and returns the Model for current DAO, It automatically sets the context for current operation.
func (dao *UserPostDao) Ctx(ctx context.Context) *gdb.Model {
	return dao.DB().Model(dao.table).Safe().Ctx(ctx)
}

// Transaction wraps the transaction logic using function f.
// It rollbacks the transaction and returns the error from function f if it returns non-nil error.
// It commits the transaction and returns nil if function f returns nil.
//
// Note that, you should not Commit or Rollback the transaction in function f
// as it is automatically handled by this function.
func (dao *UserPostDao) Transaction(ctx context.Context, f func(ctx context.Context, tx gdb.TX) error) (err error) {
	return dao.Ctx(ctx).Transaction(ctx, f)
}
