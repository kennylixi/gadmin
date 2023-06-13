package ctx

import (
	"github.com/gogf/gf/v2/frame/g"
	"github.com/gogf/gf/v2/net/ghttp"
	"github.com/kennylixi/gadmin/internal/consts"
	"github.com/kennylixi/gadmin/internal/core/response"
	"github.com/kennylixi/gadmin/internal/modules/common/model"
	commonService "github.com/kennylixi/gadmin/internal/modules/common/service"
	sysService "github.com/kennylixi/gadmin/internal/modules/system/service"
)

// Ctx 自定义上下文对象
func Ctx() func(r *ghttp.Request) {
	return func(r *ghttp.Request) {
		// 初始化，务必最开始执行
		customCtx := &model.Context{
			Session: r.Session,
			Data:    make(g.Map),
		}

		// 存储公共查询参数到上下文中
		err := r.GetRequestStruct(&customCtx.SearchParams)
		if err != nil {
			g.Log().Error(r.GetCtx(), err)
			response.JsonExit(r, consts.Fail, "系统错误")
			return
		}

		commonService.BizCtx().Init(r, customCtx)
		if user := sysService.Token().GetLoginUser(r); user != nil && user.UserId > 0 {
			customCtx.User = &model.ContextUser{
				UserId:   user.UserId,
				DeptId:   user.DeptId,
				UserName: user.UserName,
				NickName: user.NickName,
			}
		}

		// 执行下一步请求逻辑
		r.Middleware.Next()
	}
}
