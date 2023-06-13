package oper_log

import (
	"context"
	"github.com/gogf/gf/v2/database/gdb"
	"github.com/gogf/gf/v2/frame/g"
	"github.com/kennylixi/gadmin/internal/consts"
	"github.com/kennylixi/gadmin/internal/consts/cache_consts"
	"github.com/kennylixi/gadmin/internal/core/redislock"
	"github.com/kennylixi/gadmin/internal/modules/system/dao"
	"github.com/kennylixi/gadmin/internal/modules/system/model"
	"github.com/kennylixi/gadmin/internal/modules/system/model/do"
	"github.com/kennylixi/gadmin/internal/modules/system/model/entity"
	sysService "github.com/kennylixi/gadmin/internal/modules/system/service"
)

type sOperLog struct{}

func init() {
	sysService.RegisterOperLog(New())
}

func New() *sOperLog {
	return &sOperLog{}
}

// BatchInsert 批量入库操作日志
func (s *sOperLog) BatchInsert(ctx context.Context, count int64) error {
	// 加锁防止一个没处理完立马处理第二个请求
	rl := redislock.NewRedisLock(g.Redis(), cache_consts.SysOperLogLockKey)
	rl.SetExpire(consts.RedisLockExpire)
	ac, err := rl.AcquireCtx(ctx)
	if !ac || err != nil {
		return nil
	}
	defer rl.ReleaseCtx(ctx)

	rc, err := g.Redis().LLen(ctx, cache_consts.SysOperLogKey)
	if err != nil {
		return err
	}
	if rc == 0 {
		return nil
	}
	if count > rc {
		count = rc
	}

	return dao.JobLog.Transaction(ctx, func(ctx context.Context, tx gdb.TX) error {
		vars, err := g.Redis().LRange(ctx, cache_consts.SysOperLogKey, 0, count)
		if err != nil {
			return err
		}
		logs := ([]*do.OperLog)(nil)
		if err = vars.Scan(&logs); err != nil {
			return err
		}
		if _, err = dao.OperLog.Ctx(ctx).TX(tx).Batch(consts.BatchInsertNum).Insert(logs); err != nil {
			return err
		}
		return g.Redis().LTrim(ctx, cache_consts.SysOperLogKey, count, -1)
	})
}

// SelectList 查询系统操作日志集合
// @param operLog 操作日志对象
// @return 操作日志集合
func (s *sOperLog) SelectList(ctx context.Context, in *model.OperLogListInput) (out *model.OperLogListOutput, err error) {
	out = &model.OperLogListOutput{}
	out.List, out.Total, err = dao.OperLog.SelectList(ctx, &entity.OperLog{
		OperName: in.OperName,
		Status:   in.Status,
	})
	return
}

// DeleteByIds 批量删除系统操作日志
// @param operIds 需要删除的操作日志ID
// @return 结果
func (s *sOperLog) DeleteByIds(ctx context.Context, operIds []int64) error {
	return dao.OperLog.DeleteByIds(ctx, operIds)
}

// SelectById 查询操作日志详细
// @param operId 操作ID
// @return 操作日志对象
func (s *sOperLog) SelectById(ctx context.Context, operId int64) (*entity.OperLog, error) {
	return dao.OperLog.SelectById(ctx, operId)
}

// Clean 清空操作日志
func (s *sOperLog) Clean(ctx context.Context) error {
	return dao.OperLog.Clean(ctx)
}
