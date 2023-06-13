package admin

import (
	"context"
	commonService "github.com/kennylixi/gadmin/internal/modules/common/service"
	"github.com/kennylixi/gadmin/internal/modules/system/api/v1/admin"
	"github.com/kennylixi/gadmin/internal/modules/system/model"
	sysService "github.com/kennylixi/gadmin/internal/modules/system/service"
)

// Job 系统任务管理
var Job = cJob{}

type cJob struct{}

// List 查询定时任务调度表列表
func (c *cJob) List(ctx context.Context, req *admin.JobListReq) (res *admin.JobListRes, err error) {
	out, err := sysService.Job().SelectJobList(ctx, &model.JobListInput{
		JobName:  req.JobName,
		JobGroup: req.JobGroup,
		Status:   req.Status,
	})
	if err != nil {
		return
	}
	res = &admin.JobListRes{
		List:  out.List,
		Total: out.Total,
	}
	return
}

// GetInfo 获取定时任务调度表详细信息
func (c *cJob) GetInfo(ctx context.Context, req *admin.JobGetInfoReq) (res *admin.JobGetInfoRes, err error) {
	data, err := sysService.Job().SelectJobById(ctx, req.JobId)
	if err != nil {
		return
	}
	res = (*admin.JobGetInfoRes)(data)
	return
}

// Add 新增定时任务调度表
func (c *cJob) Add(ctx context.Context, req *admin.JobAddReq) (res *admin.JobAddRes, err error) {
	in := &model.JobAddInput{
		JobName:        req.JobName,
		JobGroup:       req.JobGroup,
		InvokeTarget:   req.InvokeTarget,
		InvokeParams:   req.InvokeParams,
		CronExpression: req.CronExpression,
		MaxRetry:       req.MaxRetry,
		RetryDelay:     req.RetryDelay,
		IsRecordLog:    req.IsRecordLog,
		Status:         req.Status,
		Remark:         req.Remark,
		CreateBy:       commonService.BizCtx().GetUserName(ctx),
	}
	err = sysService.Job().InsertJob(ctx, in)
	return
}

// Edit 修改定时任务调度表
func (c *cJob) Edit(ctx context.Context, req *admin.JobEditReq) (res *admin.JobEditRes, err error) {
	in := &model.JobEditInput{
		JobId:          req.JobId,
		JobName:        req.JobName,
		JobGroup:       req.JobGroup,
		InvokeTarget:   req.InvokeTarget,
		InvokeParams:   req.InvokeParams,
		CronExpression: req.CronExpression,
		MaxRetry:       req.MaxRetry,
		RetryDelay:     req.RetryDelay,
		IsRecordLog:    req.IsRecordLog,
		Status:         req.Status,
		Remark:         req.Remark,
		UpdateBy:       commonService.BizCtx().GetUserName(ctx),
	}
	err = sysService.Job().UpdateJob(ctx, in)
	return
}

// ChangeStatus 定时任务状态修改
func (c *cJob) ChangeStatus(ctx context.Context, req *admin.JobChangeStatusReq) (res *admin.JobChangeStatusRes, err error) {
	err = sysService.Job().ChangeStatus(ctx, &model.JobChangeStatusInput{
		JobId:  req.JobId,
		Status: req.Status,
	})
	return
}

// Run 定时任务立即执行一次
func (c *cJob) Run(ctx context.Context, req *admin.JobRunReq) (res *admin.JobRunRes, err error) {
	err = sysService.Job().Run(ctx, req.JobId)
	return
}

// Delete 删除定时任务调度表
func (c *cJob) Delete(ctx context.Context, req *admin.JobDeleteReq) (res *admin.JobDeleteRes, err error) {
	err = sysService.Job().DeleteJobByIds(ctx, req.JobIds)
	return
}
