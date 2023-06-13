package captcha

import (
	"github.com/gogf/gf/v2/text/gstr"
	commonService "github.com/kennylixi/gadmin/internal/modules/common/service"
	"github.com/mojocn/base64Captcha"
)

// Captcha 管理服务
type sCaptcha struct{}

func init() {
	commonService.RegisterCaptcha(New())
}

func New() *sCaptcha {
	return &sCaptcha{}
}

// GetVerifyImgDigit 获取数字验证码
func (s *sCaptcha) GetVerifyImgDigit() (idKeyC string, base64stringC string, err error) {
	driver := &base64Captcha.DriverDigit{Height: 80, Width: 240, Length: 5, MaxSkew: 0.7, DotCount: 5}
	store := base64Captcha.DefaultMemStore
	c := base64Captcha.NewCaptcha(driver, store)
	idKeyC, base64stringC, err = c.Generate()
	return
}

// GetVerifyImgString 获取字母数字混合验证码
func (s *sCaptcha) GetVerifyImgString() (idKeyC string, base64stringC string, err error) {
	driver := &base64Captcha.DriverString{
		Height:          80,
		Width:           240,
		NoiseCount:      50,
		ShowLineOptions: 20,
		Length:          4,
		Source:          "abcdefghjkmnpqrstuvwxyz23456789",
		Fonts:           []string{"chromohv.ttf"},
	}
	driver = driver.ConvertFonts()
	store := base64Captcha.DefaultMemStore
	c := base64Captcha.NewCaptcha(driver, store)
	idKeyC, base64stringC, err = c.Generate()
	return
}

// VerifyString 验证输入的验证码是否正确
func (s *sCaptcha) VerifyString(id, answer string) bool {
	driver := new(base64Captcha.DriverString)
	store := base64Captcha.DefaultMemStore
	c := base64Captcha.NewCaptcha(driver, store)
	answer = gstr.ToLower(answer)
	return c.Verify(id, answer, true)
}
