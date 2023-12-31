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
	IConfig interface {
		List(ctx context.Context, in *model.ConfigListInput) (out *model.ConfigListOutput, err error)
		GetByConfigId(ctx context.Context, configId int64) (config *entity.Config, err error)
		GetByConfigKey(ctx context.Context, configKey string) (configValue string, err error)
		GetCaptchaOnOff(ctx context.Context) (bool, error)
		Add(ctx context.Context, in *model.ConfigAddInput) (configId int64, err error)
		Edit(ctx context.Context, in *model.ConfigEditInput) (err error)
		Delete(ctx context.Context, configIds []int64) error
		CheckConfigKeyUnique(ctx context.Context, configKey string, configId int64) (bool, error)
		LoadingCache(ctx context.Context) error
		ClearCache(ctx context.Context) error
		ResetCache(ctx context.Context)
	}
)

var (
	localConfig IConfig
)

func Config() IConfig {
	if localConfig == nil {
		panic("implement not found for interface IConfig, forgot register?")
	}
	return localConfig
}

func RegisterConfig(i IConfig) {
	localConfig = i
}
