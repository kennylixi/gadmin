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
	ILogininfor interface {
		SelectList(ctx context.Context, in *model.LoginInforListInput) (out *model.LoginInforListOutput, err error)
		DeleteByIds(ctx context.Context, ids []int64) error
		Clear(ctx context.Context) error
		BatchInsert(ctx context.Context, count int64) error
	}
)

var (
	localLogininfor ILogininfor
)

func Logininfor() ILogininfor {
	if localLogininfor == nil {
		panic("implement not found for interface ILogininfor, forgot register?")
	}
	return localLogininfor
}

func RegisterLogininfor(i ILogininfor) {
	localLogininfor = i
}
