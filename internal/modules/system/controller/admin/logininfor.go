package admin

import (
	"context"
	"github.com/gogf/gf/v2/frame/g"
	commonService "github.com/kennylixi/gadmin/internal/modules/common/service"
	"github.com/kennylixi/gadmin/internal/modules/system/api/v1/admin"
	"github.com/kennylixi/gadmin/internal/modules/system/model"
	"github.com/kennylixi/gadmin/internal/modules/system/model/entity"
	sysService "github.com/kennylixi/gadmin/internal/modules/system/service"
	"github.com/kennylixi/gadmin/utility/poi"
)

// Logininfor 登录日志管理
var Logininfor = cLogininfor{}

type cLogininfor struct{}

// List 获取在线用户状态列表
func (c *cLogininfor) List(ctx context.Context, req *admin.LoginInforListReq) (res *admin.LoginInforListRes, err error) {
	out, err := sysService.Logininfor().SelectList(ctx, &model.LoginInforListInput{
		UserName: req.UserName,
		Ipaddr:   req.Ipaddr,
		Status:   req.Status,
	})
	if err != nil {
		return
	}
	res = &admin.LoginInforListRes{
		List:  out.List,
		Total: out.Total,
	}
	return
}

// Export 导出
func (c *cLogininfor) Export(ctx context.Context, req *admin.LoginInforExportReq) (res *admin.LoginInforExportRes, err error) {
	commonService.BizCtx().SetNoPage(ctx)
	out, err := sysService.Logininfor().SelectList(ctx, &model.LoginInforListInput{
		UserName: req.UserName,
		Ipaddr:   req.Ipaddr,
		Status:   req.Status,
	})
	if err != nil {
		return
	}
	e, err := poi.NewExcel(ctx, (*entity.Logininfor)(nil))
	if err != nil {
		return
	}
	err = e.ExportExcel(g.NewVar(out.List).Maps(), "登录日志", "")
	return
}

// Delete 删除登录日志
func (c *cLogininfor) Delete(ctx context.Context, req *admin.LoginInforDeleteReq) (res *admin.LoginInforDeleteRes, err error) {
	err = sysService.Logininfor().DeleteByIds(ctx, req.Ids)
	return
}

// Clean 清除登录日志
func (c *cLogininfor) Clean(ctx context.Context, req *admin.LoginInforCleanReq) (res *admin.LoginInforCleanRes, err error) {
	err = sysService.Logininfor().Clear(ctx)
	return
}

// Unlock 账户解锁
func (c *cLogininfor) Unlock(ctx context.Context, req *admin.LoginInforUnlockReq) (res *admin.LoginInforUnlockRes, err error) {
	commonService.Password().ClearLoginRecordCache(ctx, req.UserName)
	return
}
