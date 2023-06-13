// =================================================================================
// This is auto-generated by GoFrame CLI tool only once. Fill this file as you wish.
// =================================================================================

package dao

import (
	"context"
	"github.com/gogf/gf/v2/errors/gerror"
	"github.com/gogf/gf/v2/frame/g"
	"github.com/gogf/gf/v2/text/gstr"
	commonService "github.com/kennylixi/gadmin/internal/modules/common/service"
	"github.com/kennylixi/gadmin/internal/modules/system/dao/internal"
	"github.com/kennylixi/gadmin/internal/modules/system/model/entity"
)

// internalLogininforDao is internal type for wrapping internal DAO implements.
type internalLogininforDao = *internal.LogininforDao

// logininforDao is the data access object for table sys_logininfor.
// You can define custom methods on it to extend its functionality as you wish.
type logininforDao struct {
	internalLogininforDao
}

var (
	// Logininfor is globally public accessible object for table sys_logininfor operations.
	Logininfor = logininforDao{
		internal.NewLogininforDao(),
	}
)

// Fill with you ideas below.

// SelectList 查询用户登录日志列表
//	@param req 过滤条件
func (d *logininforDao) SelectList(ctx context.Context, con *entity.Logininfor) (list []*entity.Logininfor, total int, err error) {
	m := Logininfor.Ctx(ctx)
	if userName := gstr.Trim(con.UserName); len(userName) > 0 {
		m = m.WhereLike(Logininfor.Columns().UserName, "%"+userName+"%")
	}
	if ip := gstr.Trim(con.Ipaddr); len(ip) > 0 {
		m = m.WhereLike(Logininfor.Columns().Ipaddr, "%"+ip+"%")
	}
	if status := gstr.Trim(con.Status); len(status) > 0 {
		m = m.Where(Logininfor.Columns().Status, status)
	}
	m = commonService.BizCtx().WhereBeginTime(ctx, Logininfor.Columns().LoginTime, m)
	m = commonService.BizCtx().WhereEndTime(ctx, Logininfor.Columns().LoginTime, m)

	total, err = m.Count()
	if err != nil || total == 0 {
		return
	}

	list = ([]*entity.Logininfor)(nil)
	err = commonService.BizCtx().Page(ctx, m).OrderDesc(Logininfor.Columns().InfoId).Scan(&list)

	return
}

// DeleteByIds 批量删除用户登录日志信息
//	@param ids 需要删除的用户ID
func (d *logininforDao) DeleteByIds(ctx context.Context, ids []int64) error {
	_, err := Logininfor.Ctx(ctx).Delete(Logininfor.Columns().InfoId, ids)
	return err
}

// Clear 清空日志
func (d *logininforDao) Clear(ctx context.Context) error {
	_, err := g.DB().Ctx(ctx).Exec(ctx, "truncate table "+Logininfor.Table())
	if err != nil {
		g.Log().Error(ctx, err)
		err = gerror.New("清除失败")
	}
	return err
}