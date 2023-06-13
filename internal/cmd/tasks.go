package cmd

import (
	"context"
	"github.com/gogf/gf/v2/errors/gerror"
	"github.com/gogf/gf/v2/frame/g"
	"github.com/gogf/gf/v2/os/gcmd"
	"github.com/kennylixi/gadmin/internal/asynq"
	"github.com/kennylixi/gadmin/internal/core/module/mgr"
	sysService "github.com/kennylixi/gadmin/internal/modules/system/service"
	"os"
	"os/signal"
)

var (
	Tasks = gcmd.Command{
		Name:  "Tasks",
		Usage: "Tasks",
		Brief: "start Tasks server",
		Func: func(ctx context.Context, parser *gcmd.Parser) (err error) {
			killSignal := make(chan os.Signal, 1)
			signal.Notify(killSignal, os.Interrupt)

			if err = initTasks(ctx); err != nil {
				return
			}

			// 初始化模块
			for _, module := range mgr.GetModules() {
				if err = module.InitCfg(ctx); err != nil {
					g.Log().Fatalf(ctx, "初始化模块[%s]配置失败, err = %#v", module.GetModuleInfo().Name, err)
				}
				if err = module.InitTask(ctx); err != nil {
					g.Log().Fatalf(ctx, "初始化模块[%s]任务失败, err = %#v", module.GetModuleInfo().Name, err)
				}
			}

			if err = asynq.NewServer(ctx); err != nil {
				return err
			}

			if err = asynq.NewScheduler(ctx); err != nil {
				return
			}

			g.Log().Info(ctx, "任务调度系统启动成功")
			<-killSignal
			return nil
		},
	}
)

func initTasks(ctx context.Context) (err error) {
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

	return
}
