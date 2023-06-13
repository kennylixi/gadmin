package tasks

import (
	"github.com/hibiken/asynq"
	"github.com/kennylixi/gadmin/internal/asynq/server"
)

const (
	TypeNoParam    = "task:system:noparam"    // 无参数示例
	TypeParam      = "task:system:param"      // 有参数示例
	TypeLoginInfor = "task:system:loginInfor" // 登录日志队列
	TypeJobLog     = "task:system:joblog"     // 定时任务日志队列
	TypeBackup     = "task:system:backup"     // 备份数据库队列
	TypePush       = "task:system:push"       // 消息推送队列
	TypeOperlog    = "task:system:operlog"    // 管理员操作日志队列
)

// RegisterTask 注册任务
func RegisterTask() (err error) {
	taskMap := map[string]asynq.HandlerFunc{
		TypeNoParam:    handleNoParam,       // 无参数示例
		TypeParam:      handleParam,         // 有参数示例
		TypeLoginInfor: handleLoginInfoTask, // 登录日志队列
		TypeJobLog:     handleJobLogTask,    // 定时任务日志队列
		TypePush:       handlePushTask,      // 消息推送队列
		TypeBackup:     handleBackupTask,    // 备份数据库队列
		TypeOperlog:    handleOperlogTask,   // 管理员操作日志队列
	}

	for s, handler := range taskMap {
		if err = server.RegisterHandler(s, handler); err != nil {
			return
		}
	}
	return
}
