// ================================================================================
// Code generated by GoFrame CLI tool. DO NOT EDIT.
// You can delete these comments if you wish manually maintain this interface file.
// ================================================================================

package service

import (
	"context"
	"github.com/kennylixi/gadmin/internal/modules/system/model"
	entity2 "github.com/kennylixi/gadmin/internal/modules/system/model/entity"
	"github.com/kennylixi/go-push"
)

type (
	IPushChannel interface {
		All(ctx context.Context) (list []*model.PushChannelListItem, err error)
		GetAdapter(ctx context.Context, channelId int64) (adapter push.Adapter, err error)
		LoadAdapters(ctx context.Context) error
		SelectById(ctx context.Context, id int64) (channel *entity2.PushChannel, err error)
		GetTemplateParamsById(ctx context.Context, id int64) (params string, err error)
		SelectSimpleList(ctx context.Context, in *model.PushChannelSimpleListInput) (out model.PushChannelSimpleListOutput, err error)
		SelectList(ctx context.Context, in *model.PushChannelListInput) (out *model.PushChannelListOutput, err error)
		Insert(ctx context.Context, in *model.PushChannelAddInput) (err error)
		Update(ctx context.Context, in *model.PushChannelEditInput) (err error)
		HasByChannelIds(ctx context.Context, typeIds ...int64) (has bool, err error)
		DeleteByIds(ctx context.Context, ids []int64) (err error)
	}
)

var (
	localPushChannel IPushChannel
)

func PushChannel() IPushChannel {
	if localPushChannel == nil {
		panic("implement not found for interface IPushChannel, forgot register?")
	}
	return localPushChannel
}

func RegisterPushChannel(i IPushChannel) {
	localPushChannel = i
}
