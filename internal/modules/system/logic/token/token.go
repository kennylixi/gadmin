package token

import (
	"context"
	"database/sql"
	"errors"
	"fmt"
	"github.com/goflyfox/gtoken/gtoken"
	"github.com/gogf/gf/v2/crypto/gmd5"
	"github.com/gogf/gf/v2/errors/gerror"
	"github.com/gogf/gf/v2/frame/g"
	"github.com/gogf/gf/v2/net/ghttp"
	"github.com/gogf/gf/v2/os/gtime"
	"github.com/gogf/gf/v2/util/gconv"
	"github.com/gogf/gf/v2/util/guid"
	"github.com/kennylixi/gadmin/internal/consts"
	"github.com/kennylixi/gadmin/internal/consts/cache_consts"
	"github.com/kennylixi/gadmin/internal/consts/http_status"
	"github.com/kennylixi/gadmin/internal/consts/user_consts"
	"github.com/kennylixi/gadmin/internal/core/response"
	commonService "github.com/kennylixi/gadmin/internal/modules/common/service"
	"github.com/kennylixi/gadmin/internal/modules/system/model"
	"github.com/kennylixi/gadmin/internal/modules/system/model/do"
	sysService "github.com/kennylixi/gadmin/internal/modules/system/service"
	"github.com/mssola/user_agent"
	"net/http"
)

type sToken struct {
	AdminToken *gtoken.GfToken
}

func init() {
	sysService.RegisterToken(New())
}

func New() *sToken {
	return &sToken{}
}

// TokenConfig Token配置
type TokenConfig struct {
	CacheMode      int8
	CacheKey       string
	Timeout        int
	MaxRefresh     int
	TokenDelimiter string
	EncryptKey     []byte
	AuthFailMsg    string
	MultiLogin     bool
}

func (s *sToken) Init(ctx context.Context) error {
	cfg, err := g.Cfg().Get(ctx, "gToken")
	if err != nil {
		return gerror.Wrap(err, "初始化Token配置错误")
	}
	cfgToken := &TokenConfig{}
	if err = cfg.Scan(&cfgToken); err != nil {
		return gerror.Wrap(err, "映射Token配置错误")
	}
	//多端登陆配置
	s.AdminToken = &gtoken.GfToken{
		CacheMode:        cfgToken.CacheMode,
		CacheKey:         cfgToken.CacheKey,
		Timeout:          cfgToken.Timeout,
		MaxRefresh:       cfgToken.MaxRefresh,
		TokenDelimiter:   cfgToken.TokenDelimiter,
		EncryptKey:       cfgToken.EncryptKey,
		AuthFailMsg:      cfgToken.AuthFailMsg,
		MultiLogin:       cfgToken.MultiLogin,
		LoginPath:        "/login",
		LoginBeforeFunc:  s.Login,
		LoginAfterFunc:   s.LoginAfter,
		LogoutPath:       "/logout",
		AuthExcludePaths: g.SliceStr{"/captchaImage", "/login"},
		AuthPaths:        g.SliceStr{"/system/*", "/monitor/*"},
		AuthAfterFunc:    s.AuthAfterFunc,
		LogoutBeforeFunc: s.LoginOut,
		MiddlewareType:   3,
	}
	//s.GfToken.Start()
	return nil
}

func (s *sToken) AdminMiddleware(ctx context.Context, group *ghttp.RouterGroup) {
	s.AdminToken.Middleware(ctx, group)
}

// LoginAfter 登录返回方法
func (s *sToken) LoginAfter(r *ghttp.Request, respData gtoken.Resp) {
	if !respData.Success() {
		r.Response.WriteJson(respData)
	} else {
		token := respData.GetString(gtoken.KeyToken)
		//保存用户在线状态token到数据库
		userAgent := r.UserAgent()
		ua := user_agent.New(userAgent)
		os := ua.OS()
		explorer, _ := ua.Browser()

		var userInfo *model.User
		r.GetCtxVar("loginUserInfo").Struct(&userInfo)

		clientIp := r.GetClientIp()
		location := commonService.Ip().GetIpAddress(r.GetCtx(), clientIp)
		sysService.UserOnline().Save(r.GetCtx(), &do.UserOnline{
			TokenId:       guid.S(),
			Token:         token,
			LoginTime:     gtime.Now(),
			UserName:      userInfo.UserName,
			Ipaddr:        clientIp,
			LoginLocation: location,
			Browser:       explorer,
			Os:            os,
		})
		r.Response.WriteJson(gtoken.Succ(g.Map{
			consts.Token: token,
		}))
	}
}

// AuthAfterFunc gtoken验证后返回
func (s *sToken) AuthAfterFunc(r *ghttp.Request, respData gtoken.Resp) {
	if r.Method == http.MethodOptions || respData.Success() {
		r.Middleware.Next()
	} else {
		respData.Code = http_status.Unauthorized
		response := r.Response
		options := response.DefaultCORSOptions()
		response.CORS(options)
		response.WriteJson(respData)
		r.ExitAll()
	}
}

