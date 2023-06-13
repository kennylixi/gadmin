// ==========================================================================
// Code generated by GoFrame CLI tool. DO NOT EDIT.
// ==========================================================================

package internal

import (
	"context"

	"github.com/gogf/gf/v2/database/gdb"
	"github.com/gogf/gf/v2/frame/g"
)

// JobDao is the data access object for table sys_job.
type JobDao struct {
	table   string     // table is the underlying table name of the DAO.
	group   string     // group is the database configuration group name of current DAO.
	columns JobColumns // columns contains all the column names of Table for convenient usage.
}

// JobColumns defines and stores column names for table sys_job.
type JobColumns struct {
	JobId          string // 任务ID
	JobName        string // 任务名称
	JobGroup       string // 任务组名
	InvokeTarget   string // 调用目标字符串
	InvokeParams   string // 调用目标参数
	CronExpression string // cron执行表达式
	MaxRetry       string // 重试次数
	RetryDelay     string // 重试间隔
	IsRecordLog    string // 是否记录执行日志
	Status         string // 状态（0正常 1暂停）
	CreateBy       string // 创建者
	CreatedAt      string // 创建时间
	UpdateBy       string // 更新者
	UpdatedAt      string // 更新时间
	Remark         string // 备注信息
}

// jobColumns holds the columns for table sys_job.
var jobColumns = JobColumns{
	JobId:          "job_id",
	JobName:        "job_name",
	JobGroup:       "job_group",
	InvokeTarget:   "invoke_target",
	InvokeParams:   "invoke_params",
	CronExpression: "cron_expression",
	MaxRetry:       "max_retry",
	RetryDelay:     "retry_delay",
	IsRecordLog:    "is_record_log",
	Status:         "status",
	CreateBy:       "create_by",
	CreatedAt:      "created_at",
	UpdateBy:       "update_by",
	UpdatedAt:      "updated_at",
	Remark:         "remark",
}

// NewJobDao creates and returns a new DAO object for table data access.
func NewJobDao() *JobDao {
	return &JobDao{
		group:   "default",
		table:   "sys_job",
		columns: jobColumns,
	}
}

// DB retrieves and returns the underlying raw database management object of current DAO.
func (dao *JobDao) DB() gdb.DB {
	return g.DB(dao.group)
}

// Table returns the table name of current dao.
func (dao *JobDao) Table() string {
	return dao.table
}

// Columns returns all column names of current dao.
func (dao *JobDao) Columns() JobColumns {
	return dao.columns
}

// Group returns the configuration group name of database of current dao.
func (dao *JobDao) Group() string {
	return dao.group
}

// Ctx creates and returns the Model for current DAO, It automatically sets the context for current operation.
func (dao *JobDao) Ctx(ctx context.Context) *gdb.Model {
	return dao.DB().Model(dao.table).Safe().Ctx(ctx)
}

// Transaction wraps the transaction logic using function f.
// It rollbacks the transaction and returns the error from function f if it returns non-nil error.
// It commits the transaction and returns nil if function f returns nil.
//
// Note that, you should not Commit or Rollback the transaction in function f
// as it is automatically handled by this function.
func (dao *JobDao) Transaction(ctx context.Context, f func(ctx context.Context, tx gdb.TX) error) (err error) {
	return dao.Ctx(ctx).Transaction(ctx, f)
}
