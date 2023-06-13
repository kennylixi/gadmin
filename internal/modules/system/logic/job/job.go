package job

import (
	"context"
	"github.com/gogf/gf/v2/container/gvar"
	"github.com/gogf/gf/v2/errors/gerror"
	"github.com/gogf/gf/v2/frame/g"
	"github.com/gogf/gf/v2/text/gstr"
	"github.com/gogf/gf/v2/util/gconv"
	"github.com/kennylixi/gadmin/internal/asynq/client"
	asynqModel "github.com/kennylixi/gadmin/internal/asynq/model"
	"github.com/kennylixi/gadmin/internal/consts/cache_consts"
	commonService "github.com/kennylixi/gadmin/internal/modules/common/service"
	"github.com/kennylixi/gadmin/internal/modules/system/dao"
	systemModel "github.com/kennylixi/gadmin/internal/modules/system/model"
	"github.com/kennylixi/gadmin/internal/modules/system/model/do"
	"github.com/kennylixi/gadmin/internal/modules/system/model/entity"
	sysService "github.com/kennylixi/gadmin/internal/modules/system/service"
	"github.com/robfig/cron/v3"
)

type sJob struct{}

func init() {
	sysService.RegisterJob(New())
}

func New() *sJob {
	return &sJob{}
}

// SelectJobById 查询定时任务调度表信息
// @param ctx 上下文
// @param id 定时任务调度表ID
func (s *sJob) SelectJobById(ctx context.Context, jobId int64) (job *systemModel.Job, err error) {
	err = dao.Job.Ctx(ctx).Fields(&entity.Job{}).Scan(&job, dao.Job.Columns().JobId, jobId)
	if err != nil {
		return nil, err
	}
	if job == nil {
		return nil, gerror.New("数据不存在")
	}

	lastTime, err := g.Redis().HGet(ctx, cache_consts.SysTaskLastTimeKey, string(job.JobId))
	if lastTime.IsNil() || err != nil {
		return
	}
	job.LastTime = lastTime.GTime()
	schedule, err := cron.ParseStandard(job.CronExpression)
	if err != nil {
		return
	}
	job.NextTime = gconv.GTime(schedule.Next(job.LastTime.Time))
	return job, nil
}

// SelectJobList 查询定时任务调度表列表
// @param ctx 上下文
// @param req 过滤条件
func (s *sJob) SelectJobList(ctx context.Context, in *systemModel.JobListInput) (out *systemModel.JobListOutput, err error) {
	out = &systemModel.JobListOutput{}
	m := dao.Job.Ctx(ctx)
	if jobName := gstr.Trim(in.JobName); len(jobName) > 0 {
		m = m.WhereLike(dao.Job.Columns().JobName, "%"+jobName+"%")
	}
	if jobGroup := gstr.Trim(in.JobGroup); len(jobGroup) > 0 {
		m = m.Where(dao.Job.Columns().JobGroup, jobGroup)
	}
	if status := gstr.Trim(in.Status); len(status) > 0 {
		m = m.Where(dao.Job.Columns().Status, status)
	}
	out.Total, err = m.Count()
	if err != nil || out.Total == 0 {
		return
	}
	err = commonService.BizCtx().Page(ctx, m).Fields(&entity.Job{}).Scan(&out.List)
	if err != nil {
		return
	}
	for _, job := range out.List {
		lastTime, _ := g.Redis().HGet(ctx, cache_consts.SysTaskLastTimeKey, string(job.JobId))
		job.LastTime = lastTime.GTime()
	}
	return
}

// SelectJobListByStatus 查询定时任务调度表列表
// @param ctx 上下文
// @param req 过滤条件
func (s *sJob) SelectJobListByStatus(ctx context.Context, status string) (list []*systemModel.Job, err error) {
	m := dao.Job.Ctx(ctx).Fields(&entity.Job{})
	if status = gstr.Trim(status); len(status) > 0 {
		m = m.Where(dao.Job.Columns().Status, status)
	}

	if err = m.Scan(&list); err != nil {
		return
	}
	for _, job := range list {
		lastTime, _ := g.Redis().HGet(ctx, cache_consts.SysTaskLastTimeKey, string(job.JobId))
		job.LastTime = lastTime.GTime()
	}
	return
}

