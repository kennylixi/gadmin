package config_consts

// config表中key定义
const (
	SysUploadMaxFileNameLen = "sys.upload.maxFileNameLen" // 上传文件最大文件名长度
	SysUploadMaxSize        = "sys.upload.maxSize"        // 上传文件大小限制
	SysUploadAllowedExt     = "sys.upload.allowedExt"     // 上传文件后缀限制
	SysAccountCaptchaOnOff  = "sys.account.captchaOnOff"  // 是否开启图形验证码
	SysTempFileDir          = "sys.tempfile.dir"          // 临时文件存储目录
)
