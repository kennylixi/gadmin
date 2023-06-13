package cache_consts

const (
	PwdErrCntKey         = "pwd_err_cnt:"         // 登录账户密码错误次数 redis key
	SysConfigKey         = "sys_config:"          // 参数管理 cache key
	SysDictKey           = "sys_dict:"            // 字典管理 cache key
	SysTaskLastTimeKey   = "sys_task:last_time:"  // 任务日志 redis key
	SysTaskLogKey        = "sys_task:log:"        // 任务日志 redis key
	SysTaskLogLockKey    = "sys_task:log:lock:"   // 任务日志锁 redis key
	SysLogininforKey     = "sys_logininfor:list:" // 管理系统登录日志队列
	SysLogininforLockKey = "sys_logininfor:lock:" // 管理系统登录日志志锁
	SysOperLogKey        = "sys_operLog:list:"    // 管理系统操作日志队列
	SysOperLogLockKey    = "sys_operLog:lock:"    // 管理系统操作日志志锁
)
