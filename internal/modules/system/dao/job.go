// =================================================================================
// This is auto-generated by GoFrame CLI tool only once. Fill this file as you wish.
// =================================================================================

package dao

import (
	"context"
	"github.com/gogf/gf/v2/database/gdb"
	"github.com/kennylixi/gadmin/internal/modules/system/dao/internal"
	"github.com/kennylixi/gadmin/internal/modules/system/model/do"
)

// internalJobDao is internal type for wrapping internal DAO implements.
type internalJobDao = *internal.JobDao

// jobDao is the data access object for table sys_job.
// You can define custom methods on it to extend its functionality as you wish.
type jobDao struct {
	internalJobDao
}

var (
	// Job is globally public accessible object for table sys_job operations.
	Job = jobDao{
		internal.NewJobDao(),
	}
)

// Fill with you ideas below.

// InsertJob 新增定时任务调度表
//	@param job 定时任务调度表
func (d *jobDao) InsertJob(ctx context.Context, job *do.Job, tx ...gdb.TX) (int64, error) {
	m := Job.Ctx(ctx)
	if len(tx) > 0 {
		m = m.TX(tx[0])
	}
	id, err := m.InsertAndGetId(job)
	if err != nil {
		return 0, err
	}
	return id, nil
}

// UpdateJob 修改定时任务调度表
//	@param job 定时任务调度表
func (d *jobDao) UpdateJob(ctx context.Context, job *do.Job, tx ...gdb.TX) error {
	m := Job.Ctx(ctx)
	if len(tx) > 0 {
		m = m.TX(tx[0])
	}
	_, err := m.Update(job, Job.Columns().JobId, job.JobId)
	return err
}

// DeleteJobById 删除定时任务调度表
//	@param JobId 定时任务调度表ID
func (d *jobDao) DeleteJobById(ctx context.Context, jobId int64, tx ...gdb.TX) error {
	m := Job.Ctx(ctx)
	if len(tx) > 0 {
		m = m.TX(tx[0])
	}
	_, err := m.Delete(Job.Columns().JobId, jobId)
	return err
}

// DeleteJobByIds 批量删除定时任务调度表
//	@param JobIds 需要删除的数据ID
func (d *jobDao) DeleteJobByIds(ctx context.Context, jobIds []int64, tx ...gdb.TX) error {
	m := Job.Ctx(ctx)
	if len(tx) > 0 {
		m = m.TX(tx[0])
	}
	_, err := m.Delete(Job.Columns().JobId, jobIds)
	return err
}
