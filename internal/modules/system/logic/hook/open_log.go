package hook

import (
	"github.com/gogf/gf/v2/encoding/gjson"
	"github.com/gogf/gf/v2/frame/g"
	"github.com/gogf/gf/v2/net/ghttp"
	"github.com/gogf/gf/v2/os/gtime"
	"github.com/kennylixi/gadmin/internal/consts"
	"github.com/kennylixi/gadmin/internal/consts/cache_consts"
	commonService "github.com/kennylixi/gadmin/internal/modules/common/service"
	"github.com/kennylixi/gadmin/internal/modules/system/model/do"
	sysService "github.com/kennylixi/gadmin/internal/modules/system/service"
	"net/http"
)

// OperLog 操作日志钩子
func (s *sHook) OperLog(r *ghttp.Request) {
	// 只记录非get请求的操作
	if r.Router == nil || r.Method == http.MethodGet || r.Method == "ALL" {
		return
	}
	loginUser := sysService.Token().GetLoginUser(r)
	if loginUser == nil {
		return
	}

	operIp := r.GetClientIp()
	location := commonService.Ip().GetIpAddress(r.GetCtx(), operIp)
	operLog := &do.OperLog{
		Title:         "",                 // 模块标题
		RequestMethod: r.Method,           // 请求方式
		OperatorType:  1,                  // 操作类别（0其它 1后台用户 2手机端用户）
		OperName:      loginUser.UserName, // 操作人员
		OperUrl:       r.RequestURI,       // 请求URL
		OperIp:        operIp,             // 主机地址
		OperLocation:  location,           // 操作地点
		OperTime:      gtime.Now(),        // 操作时间
	}
	// 错误消息
	if err := r.GetError(); err != nil {
		operLog.ErrorMsg = err.Error()
	}

	// 请求参数
	params, _ := gjson.Encode(r.GetMap())
	if len(params) > 0 {
		operLog.OperParam = string(params)
	}

	if err := r.GetError(); err != nil {
		operLog.ErrorMsg = err.Error()
		operLog.Status = consts.Fail
	}
	if res := r.GetHandlerResponse(); res != nil {
		operLog.Status = consts.Success
		operLog.JsonResult, _ = gjson.EncodeString(res)
	}

	// 耗时
	operLog.ExecuteTime = int(gtime.TimestampMilli() - r.EnterTime)
	// 记录操作日志到redis
	g.Redis().RPush(r.GetCtx(), cache_consts.SysOperLogKey, &operLog)
}
