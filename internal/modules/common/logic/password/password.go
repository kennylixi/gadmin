package password

import (
	"context"
	"github.com/gogf/gf/v2/errors/gerror"
	"github.com/gogf/gf/v2/frame/g"
	commonService "github.com/kennylixi/gadmin/internal/modules/common/service"
	"golang.org/x/crypto/bcrypt"
)

type sPassword struct {
	MaxRetryCount int `json:"maxRetryCount"` // 最大重试次数
	LockTime      int `json:"lockTime"`      // 锁定时间
}

func init() {
	commonService.RegisterPassword(New())
}

func New() *sPassword {
	return &sPassword{}
}

// Init 初始化参数配置
func (s *sPassword) Init(ctx context.Context) error {
	cfg, err := g.Cfg().Get(ctx, "password")
	if err != nil {
		return gerror.Wrap(err, "初始化password配置错误")
	}
	return cfg.Scan(&s)
}

// HashPassword 密码加密
func (s *sPassword) HashPassword(ctx context.Context, password string) (string, error) {
	bytes, err := bcrypt.GenerateFromPassword([]byte(password), 11)
	return string(bytes), err
}

// CheckPasswordHash 检测密码是否一致
func (s *sPassword) CheckPasswordHash(password, hash string) bool {
	err := bcrypt.CompareHashAndPassword([]byte(hash), []byte(password))
	return err == nil
}

// Validate 登录效验密码
//	@param pwdKey key前缀:username
//	@param password 明文密码
//	@param hash	密文密码
func (s *sPassword) Validate(ctx context.Context, pwdKey, password, hash string) error {
	result, err := g.Redis().Get(ctx, pwdKey)
	if err != nil {
		return err
	}
	retryCount := 0
	if !result.IsNil() {
		retryCount = result.Int()
	}
	if retryCount > s.MaxRetryCount {
		return gerror.Newf("账号密码错误%d次，请等%d分钟后重试", retryCount, s.LockTime)
	}
	err = bcrypt.CompareHashAndPassword([]byte(hash), []byte(password))
	if err != nil {
		retryCount = retryCount + 1
		err = g.Redis().SetEX(ctx, pwdKey, retryCount, int64(s.LockTime*60))
		if err != nil {
			return err
		}
		return gerror.Newf("账号密码输入错误%d次", retryCount)
	}
	// 登录成功清除密码错误记录
	return s.ClearLoginRecordCache(ctx, pwdKey)
}

// ClearLoginRecordCache 清除密码错误记录
func (s *sPassword) ClearLoginRecordCache(ctx context.Context, pwdKey string) error {
	count, err := g.Redis().Exists(ctx, pwdKey)
	if err == nil && count > 0 {
		_, err = g.Redis().Del(ctx, pwdKey)
	}
	return err
}
