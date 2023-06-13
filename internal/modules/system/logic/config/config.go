package config

import (
	"context"
	"github.com/gogf/gf/v2/database/gdb"
	"github.com/gogf/gf/v2/errors/gerror"
	"github.com/gogf/gf/v2/frame/g"
	"github.com/gogf/gf/v2/util/gconv"
	"github.com/kennylixi/gadmin/internal/consts/cache_consts"
	"github.com/kennylixi/gadmin/internal/consts/config_consts"
	"github.com/kennylixi/gadmin/internal/consts/user_consts"
	commonService "github.com/kennylixi/gadmin/internal/modules/common/service"
	"github.com/kennylixi/gadmin/internal/modules/system/dao"
	"github.com/kennylixi/gadmin/internal/modules/system/model"
	"github.com/kennylixi/gadmin/internal/modules/system/model/do"
	"github.com/kennylixi/gadmin/internal/modules/system/model/entity"
	sysService "github.com/kennylixi/gadmin/internal/modules/system/service"
)

type sConfig struct{}

func init() {
	sysService.RegisterConfig(New())
}

func New() *sConfig {
	return &sConfig{}
}

// List 获取参数配置列表
func (s *sConfig) List(ctx context.Context, in *model.ConfigListInput) (out *model.ConfigListOutput, err error) {
	out = &model.ConfigListOutput{
		List: ([]*model.ConfigListItem)(nil),
	}
	m := dao.Config.Ctx(ctx)
	if len(in.ConfigKey) > 0 {
		m = m.WhereLike(dao.Config.Columns().ConfigKey, "%"+in.ConfigKey+"%")
	}
	if len(in.ConfigName) > 0 {
		m = m.WhereLike(dao.Config.Columns().ConfigName, "%"+in.ConfigName+"%")
	}
	if len(in.ConfigType) > 0 {
		m = m.Where(dao.Config.Columns().ConfigType, in.ConfigType)
	}
	m = commonService.BizCtx().WhereBeginTime(ctx, dao.Config.Columns().CreatedAt, m)
	m = commonService.BizCtx().WhereEndTime(ctx, dao.Config.Columns().CreatedAt, m)

	out.Total, err = m.Fields("*").Count()
	if err != nil || out.Total == 0 {
		return
	}

	err = commonService.BizCtx().Page(ctx, m).Fields(model.ConfigListItem{}).Scan(&out.List)

	return
}

// GetByConfigId 根据参数编号获取详细信息
func (s *sConfig) GetByConfigId(ctx context.Context, configId int64) (config *entity.Config, err error) {
	err = dao.Config.Ctx(ctx).Scan(&config, do.Config{ConfigId: configId})
	return
}

// GetByConfigKey 根据参数编号获取详细信息
func (s *sConfig) GetByConfigKey(ctx context.Context, configKey string) (configValue string, err error) {
	value, err := g.Redis().Get(ctx, s.getCacheKey(configKey))
	if err == nil {
		configValue = value.String()
		return
	}

	config := (*entity.Config)(nil)
	err = dao.Config.Ctx(ctx).Scan(&config, do.Config{ConfigKey: configKey})
	if err != nil {
		return "", err
	}
	configValue = config.ConfigValue
	_, err = g.Redis().Set(ctx, s.getCacheKey(configKey), configValue)
	return
}

// GetCaptchaOnOff 获取验证码开关
//	@return true开启，false关闭
func (s *sConfig) GetCaptchaOnOff(ctx context.Context) (bool, error) {
	captchaOnOff, err := s.GetByConfigKey(ctx, config_consts.SysAccountCaptchaOnOff)
	if err != nil {
		return false, err
	}
	return gconv.Bool(captchaOnOff), nil
}

