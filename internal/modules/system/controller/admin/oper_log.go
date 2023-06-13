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

// OperLog 操作日志管理
var OperLog = cOperLog{}

type cOperLog struct{}

// List 获取列表
func (c *cOperLog) List(ctx context.Context, req *admin.OperLogListReq) (res *admin.OperLogListRes, err error) {
	out, err := sysService.OperLog().SelectList(ctx, &model.OperLogListInput{
		OperName: req.OperName,
		Status:   req.Status,
	})
	if err != nil {
		return
	}
	res = &admin.OperLogListRes{
		List:  out.List,
		Total: out.Total,
	}
	return
}

// Export 导出
func (c *cOperLog) Export(ctx context.Context, req *admin.OperLogExportReq) (res *admin.OperLogExportRes, err error) {
	commonService.BizCtx().SetNoPage(ctx)
	out, err := sysService.OperLog().SelectList(ctx, &model.OperLogListInput{
		OperName: req.OperName,
		Status:   req.Status,
	})
	if err != nil {
		return
	}
	e, err := poi.NewExcel(ctx, (*entity.OperLog)(nil))
	if err != nil {
		return
	}
	err = e.ExportExcel(g.NewVar(out.List).Maps(), "操作日志", "")
	return
}

func (c *cOperLog) Delete(ctx context.Context, req *admin.OperLogDeleteReq) (res *admin.OperLogDeleteRes, err error) {
	err = sysService.OperLog().DeleteByIds(ctx, req.OperIds)
	return
}

func (c *cOperLog) Clean(ctx context.Context, req *admin.OperLogCleanReq) (res *admin.OperLogCleanRes, err error) {
	err = sysService.OperLog().Clean(ctx)
	return
}
