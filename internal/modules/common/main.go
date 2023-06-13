package common

import (
	"context"
	"github.com/gogf/gf/v2/frame/g"
	"github.com/gogf/gf/v2/net/ghttp"
	"github.com/gogf/gf/v2/os/gctx"
	"github.com/kennylixi/gadmin/contrib/mws/casbin"
	mwCtx "github.com/kennylixi/gadmin/contrib/mws/ctx"
	"github.com/kennylixi/gadmin/contrib/mws/datascope"
	"github.com/kennylixi/gadmin/internal/core/module"
	"github.com/kennylixi/gadmin/internal/core/module/mgr"
	"github.com/kennylixi/gadmin/internal/modules/common/controller"
	_ "github.com/kennylixi/gadmin/internal/modules/common/logic"
)

func init() {
	err := mgr.RegisterModule(&commonModule{
		&module.Module{
			Name:        "通用模块",
			Pkg:         "common",
			Group:       1,
			Logo:        "",
			Brief:       "通用模块",
			Description: "通用模块",
			Author:      "kennylixi",
			Version:     "0.0.1",
			RootPath:    "",
		},
	})
	if err != nil {
		g.Log().Fatal(gctx.New(), err)
	}
}

type commonModule struct {
	*module.Module
}

// InitCfg 初始化配置
func (m *commonModule) InitCfg(ctx context.Context) (err error) {
	return
}

// InitTask 注册任务
func (m *commonModule) InitTask(ctx context.Context) (err error) {
	return
}

// InitAdminRouter 初始化管理后台路由
func (m *commonModule) InitAdminRouter(ctx context.Context, group *ghttp.RouterGroup) (err error) {
	group.Group("/", func(group *ghttp.RouterGroup) {
		// 注册验证码
		group.Bind(controller.Captcha)
	})
	group.Group("/common", func(group *ghttp.RouterGroup) {
		// 上下文中间件
		group.Middleware(mwCtx.Ctx())
		// 鉴权
		group.Middleware(casbin.Admin())
		// 数据权限
		group.Middleware(datascope.DataScope())

		group.Bind(controller.Common)
	})
	return
}

// InitApiRouter 初始化前台API路由
func (m *commonModule) InitApiRouter(ctx context.Context, group *ghttp.RouterGroup) (err error) {
	return
}

// InitWebRouter 初始化Web路由
func (m *commonModule) InitWebRouter(ctx context.Context, group *ghttp.RouterGroup) (err error) {
	return
}
