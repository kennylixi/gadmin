// ================================================================================
// Code generated by GoFrame CLI tool. DO NOT EDIT.
// You can delete these comments if you wish manually maintain this interface file.
// ================================================================================

package service

import (
	"context"
	"github.com/kennylixi/gadmin/internal/modules/system/model"
	"github.com/kennylixi/gadmin/internal/modules/system/model/entity"
)

type (
	IFileDriver interface {
		SelectById(ctx context.Context, id int64) (fileDriver *entity.FileDriver, err error)
		GetMasterDriver(ctx context.Context) (fileDriver *entity.FileDriver, err error)
		SelectList(ctx context.Context, in *model.FileDriverListInput) (out *model.FileDriverListOutput, err error)
		Insert(ctx context.Context, in *model.FileDriverAddInput) (err error)
		Update(ctx context.Context, in *model.FileDriverEditInput) (err error)
		DeleteByIds(ctx context.Context, ids []int64) error
		SetMaster(ctx context.Context, id int64) error
		Test(ctx context.Context, id int64) error
	}
)

var (
	localFileDriver IFileDriver
)

func FileDriver() IFileDriver {
	if localFileDriver == nil {
		panic("implement not found for interface IFileDriver, forgot register?")
	}
	return localFileDriver
}

func RegisterFileDriver(i IFileDriver) {
	localFileDriver = i
}