// InsertJob 新增定时任务调度表
// @param ctx 上下文
// @param req 定时任务调度表信息
// @return 结果
func (s *sJob) InsertJob(ctx context.Context, in *systemModel.JobAddInput) error {
	_, err := cron.ParseStandard(in.CronExpression)
	if err != nil {
		return gerror.Wrap(err, "cron表达式错误")
	}
	_, err = dao.Job.Ctx(ctx).Insert(&do.Job{
		JobName:        in.JobName,
		JobGroup:       in.JobGroup,
		InvokeTarget:   in.InvokeTarget,
		InvokeParams:   in.InvokeParams,
		CronExpression: in.CronExpression,
		MaxRetry:       in.MaxRetry,
		RetryDelay:     in.RetryDelay,
		IsRecordLog:    in.IsRecordLog,
		Status:         in.Status,
		CreateBy:       in.CreateBy,
		Remark:         in.Remark,
	})
	return err
}

// UpdateJob 修改定时任务调度表
// @param ctx 上下文
// @param req 定时任务调度表信息
// @return 结果
func (s *sJob) UpdateJob(ctx context.Context, in *systemModel.JobEditInput) error {
	_, err := cron.ParseStandard(in.CronExpression)
	if err != nil {
		return gerror.Wrap(err, "cron表达式错误")
	}
	_, err = dao.Job.Ctx(ctx).Update(&do.Job{
		JobId:          in.JobId,
		JobName:        in.JobName,
		JobGroup:       in.JobGroup,
		InvokeTarget:   in.InvokeTarget,
		InvokeParams:   in.InvokeParams,
		CronExpression: in.CronExpression,
		MaxRetry:       in.MaxRetry,
		RetryDelay:     in.RetryDelay,
		IsRecordLog:    in.IsRecordLog,
		Status:         in.Status,
		UpdateBy:       in.UpdateBy,
		Remark:         in.Remark,
	}, dao.Job.Columns().JobId, in.JobId)
	return err
}

// ChangeStatus 修改定时任务调度状态
// @param ctx 	 上下文
// @param jobId  任务Id
// @param status 状态
// @return 结果
func (s *sJob) ChangeStatus(ctx context.Context, in *systemModel.JobChangeStatusInput) error {
	_, err := dao.Job.Ctx(ctx).Update(
		map[string]interface{}{
			dao.Job.Columns().Status: in.Status,
		}, dao.Job.Columns().JobId, in.JobId)
	return err
}

// Run 立即运行任务
// @param ctx 	 上下文
// @param jobId  任务Id
// @return 结果
func (s *sJob) Run(ctx context.Context, jobId int64) error {
	job, err := s.SelectJobById(ctx, jobId)
	if err != nil {
		return err
	}
	err = client.NewTask(ctx, job.InvokeTarget, &asynqModel.Payload{
		RetryDelay:  job.RetryDelay,
		IsRecordLog: true,
		Payload:     gvar.New(job.InvokeParams),
	})
	return err
}

// DeleteJobByIds 批量删除定时任务调度表
// @param ctx 上下文
// @param JobIds 需要删除的定时任务调度表ID
// @return 结果
func (s *sJob) DeleteJobByIds(ctx context.Context, jobIds []int64) error {
	if err := dao.Job.DeleteJobByIds(ctx, jobIds); err != nil {
		return err
	}
	jobIdStrList := make([]string, len(jobIds))
	for i, jobId := range jobIds {
		jobIdStrList[i] = string(jobId)
	}
	g.Redis().HDel(ctx, cache_consts.SysTaskLastTimeKey, jobIdStrList...)
	return nil
}
