// ================================================================================
// Code generated by GoFrame CLI tool. DO NOT EDIT.
// You can delete these comments if you wish manually maintain this interface file.
// ================================================================================

package service

import (
	"context"
	commonModel "github.com/kennylixi/gadmin/internal/modules/common/model"
	systemModel "github.com/kennylixi/gadmin/internal/modules/system/model"
	"github.com/kennylixi/gadmin/internal/modules/system/model/entity"
)

type (
	IPushType interface {
		GetList(ctx context.Context, in *systemModel.PushTypeListInput) (out []*systemModel.PushType, err error)
		GetById(ctx context.Context, id int64) (cate *entity.PushType, err error)
		BuildMenuTreeSelect(cates []*systemModel.PushType) []*commonModel.TreeSelect
		Insert(ctx context.Context, in *systemModel.PushTypeAddInput) error
		Update(ctx context.Context, in *systemModel.PushTypeEditInput) (err error)
		Delete(ctx context.Context, id int64) (err error)
	}
)

var (
	localPushType IPushType
)

func PushType() IPushType {
	if localPushType == nil {
		panic("implement not found for interface IPushType, forgot register?")
	}
	return localPushType
}

func RegisterPushType(i IPushType) {
	localPushType = i
}
