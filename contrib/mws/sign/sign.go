package sign

import (
	"github.com/gogf/gf/v2/net/ghttp"
	"github.com/kennylixi/gadmin/internal/consts"
	"github.com/kennylixi/gadmin/internal/core/response"
	"github.com/kennylixi/go-sign"
	"net/url"
)

// 签名Key
const _sign = "sign"

// Sign 方法签名处理中间件
func Sign() func(r *ghttp.Request) {
	return func(r *ghttp.Request) {
		params := r.GetRequestMapStrStr()
		if _, ok := params[_sign]; !ok {
			r.Middleware.Next()
			return
		}
		verifier := sign.NewVerifier()
		values := make(url.Values)
		for key, value := range params {
			values.Add(key, value)
		}
		verifier.ParseValues(values)

		if err := verifier.CheckTimeStamp(); nil != err {
			response.JsonExit(r, consts.Fail, "签名时间错误")
			return
		}

		signer := sign.NewSignerMd5()
		signer.SetBody(verifier.GetBodyWithoutSign())
		// TODO 从数据库读取AppID对应的SecretKey 暂时业务场景的情况下先固定 或者配置
		signer.SetAppID("1111111")
		// 使用同样的WrapBody方式
		signer.SetAppSecretWrapBody("222222")

		// 服务端根据客户端参数生成签名

		if verifier.MustString(_sign) != signer.GetSignature() {
			response.JsonExit(r, consts.Fail, "签名错误")
			return
		}

		r.Middleware.Next()
	}
}