// GetLoginUser 获取登录用户
func (s *sToken) GetLoginUser(r *ghttp.Request) (userInfo *model.User) {
	resp := s.AdminToken.GetTokenData(r)
	if resp.Success() {
		if err := resp.Get(gtoken.KeyData).Struct(&userInfo); err != nil {
			g.Log().Error(r.GetCtx(), err)
		}
	}
	return
}

// LoginOut 后台退出登陆
func (s *sToken) LoginOut(r *ghttp.Request) bool {
	//删除在线用户状态
	resp := s.AdminToken.GetTokenData(r)
	if resp.Success() {
		tokenVar := resp.Get(gtoken.KeyToken)
		if !tokenVar.IsNil() {
			//删除在线用户状态操作
			if err := sysService.UserOnline().DeleteByToken(r.Context(), tokenVar.String()); err != nil {
				g.Log().Errorf(r.GetCtx(), "删除Token失败：%v", err)
				return false
			}
		}
	}
	return true
}

type LoginReq struct {
	Uuid     string `v:"required#验证码标识不能为空"`
	Code     string `v:"required#请输入验证码"`
	Username string `v:"required#账号不能为空"`
	Password string `v:"required#密码不能为空"`
}

// RemoveToken 删除Token
func (s *sToken) RemoveToken(ctx context.Context, token string) gtoken.Resp {
	return s.AdminToken.RemoveToken(ctx, token)
}

// Login 用户登陆验证
func (s *sToken) Login(r *ghttp.Request) (string, interface{}) {
	var req *LoginReq
	if err := r.Parse(&req); err != nil {
		response.JsonExit(r, consts.Fail, err.Error())
	}

	clientIp := r.GetClientIp()
	userAgent := r.UserAgent()

	//判断验证码是否正确
	if !commonService.Captcha().VerifyString(req.Uuid, req.Code) {
		loginLog(r.GetCtx(), consts.Fail, req.Username, clientIp, userAgent, "验证码错误")
		response.JsonExit(r, consts.Fail, "验证码错误")
	}

	err, user := signIn(r, req.Username, req.Password)
	if err != nil {
		loginLog(r.GetCtx(), consts.Fail, req.Username, clientIp, userAgent, err.Error())
		response.JsonExit(r, consts.Fail, err.Error())
		r.ExitAll()
		return "", nil
	}
	loginLog(r.GetCtx(), consts.Success, req.Username, clientIp, userAgent, "登录成功")
	r.SetCtxVar("loginUserInfo", user)

	keys := user.UserName
	if s.AdminToken.MultiLogin {
		keys = user.UserName + clientIp
	}

	return gmd5.MustEncryptString(keys), user
}

// 用户登录，成功返回用户信息，否则返回nil
func signIn(r *ghttp.Request, username, password string) (error, *model.User) {
	userInfo, err := sysService.User().SelectUserDetailByUserName(r.GetCtx(), username)
	if err != nil && err != sql.ErrNoRows {
		g.Log().Error(r.GetCtx(), err)
		return errors.New("账号或密码错误"), nil
	}
	if userInfo == nil {
		return errors.New("账号或密码错误"), nil
	}
	err = commonService.Password().Validate(r.GetCtx(), fmt.Sprintf("%s:%s", cache_consts.PwdErrCntKey, username), password, userInfo.Password)
	if err != nil {
		return err, nil
	}
	//判断用户状态
	if userInfo.Status == user_consts.UserDisable {
		return errors.New("用户已被冻结"), nil
	}
	//更新登陆时间及ip
	if err = sysService.User().UpdateLoginInfo(r.GetCtx(), &model.UserUpdateLoginInfoInput{
		UserId:    userInfo.UserId,
		LoginDate: gtime.Now(),
		LoginIp:   r.GetClientIp(),
	}); err != nil {
		return errors.New("更新用户信息失败"), nil
	}
	//删除密码
	userInfo.Password = ""
	return nil, userInfo
}

//登录日志记录
func loginLog(ctx context.Context, status int, username, ipaddr, userAgent, msg string) {
	ua := user_agent.New(userAgent)
	log := new(do.Logininfor)
	log.UserName = username
	log.Ipaddr = ipaddr
	log.LoginLocation = commonService.Ip().GetIpAddress(ctx, ipaddr)
	log.Browser, _ = ua.Browser()
	log.Os = ua.OS()
	log.Status = gconv.String(status)
	log.Msg = msg
	log.LoginTime = gtime.Now()
	// 日志缓存到Redis
	g.Redis().LPush(ctx, cache_consts.SysLogininforKey, &log)
}
