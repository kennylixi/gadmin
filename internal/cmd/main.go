package cmd

import (
	"context"
	"github.com/gogf/gf/v2/errors/gerror"
	"github.com/gogf/gf/v2/frame/g"
	"github.com/gogf/gf/v2/net/ghttp"
	"github.com/gogf/gf/v2/os/gcmd"
	"github.com/kennylixi/gadmin/contrib/knife"
	"github.com/kennylixi/gadmin/contrib/mws/cors"
	"github.com/kennylixi/gadmin/contrib/mws/gzip"
	"github.com/kennylixi/gadmin/internal/asynq"
	"github.com/kennylixi/gadmin/internal/core/module/mgr"
	"github.com/kennylixi/gadmin/internal/core/response"
	commonService "github.com/kennylixi/gadmin/internal/modules/common/service"
	sysService "github.com/kennylixi/gadmin/internal/modules/system/service"
)

var (
	Main = gcmd.Command{
		Name:  "admin",
		Usage: "admin",
		Brief: "start admin http server",
		Func: func(ctx context.Context, parser *gcmd.Parser) (err error) {
			s := g.Server()

			s.Plugin(&knife.Knife{})

			if err = initMain(ctx); err != nil {
				return
			}

			// 初始化模块
			for _, module := range mgr.GetModules() {
				if err = module.InitCfg(ctx); err != nil {
					g.Log().Fatalf(ctx, "初始化模块[%s]失败, err = %#v", module.GetModuleInfo().Name, err)
				}
			}

			s.Group("/", func(group *ghttp.RouterGroup) {
				group.Hook("/*", ghttp.HookAfterOutput, sysService.Hook().OperLog)
				// 跨域处理中间件
				group.Middleware(cors.CORS())
				// gzip压缩
				group.Middleware(gzip.Gzip(gzip.BestCompression))
				group.Middleware(response.MiddlewareHandlerResponse)

				// token中间件
				sysService.Token().AdminMiddleware(ctx, group)

				// 初始化模块路由
				for _, module := range mgr.GetModules() {
					if err = module.InitAdminRouter(ctx, group); err != nil {
						g.Log().Fatalf(ctx, "初始化模块[%s]路由失败", module.GetModuleInfo().Name, err)
					}
				}
			})
			s.Run()
			return nil
		},
	}
)

func initMain(ctx context.Context) (err error) {
	// 初始化文件系统
	if err = sysService.File().LoadDrivers(ctx); err != nil {
		return err
	}

	if err = sysService.PushChannel().LoadAdapters(ctx); err != nil {
		return err
	}

	if err = sysService.Config().LoadingCache(ctx); err != nil {
		return gerror.Wrap(err, "初始化参数缓存失败")
	}

	if err = sysService.DictCache().LoadingDictCache(ctx); err != nil {
		return gerror.Wrap(err, "初始化字典缓存失败")
	}

	if err = sysService.Token().Init(ctx); err != nil {
		return gerror.Wrap(err, "初始化Token失败")
	}

	if err = commonService.Password().Init(ctx); err != nil {
		return gerror.Wrap(err, "初始化Password失败")
	}

	if err = sysService.GenTable().InitGenConfig(ctx); err != nil {
		return gerror.Wrap(err, "初始化代码生成模块配置失败")
	}

	if err = asynq.NewClient(ctx); err != nil {
		return err
	}
	return
}
