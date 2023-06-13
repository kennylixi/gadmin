package scheduler

import (
	"github.com/gogf/gf/v2/container/gvar"
	"github.com/gogf/gf/v2/encoding/gjson"
	"github.com/gogf/gf/v2/os/gctx"
	"github.com/hibiken/asynq"
	"github.com/kennylixi/gadmin/internal/asynq/model"
	"github.com/kennylixi/gadmin/internal/consts/schedule_consts"
	sysService "github.com/kennylixi/gadmin/internal/modules/system/service"
)

type ConfigProvider struct {
}

func (p *ConfigProvider) GetConfigs() ([]*asynq.PeriodicTaskConfig, error) {
	jobs, err := sysService.Job().SelectJobListByStatus(gctx.New(), schedule_consts.StatusNormal)
	if err != nil {
		return nil, err
	}
	var configs []*asynq.PeriodicTaskConfig
	for _, job := range jobs {
		payload, err := gjson.Encode(&model.Payload{
			TaskId:      job.JobId,
			RetryDelay:  job.RetryDelay,
			IsRecordLog: job.IsRecordLog,
			Payload:     gvar.New(job.InvokeParams),
		})
		if err != nil {
			return nil, err
		}
		configs = append(configs, &asynq.PeriodicTaskConfig{
			Cronspec: job.CronExpression,
			Task:     asynq.NewTask(job.InvokeTarget, payload, asynq.MaxRetry(job.MaxRetry), asynq.Queue(job.JobGroup)),
		})
	}
	return configs, nil
}
