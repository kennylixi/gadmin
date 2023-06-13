package admin

import (
	"context"
	"github.com/gogf/gf/v2/frame/g"
	commonService "github.com/kennylixi/gadmin/internal/modules/common/service"
	"github.com/kennylixi/gadmin/internal/modules/system/api/v1/admin"
	"github.com/kennylixi/gadmin/internal/modules/system/model"
	"github.com/kennylixi/gadmin/internal/modules/system/service"
	"github.com/kennylixi/gadmin/utility/poi"
)

// DictType 字典类型管理
var DictType = cDictType{}

type cDictType struct{}

// List 获取列表
func (c *cDictType) List(ctx context.Context, req *admin.DictTypeListReq) (res *admin.DictTypeListRes, err error) {
	out, err := service.DictType().List(ctx, &model.DictTypeListInput{
		DictType: req.DictType,
		DictName: req.DictName,
		Status:   req.Status,
	})
	if err != nil {
		return
	}
	res = &admin.DictTypeListRes{
		List:  out.List,
		Total: out.Total,
	}
	return
}

// Export 导出
func (c *cDictType) Export(ctx context.Context, req *admin.DictTypeExportReq) (res *admin.DictTypeExportRes, err error) {
	commonService.BizCtx().SetNoPage(ctx)
	out, err := service.DictType().List(ctx, &model.DictTypeListInput{
		DictType: req.DictType,
		DictName: req.DictName,
		Status:   req.Status,
	})
	if err != nil {
		return
	}
	e, err := poi.NewExcel(ctx, (*model.DictTypeItemList)(nil))
	if err != nil {
		return
	}
	err = e.ExportExcel(g.NewVar(out.List).Maps(), "字典类型", "")
	return
}

// GetInfo 查询字典数据详细
func (c *cDictType) GetInfo(ctx context.Context, req *admin.DictTypeGetInfoReq) (res *admin.DictTypeGetInfoRes, err error) {
	out, err := service.DictType().GetInfo(ctx, req.DictId)
	res = &admin.DictTypeGetInfoRes{DictType: *out}
	return
}

// Add 新增字典数据
func (c *cDictType) Add(ctx context.Context, req *admin.DictTypeAddReq) (res *admin.DictTypeAddRes, err error) {
	in := &model.DictTypeAddInput{
		DictName: req.DictName,
		DictType: req.DictType,
		Status:   req.Status,
		Remark:   req.Remark,
		CreateBy: commonService.BizCtx().GetUserName(ctx),
	}
	err = service.DictType().Add(ctx, in)
	return
}

// Edit 修改保存字典数据
func (c *cDictType) Edit(ctx context.Context, req *admin.DictTypeEditReq) (res *admin.DictTypeEditRes, err error) {
	in := &model.DictTypeEditInput{
		DictId:   req.DictId,
		DictName: req.DictName,
		DictType: req.DictType,
		Status:   req.Status,
		Remark:   req.Remark,
		UpdateBy: commonService.BizCtx().GetUserName(ctx),
	}
	err = service.DictType().Edit(ctx, in)
	return
}

// Delete 删除字典数据
func (c *cDictType) Delete(ctx context.Context, req *admin.DictTypeDeleteReq) (res *admin.DictTypeDeleteRes, err error) {
	err = service.DictType().Delete(ctx, req.DictIds)
	return
}

// ClearCache 清空缓存
func (c *cDictType) ClearCache(ctx context.Context, req *admin.DictTypeClearCacheReq) (res *admin.DictTypeClearCacheRes, err error) {
	err = service.DictCache().ClearCache(ctx)
	return
}

// RefreshCache 刷新缓存
func (c *cDictType) RefreshCache(ctx context.Context, req *admin.DictTypeRefreshCacheReq) (res *admin.DictTypeRefreshCacheRes, err error) {
	err = service.DictCache().ResetCache(ctx)
	return
}

// Optionselect 获取字典选择框列表
func (c *cDictType) Optionselect(ctx context.Context, req *admin.DictTypeOptionselectReq) (res admin.DictTypeOptionselectRes, err error) {
	res, err = service.DictType().SelectDictTypeAll(ctx)
	return
}