// Add 新增参数配置
func (s *sConfig) Add(ctx context.Context, in *model.ConfigAddInput) (configId int64, err error) {
	err = dao.Config.Transaction(ctx, func(ctx context.Context, tx gdb.TX) error {
		configId, err = dao.Config.Ctx(ctx).InsertAndGetId(&do.Config{
			ConfigName:  in.ConfigName,
			ConfigKey:   in.ConfigKey,
			ConfigValue: in.ConfigValue,
			ConfigType:  in.ConfigType,
			CreateBy:    in.CreateBy,
			Remark:      in.Remark,
		})
		if err != nil {
			return err
		}
		_, err = g.Redis().Set(ctx, s.getCacheKey(in.ConfigKey), in.ConfigValue)
		return err
	})

	return
}

// Edit 修改参数配置
func (s *sConfig) Edit(ctx context.Context, in *model.ConfigEditInput) (err error) {
	err = dao.Config.Transaction(ctx, func(ctx context.Context, tx gdb.TX) error {
		_, err = dao.Config.Ctx(ctx).Update(
			&do.Config{
				ConfigName:  in.ConfigName,
				ConfigKey:   in.ConfigKey,
				ConfigValue: in.ConfigValue,
				ConfigType:  in.ConfigType,
				UpdateBy:    in.UpdateBy,
				Remark:      in.Remark,
			},
			&do.Config{
				ConfigId: in.ConfigId,
			},
		)
		if err != nil {
			return err
		}
		_, err = g.Redis().Set(ctx, s.getCacheKey(in.ConfigKey), in.ConfigValue)
		return err
	})

	return
}

// Delete 批量删除参数信息
func (s *sConfig) Delete(ctx context.Context, configIds []int64) error {
	return dao.Config.Transaction(ctx, func(ctx context.Context, tx gdb.TX) error {
		for _, configId := range configIds {
			config, err := s.GetByConfigId(ctx, configId)
			if err != nil {
				return err
			}
			if user_consts.Yes == config.ConfigType {
				return gerror.New("内置参数【" + config.ConfigKey + "】不能删除")
			}
			_, err = dao.Config.Ctx(ctx).TX(tx).Delete(do.Config{ConfigId: configId})
			if err != nil {
				return err
			}
			_, err = g.Redis().Del(ctx, s.getCacheKey(config.ConfigKey))
			return err
		}
		return nil
	})
}

// CheckConfigKeyUnique 校验参数键名是否唯一
func (s *sConfig) CheckConfigKeyUnique(ctx context.Context, configKey string, configId int64) (bool, error) {
	config := (*entity.Config)(nil)
	err := dao.Config.Ctx(ctx).Scan(&config, do.Config{ConfigKey: configKey})
	if err != nil {
		return false, err
	}
	if config != nil && config.ConfigId != configId {
		return false, nil
	}
	return true, nil
}

// LoadingCache 加载参数缓存数据
func (s *sConfig) LoadingCache(ctx context.Context) error {
	configsList := ([]*model.ConfigListItem)(nil)
	err := dao.Config.Ctx(ctx).Scan(&configsList)
	if err != nil {
		return err
	}
	for _, item := range configsList {
		_, err = g.Redis().Set(ctx, s.getCacheKey(item.ConfigKey), item.ConfigValue)
		if err != nil {
			return err
		}
	}
	return nil
}

// ClearCache 清空参数缓存数据
func (s *sConfig) ClearCache(ctx context.Context) error {
	_, err := g.Redis().Del(ctx, cache_consts.SysConfigKey+"*")
	return err
}

// ResetCache 重置参数缓存数据
func (s *sConfig) ResetCache(ctx context.Context) {
	if err := s.ClearCache(ctx); err != nil {
		g.Log().Error(ctx, "清空参数缓存数据失败", err)
	}
	if err := s.LoadingCache(ctx); err != nil {
		g.Log().Error(ctx, "加载参数缓存数据失败", err)
	}
}

// 获取cache key
//	@configKey 参数键
func (s *sConfig) getCacheKey(configKey string) string {
	return cache_consts.SysConfigKey + configKey
}
