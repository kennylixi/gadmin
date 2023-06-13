package controller

import (
	"context"
	"github.com/gogf/gf/v2/errors/gerror"
	"github.com/gogf/gf/v2/frame/g"
	"github.com/kennylixi/gadmin/internal/modules/common/api/v1/admin"
	commonService "github.com/kennylixi/gadmin/internal/modules/common/service"
)

var Captcha = cCaptcha{}

// cCaptcha 验证码
type cCaptcha struct{}

// CaptchaImage 获取图片验证码
func (p *cCaptcha) CaptchaImage(ctx context.Context, req *admin.CaptchaImageReq) (res *admin.CaptchaImageRes, err error) {
	idKeyC, base64stringC, err := commonService.Captcha().GetVerifyImgString()
	if err != nil {
		g.Log().Infof(ctx, "获取验证码失败: %v", err)
		err = gerror.New("获取验证码失败")
		return
	}
	res = &admin.CaptchaImageRes{
		CaptchaOnOff: true,
		Img:          base64stringC,
		Uuid:         idKeyC,
	}
	return
}
