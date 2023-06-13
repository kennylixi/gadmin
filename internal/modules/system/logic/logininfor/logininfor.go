package logininfor

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

type sLogininfor struct{}

func init() {
	sysService.RegisterLogininfor(New())
}

func New() *sLogininfor {
	return &sLogininfor{}
}

// SelectList 查询在线用户状态信息集合
// @param ctx 上下文
// @param req 过滤条件
func (s *sLogininfor) SelectList(ctx context.Context, in *model.LoginInforListInput) (out *model.LoginInforListOutput, err error) {
	out = &model.LoginInforListOutput{}
	out.List, out.Total, err = dao.Logininfor.SelectList(ctx, &entity.Logininfor{
		UserName: in.UserName,
		Ipaddr:   in.Ipaddr,
		Status:   in.Status,
	})
	return out, err
}

// DeleteByIds 批量删除用户登录日志信息
// @param ids
func (s *sLogininfor) DeleteByIds(ctx context.Context, ids []int64) error {
	return dao.Logininfor.DeleteByIds(ctx, ids)
}

// Clear 清空日志
func (s *sLogininfor) Clear(ctx context.Context) error {
	return dao.Logininfor.Clear(ctx)
}

// BatchInsert 批量入库登录日志
func (s *sLogininfor) BatchInsert(ctx context.Context, count int64) error {
	// 加锁防止一个没处理完立马处理第二个请求
	rl := redislock.NewRedisLock(g.Redis(), cache_consts.SysLogininforLockKey)
	rl.SetExpire(consts.RedisLockExpire)
	ac, err := rl.AcquireCtx(ctx)
	if !ac || err != nil {
		return nil
	}
	defer rl.ReleaseCtx(ctx)

	rc, err := g.Redis().LLen(ctx, cache_consts.SysLogininforKey)
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
		vars, err := g.Redis().LRange(ctx, cache_consts.SysLogininforKey, 0, count)
		if err != nil {
			return err
		}
		logs := ([]*do.Logininfor)(nil)
		if err = vars.Scan(&logs); err != nil {
			return err
		}
		if _, err = dao.Logininfor.Ctx(ctx).TX(tx).Batch(consts.BatchInsertNum).Insert(logs); err != nil {
			return err
		}
		return g.Redis().LTrim(ctx, cache_consts.SysLogininforKey, count, -1)
	})
}
