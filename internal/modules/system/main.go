package system

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
	"github.com/kennylixi/gadmin/internal/modules/system/controller/admin"
	_ "github.com/kennylixi/gadmin/internal/modules/system/logic"
	"github.com/kennylixi/gadmin/internal/modules/system/tasks"
)

func init() {
	err := mgr.RegisterModule(&systemModule{
		&module.Module{
			Name:        "系统模块",
			Pkg:         "system",
			Group:       1,
			Logo:        "",
			Brief:       "系统模块",
			Description: "系统模块",
			Author:      "kennylixi",
			Version:     "0.0.1",
			RootPath:    "",
		},
	})
	if err != nil {
		g.Log().Fatal(gctx.New(), err)
	}
}

type systemModule struct {
	*module.Module
}

// InitCfg 初始化配置
func (m *systemModule) InitCfg(ctx context.Context) (err error) {
	return
}

// InitTask 注册任务
func (m *systemModule) InitTask(ctx context.Context) (err error) {
	return tasks.RegisterTask()
}

// InitAdminRouter 初始化管理后台路由
func (m *systemModule) InitAdminRouter(ctx context.Context, group *ghttp.RouterGroup) (err error) {
	// 注册系统的
	group.Group("/", func(group *ghttp.RouterGroup) {
		// 上下文中间件
		group.Middleware(mwCtx.Ctx())
		// 鉴权
		group.Middleware(casbin.Admin())
		// 数据权限
		group.Middleware(datascope.DataScope())

		group.Bind(admin.Sys)
		group.Group("/system", func(group *ghttp.RouterGroup) {
			group.Bind(
				admin.Config,
				admin.Dept,
				admin.DictData,
				admin.DictType,
				admin.Menu,
				admin.Notice,
				admin.Post,
				admin.Role,
				admin.User,
				admin.District,
				admin.FileDriver,
				admin.File,
				admin.PushType,
				admin.PushChannel,
				admin.PushTemplate,
				admin.Api,
				admin.SqlBackups,
			)
		})
		group.Group("/monitor", func(group *ghttp.RouterGroup) {
			group.Bind(
				admin.OperLog,
				admin.UserOnline,
				admin.Logininfor,
				admin.Monitor,
				admin.Job,
				admin.JobLog,
			)
		})
		group.Group("/tool", func(group *ghttp.RouterGroup) {
			group.Bind(
				admin.GenTable,
			)
		})
	})
	return
}

// InitApiRouter 初始化前台API路由
func (m *systemModule) InitApiRouter(ctx context.Context, group *ghttp.RouterGroup) (err error) {
	return
}

// InitWebRouter 初始化Web路由
func (m *systemModule) InitWebRouter(ctx context.Context, group *ghttp.RouterGroup) (err error) {
	return
}
