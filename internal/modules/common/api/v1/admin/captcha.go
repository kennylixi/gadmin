package admin

import "github.com/gogf/gf/v2/frame/g"

type CaptchaImageReq struct {
	g.Meta `path:"/captchaImage" tags:"验证码" method:"get" summary:"获取验证码图片"`
}
type CaptchaImageRes struct {
	CaptchaOnOff bool   `json:"captchaOnOff"`
	Img          string `json:"img"`
	Uuid         string `json:"uuid"`
}
