package casbin

import (
	"github.com/gogf/gf/v2/frame/g"
	"github.com/gogf/gf/v2/net/ghttp"
	"github.com/kennylixi/gadmin/internal/consts"
	"github.com/kennylixi/gadmin/internal/core/response"
	sysService "github.com/kennylixi/gadmin/internal/modules/system/service"
)

// Admin 管理系统鉴权
func Admin() func(r *ghttp.Request) {
	return func(r *ghttp.Request) {
		user := sysService.Token().GetLoginUser(r)
		if user == nil || user.UserId <= 0 {
			response.JsonExit(r, consts.Fail, "您还没登录，请登录账号")
			return
		}

		casbin := sysService.Casbin().Casbin(r.GetCtx())
		if g.IsEmpty(user.Roles) {
			// 没有权限
			response.JsonExit(r, consts.Fail, "没有权限，请联系系统管理员")
			return
		}
		// 鉴权
		suss, err := casbin.Enforce(user.UserName, r.Router.Uri, r.Router.Method)
		if err != nil {
			g.Log().Error(r.GetCtx(), "鉴权失败", err)
			response.JsonExit(r, consts.Fail, "鉴权失败，请联系系统管理员")
			return
		}
		if !suss {
			// 没有权限
			response.JsonExit(r, consts.Fail, "没有权限，请联系系统管理员")
			return
		}
		// 执行下一步请求逻辑
		r.Middleware.Next()
	}
}
