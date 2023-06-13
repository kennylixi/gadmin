// ==========================================================================
// Code generated by GoFrame CLI tool. DO NOT EDIT.
// ==========================================================================

package internal

import (
	"context"

	"github.com/gogf/gf/v2/database/gdb"
	"github.com/gogf/gf/v2/frame/g"
)

// OperLogDao is the data access object for table sys_oper_log.
type OperLogDao struct {
	table   string         // table is the underlying table name of the DAO.
	group   string         // group is the database configuration group name of current DAO.
	columns OperLogColumns // columns contains all the column names of Table for convenient usage.
}

// OperLogColumns defines and stores column names for table sys_oper_log.
type OperLogColumns struct {
	OperId        string // 日志主键
	Title         string // 模块标题
	BusinessType  string // 业务类型（0其它 1新增 2修改 3删除）
	Method        string // 方法名称
	RequestMethod string // 请求方式
	OperatorType  string // 操作类别（0其它 1后台用户 2手机端用户）
	OperName      string // 操作人员
	DeptName      string // 部门名称
	OperUrl       string // 请求URL
	OperIp        string // 主机地址
	OperLocation  string // 操作地点
	OperParam     string // 请求参数
	JsonResult    string // 返回参数
	Status        string // 操作状态（0正常 1异常）
	ErrorMsg      string // 错误消息
	OperTime      string // 操作时间
	ExecuteTime   string // 耗时
}

// operLogColumns holds the columns for table sys_oper_log.
var operLogColumns = OperLogColumns{
	OperId:        "oper_id",
	Title:         "title",
	BusinessType:  "business_type",
	Method:        "method",
	RequestMethod: "request_method",
	OperatorType:  "operator_type",
	OperName:      "oper_name",
	DeptName:      "dept_name",
	OperUrl:       "oper_url",
	OperIp:        "oper_ip",
	OperLocation:  "oper_location",
	OperParam:     "oper_param",
	JsonResult:    "json_result",
	Status:        "status",
	ErrorMsg:      "error_msg",
	OperTime:      "oper_time",
	ExecuteTime:   "execute_time",
}

// NewOperLogDao creates and returns a new DAO object for table data access.
func NewOperLogDao() *OperLogDao {
	return &OperLogDao{
		group:   "default",
		table:   "sys_oper_log",
		columns: operLogColumns,
	}
}

// DB retrieves and returns the underlying raw database management object of current DAO.
func (dao *OperLogDao) DB() gdb.DB {
	return g.DB(dao.group)
}

// Table returns the table name of current dao.
func (dao *OperLogDao) Table() string {
	return dao.table
}

// Columns returns all column names of current dao.
func (dao *OperLogDao) Columns() OperLogColumns {
	return dao.columns
}

// Group returns the configuration group name of database of current dao.
func (dao *OperLogDao) Group() string {
	return dao.group
}

// Ctx creates and returns the Model for current DAO, It automatically sets the context for current operation.
func (dao *OperLogDao) Ctx(ctx context.Context) *gdb.Model {
	return dao.DB().Model(dao.table).Safe().Ctx(ctx)
}

// Transaction wraps the transaction logic using function f.
// It rollbacks the transaction and returns the error from function f if it returns non-nil error.
// It commits the transaction and returns nil if function f returns nil.
//
// Note that, you should not Commit or Rollback the transaction in function f
// as it is automatically handled by this function.
func (dao *OperLogDao) Transaction(ctx context.Context, f func(ctx context.Context, tx gdb.TX) error) (err error) {
	return dao.Ctx(ctx).Transaction(ctx, f)
}
