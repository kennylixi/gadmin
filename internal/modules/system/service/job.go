// ================================================================================
// Code generated by GoFrame CLI tool. DO NOT EDIT.
// You can delete these comments if you wish manually maintain this interface file.
// ================================================================================

package service

import (
	"context"
	"github.com/kennylixi/gadmin/internal/modules/system/model"
)

type (
	IJob interface {
		SelectJobById(ctx context.Context, jobId int64) (job *model.Job, err error)
		SelectJobList(ctx context.Context, in *model.JobListInput) (out *model.JobListOutput, err error)
		SelectJobListByStatus(ctx context.Context, status string) (list []*model.Job, err error)
		InsertJob(ctx context.Context, in *model.JobAddInput) error
		UpdateJob(ctx context.Context, in *model.JobEditInput) error
		ChangeStatus(ctx context.Context, in *model.JobChangeStatusInput) error
		Run(ctx context.Context, jobId int64) error
		DeleteJobByIds(ctx context.Context, jobIds []int64) error
	}
)

var (
	localJob IJob
)

func Job() IJob {
	if localJob == nil {
		panic("implement not found for interface IJob, forgot register?")
	}
	return localJob
}

func RegisterJob(i IJob) {
	localJob = i
}