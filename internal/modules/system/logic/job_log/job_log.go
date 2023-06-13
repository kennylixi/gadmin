package job_log

import (
	"context"
	"github.com/gogf/gf/v2/database/gdb"
	"github.com/gogf/gf/v2/frame/g"
	"github.com/kennylixi/gadmin/internal/consts"
	"github.com/kennylixi/gadmin/internal/consts/cache_consts"
	"github.com/kennylixi/gadmin/internal/core/redislock"
	"github.com/kennylixi/gadmin/internal/modules/system/dao"
	"github.com/kennylixi/gadmin/internal/modules/system/model"
	"github.com/kennylixi/gadmin/internal/modules/system/model/do"
	"github.com/kennylixi/gadmin/internal/modules/system/model/entity"
	sysService "github.com/kennylixi/gadmin/internal/modules/system/service"
)

type sJobLog struct{}

func init() {
	sysService.RegisterJobLog(New())
}

func New() *sJobLog {
	return &sJobLog{}
}

// SelectJobLogById 查询定时任务调度日志表信息
// @param ctx 上下文
// @param id 定时任务调度日志表ID
func (s *sJobLog) SelectJobLogById(ctx context.Context, jobLogId int64) (*entity.JobLog, error) {
	return dao.JobLog.SelectJobLogById(ctx, jobLogId)
}

// SelectJobLogList 查询定时任务调度日志表列表
// @param ctx 上下文
// @param req 过滤条件
func (s *sJobLog) SelectJobLogList(ctx context.Context, in *model.JobLogListInput) (out *model.JobLogListOutput, err error) {
	out = &model.JobLogListOutput{}
	out.List, out.Total, err = dao.JobLog.SelectJobLogList(ctx, &entity.JobLog{
		InvokeTarget: in.InvokeTarget,
		Status:       in.Status,
	})
	return
}

// BatchInsert 新增定时任务调度日志表
// @param ctx 上下文
// @return 结果
func (s *sJobLog) BatchInsert(ctx context.Context, count int64) error {
	// 加锁防止一个没处理完立马处理第二个请求
	rl := redislock.NewRedisLock(g.Redis(), cache_consts.SysTaskLogLockKey)
	rl.SetExpire(consts.RedisLockExpire)
	ac, err := rl.AcquireCtx(ctx)
	if !ac || err != nil {
		return nil
	}
	defer rl.ReleaseCtx(ctx)

	rc, err := g.Redis().LLen(ctx, cache_consts.SysTaskLogKey)
	if err != nil {
		return err
	}
	if rc == 0 {
		return nil
	}
	if count > rc {
		count = rc
	}

	return dao.JobLog.Transaction(ctx, func(ctx context.Context, tx gdb.TX) error {
		vars, err := g.Redis().LRange(ctx, cache_consts.SysTaskLogKey, 0, count)
		if err != nil {
			return err
		}
		jobLogs := ([]*do.JobLog)(nil)
		if err = vars.Scan(&jobLogs); err != nil {
			return err
		}
		if _, err = dao.JobLog.Ctx(ctx).TX(tx).Batch(consts.BatchInsertNum).Insert(jobLogs); err != nil {
			return err
		}
		return g.Redis().LTrim(ctx, cache_consts.SysTaskLogKey, count, -1)
	})
}

// UpdateJobLog 修改定时任务调度日志表
// @param ctx 上下文
// @param req 定时任务调度日志表信息
// @return 结果
func (s *sJobLog) UpdateJobLog(ctx context.Context, jobLog *do.JobLog) error {
	err := dao.JobLog.UpdateJobLog(ctx, jobLog)
	return err
}

// DeleteJobLogByIds 批量删除定时任务调度日志表
// @param ctx 上下文
// @param JobLogIds 需要删除的定时任务调度日志表ID
// @return 结果
func (s *sJobLog) DeleteJobLogByIds(ctx context.Context, jobLogIds []int64) error {
	return dao.JobLog.DeleteJobLogByIds(ctx, jobLogIds)
}

// Clean 清空任务日志
func (s *sJobLog) Clean(ctx context.Context) error {
	return dao.JobLog.Clean(ctx)
}
