package admin

import (
	"context"
	"github.com/kennylixi/gadmin/internal/modules/system/api/v1/admin"
	"github.com/kennylixi/gadmin/internal/modules/system/model"
	sysService "github.com/kennylixi/gadmin/internal/modules/system/service"
)

// JobLog 系统任务日志管理
var JobLog = cJobLog{}

type cJobLog struct{}

// List 查询定时任务调度日志表列表
func (c *cJobLog) List(ctx context.Context, req *admin.JobLogListReq) (res *admin.JobLogListRes, err error) {
	out, err := sysService.JobLog().SelectJobLogList(ctx, &model.JobLogListInput{
		InvokeTarget: req.InvokeTarget,
		Status:       req.Status,
	})
	if err != nil {
		return
	}
	res = &admin.JobLogListRes{
		List:  out.List,
		Total: out.Total,
	}
	return
}

// GetInfo 获取定时任务调度日志表详细信息
func (c *cJobLog) GetInfo(ctx context.Context, req *admin.JobLogGetInfoReq) (res *admin.JobLogGetInfoRes, err error) {
	out, err := sysService.JobLog().SelectJobLogById(ctx, req.JobLogId)
	if err != nil {
		return
	}
	res = (*admin.JobLogGetInfoRes)(out)
	return
}

// Delete 删除定时任务调度日志表
func (c *cJobLog) Delete(ctx context.Context, req *admin.JobLogDeleteReq) (res *admin.JobLogDeleteRes, err error) {
	err = sysService.JobLog().DeleteJobLogByIds(ctx, req.JobLogIds)
	return
}

// Clean 删除定时任务调度日志表
func (c *cJobLog) Clean(ctx context.Context, req *admin.JobLogCleanReq) (res *admin.JobLogCleanRes, err error) {
	err = sysService.JobLog().Clean(ctx)
	return
}
