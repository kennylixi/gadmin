package schedule_consts

// 任务调度通用常量

const (
	TaskClassName         = "TASK_CLASS_NAME"
	TaskProperties        = "TASK_PROPERTIES" //执行目标key
	MisfireDefault        = "0"               //默认
	MisfireIgnoreMisfires = "1"               //立即触发执行
	MisfireFireAndProceed = "2"               //触发一次执行
	MisfireDoNothing      = "3"               //不触发立即执行
)

const (
	StatusNormal = "0" //正常
	StatusPause  = "1" //暂停
)
