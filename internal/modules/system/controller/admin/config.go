package admin

import (
	"context"
	"github.com/gogf/gf/v2/errors/gerror"
	"github.com/gogf/gf/v2/frame/g"
	"github.com/kennylixi/gadmin/internal/consts/error_code"
	commonService "github.com/kennylixi/gadmin/internal/modules/common/service"
	"github.com/kennylixi/gadmin/internal/modules/system/api/v1/admin"
	"github.com/kennylixi/gadmin/internal/modules/system/model"
	sysService "github.com/kennylixi/gadmin/internal/modules/system/service"
	"github.com/kennylixi/gadmin/utility/poi"
)

// Config 参数配置管理
var Config = cConfig{}

type cConfig struct{}

// List 获取参数配置列表
func (c *cConfig) List(ctx context.Context, req *admin.ConfigListReq) (res *admin.ConfigListRes, err error) {
	out, err := sysService.Config().List(ctx, &model.ConfigListInput{
		ConfigName: req.ConfigName,
		ConfigKey:  req.ConfigKey,
		ConfigType: req.ConfigType,
	})
	if err != nil {
		return nil, err
	}
	res = &admin.ConfigListRes{
		List:  out.List,
		Total: out.Total,
	}
	return
}

// Export 导出
func (c *cConfig) Export(ctx context.Context, req *admin.ConfigExportReq) (res *admin.ConfigExportRes, err error) {
	commonService.BizCtx().SetNoPage(ctx)
	out, err := sysService.Config().List(ctx, &model.ConfigListInput{
		ConfigName: req.ConfigName,
		ConfigKey:  req.ConfigKey,
		ConfigType: req.ConfigType,
	})
	if err != nil {
		return
	}
	e, err := poi.NewExcel(ctx, (*model.ConfigListItem)(nil))
	if err != nil {
		return
	}
	err = e.ExportExcel(g.NewVar(out.List).Maps(), "参数管理", "")
	return
}

// GetInfo 根据参数编号获取详细信息
func (c *cConfig) GetInfo(ctx context.Context, req *admin.ConfigGetInfoReq) (res *admin.ConfigGetInfoRes, err error) {
	config, err := sysService.Config().GetByConfigId(ctx, req.ConfigId)
	if err != nil {
		return
	}
	if config == nil {
		err = error_code.ErrNotFound
		return
	}
	res = &admin.ConfigGetInfoRes{
		Config: *config,
	}
	return
}

// GetConfigKey 根据参数键名查询参数值
func (c *cConfig) GetConfigKey(ctx context.Context, req *admin.ConfigKeyReq) (res admin.ConfigKeyRes, err error) {
	configValue, err := sysService.Config().GetByConfigKey(ctx, req.ConfigKey)
	if err != nil {
		return
	}
	res = admin.ConfigKeyRes(configValue)
	return
}

// Add 新增参数配置
func (c *cConfig) Add(ctx context.Context, req *admin.ConfigAddReq) (res *admin.ConfigAddRes, err error) {
	unique, err := sysService.Config().CheckConfigKeyUnique(ctx, req.ConfigKey, -1)
	if err != nil {
		return nil, err
	}
	if !unique {
		err = gerror.New("新增参数'" + req.ConfigName + "'失败，参数键名已存在")
	}
	configId, err := sysService.Config().Add(ctx, &model.ConfigAddInput{
		ConfigName:  req.ConfigName,
		ConfigKey:   req.ConfigKey,
		ConfigValue: req.ConfigValue,
		ConfigType:  req.ConfigType,
		Remark:      req.Remark,
		CreateBy:    commonService.BizCtx().GetUserName(ctx),
	})
	if err != nil {
		return nil, err
	}
	res = &admin.ConfigAddRes{ConfigId: configId}
	return
}

// Edit 新增参数配置
func (c *cConfig) Edit(ctx context.Context, req *admin.ConfigEditReq) (res *admin.ConfigEditRes, err error) {
	unique, err := sysService.Config().CheckConfigKeyUnique(ctx, req.ConfigKey, req.ConfigId)
	if err != nil {
		return nil, err
	}
	if !unique {
		err = gerror.New("修改参数'" + req.ConfigName + "'失败，参数键名已存在")
	}
	err = sysService.Config().Edit(ctx, &model.ConfigEditInput{
		ConfigId:    req.ConfigId,
		ConfigName:  req.ConfigName,
		ConfigKey:   req.ConfigKey,
		ConfigValue: req.ConfigValue,
		ConfigType:  req.ConfigType,
		Remark:      req.Remark,
		UpdateBy:    commonService.BizCtx().GetUserName(ctx),
	})
	return
}

// Delete 删除参数配置
func (c *cConfig) Delete(ctx context.Context, req *admin.ConfigDeleteReq) (res *admin.ConfigDeleteRes, err error) {
	err = sysService.Config().Delete(ctx, req.ConfigIds)
	return
}

// RefreshCache 刷新参数缓存
func (c *cConfig) RefreshCache(ctx context.Context, req *admin.ConfigRefreshCacheReq) (res *admin.ConfigRefreshCacheRes, err error) {
	sysService.Config().ResetCache(ctx)
	return
}
