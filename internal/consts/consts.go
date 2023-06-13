package consts

const (
	ContextKey          = "ContextKey"     // 上下文变量存储键名，前后端系统共享
	ContextKeyRequestId = "RequestId"      // 用于自定义Context RequestId打印
	UTF8                = "UTF-8"          //UTF-8 字符集
	GBK                 = "GBK"            //GBK 字符集
	HTTP                = "http://"        //http请求
	HTTPS               = "https://"       //https请求
	Success             = 0                //通用成功标识
	Fail                = 1                //通用失败标识
	LoginSuccess        = "Success"        //登录成功
	Logout              = "Logout"         //注销
	LoginFail           = "Error"          //登录失败
	CaptchaCodeKey      = "captcha_codes:" //验证码 redis key
	LoginTokenKey       = "login_tokens:"  //登录用户 redis key
	RepeatSubmitKey     = "repeat_submit:" //防重提交 redis key
	CaptchaExpiration   = 2                //验证码有效期（分钟）
	Token               = "token"          //令牌
	TokenPrefix         = "Bearer"         //令牌前缀
	LoginUserKey        = "login_user_key" //令牌前缀
	JwtUserId           = "userid"         //用户ID
	JwtUserName         = "sub"            //用户名称
	JwtAvatar           = "avatar"         //用户头像
	JwtCreated          = "created"        //创建时间
	JwtAuthorities      = "authorities"    //用户权限
	ResourcePrefix      = "/profile"       //资源映射路径 前缀
	Normal              = "0"              //正常状态
	Disable             = "1"              //停用状态

	BatchInsertNum  = 50 // 一次最多批量插入数据库记录
	RedisLockExpire = 10 // redis分布式锁过期时间
)
