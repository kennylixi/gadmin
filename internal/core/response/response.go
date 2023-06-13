package response

import (
	"github.com/gogf/gf/v2/errors/gcode"
	"github.com/gogf/gf/v2/errors/gerror"
	"github.com/gogf/gf/v2/frame/g"
	"github.com/gogf/gf/v2/net/ghttp"
	"net/http"
)

var CodeOk = gcode.New(200, "ok", nil)

// JsonRes 数据返回通用JSON数据结构
type JsonRes struct {
	Code     int         `json:"code"`     // 错误码((0:成功, 1:失败, >1:错误码))
	Msg      string      `json:"msg"`      // 提示信息
	Data     interface{} `json:"data"`     // 返回数据(业务接口定义具体数据结构)
	Redirect string      `json:"redirect"` // 引导客户端跳转到指定路由
}

// Json 返回标准JSON数据。
func Json(r *ghttp.Request, code int, msg string, data ...interface{}) {
	var responseData interface{}
	if len(data) > 0 {
		responseData = data[0]
	} else {
		responseData = g.Map{}
	}
	r.Response.WriteJson(JsonRes{
		Code: code,
		Msg:  msg,
		Data: responseData,
	})
}

// JsonExit 返回标准JSON数据并退出当前HTTP执行函数。
func JsonExit(r *ghttp.Request, code int, message string, data ...interface{}) {
	Json(r, code, message, data...)
	r.Exit()
}

// JsonRedirect 返回标准JSON数据引导客户端跳转。
func JsonRedirect(r *ghttp.Request, code int, msg, redirect string, data ...interface{}) {
	responseData := interface{}(nil)
	if len(data) > 0 {
		responseData = data[0]
	}
	r.Response.WriteJson(JsonRes{
		Code:     code,
		Msg:      msg,
		Data:     responseData,
		Redirect: redirect,
	})
}

// JsonRedirectExit 返回标准JSON数据引导客户端跳转，并退出当前HTTP执行函数。
func JsonRedirectExit(r *ghttp.Request, code int, msg, redirect string, data ...interface{}) {
	JsonRedirect(r, code, msg, redirect, data...)
	r.Exit()
}

// MiddlewareHandlerResponse is the default middleware handling handler response object and its error.
func MiddlewareHandlerResponse(r *ghttp.Request) {
	r.Middleware.Next()

	// There's custom buffer content, it then exits current handler.
	if r.Response.BufferLength() > 0 {
		return
	}

	var (
		msg  string
		err  = r.GetError()
		res  = r.GetHandlerResponse()
		code = gerror.Code(err)
	)
	if err != nil {
		if code == gcode.CodeNil {
			code = gcode.CodeInternalError
		}
		msg = err.Error()
	} else if r.Response.Status > 0 && r.Response.Status != http.StatusOK {
		msg = http.StatusText(r.Response.Status)
		switch r.Response.Status {
		case http.StatusNotFound:
			code = gcode.CodeNotFound
		case http.StatusForbidden:
			code = gcode.CodeNotAuthorized
		default:
			code = gcode.CodeUnknown
		}
	} else {
		code = CodeOk //gcode.CodeOK
	}
	r.Response.WriteJson(JsonRes{
		Code: code.Code(),
		Msg:  msg,
		Data: res,
	})
}
