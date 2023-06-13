package admin

import (
	"context"
	"github.com/gogf/gf/v2/frame/g"
	commonService "github.com/kennylixi/gadmin/internal/modules/common/service"
	"github.com/kennylixi/gadmin/internal/modules/system/api/v1/admin"
	"github.com/kennylixi/gadmin/internal/modules/system/model"
	sysService "github.com/kennylixi/gadmin/internal/modules/system/service"
	"github.com/kennylixi/gadmin/utility/poi"
)

// DictData 字典数据管理
var DictData = cDictData{}

type cDictData struct{}

// List 获取列表
func (c *cDictData) List(ctx context.Context, req *admin.DictDataListReq) (res *admin.DictDataListRes, err error) {
	out, err := sysService.DictData().List(ctx, &model.DictDataListInput{
		DictLabel: req.DictLabel,
		DictValue: req.DictValue,
		DictType:  req.DictType,
		Status:    req.Status,
	})
	if err != nil {
		return
	}
	res = &admin.DictDataListRes{
		List:  out.List,
		Total: out.Total,
	}
	return
}

// Export 导出
func (c *cDictData) Export(ctx context.Context, req *admin.DictDataExportReq) (res *admin.DictDataExportRes, err error) {
	commonService.BizCtx().SetNoPage(ctx)
	out, err := sysService.DictData().List(ctx, &model.DictDataListInput{
		DictLabel: req.DictLabel,
		DictValue: req.DictValue,
		DictType:  req.DictType,
		Status:    req.Status,
	})
	if err != nil {
		return
	}
	e, err := poi.NewExcel(ctx, (*model.DictDataListItem)(nil))
	if err != nil {
		return
	}
	err = e.ExportExcel(g.NewVar(out.List).Maps(), "字典数据", "")
	return
}

// GetInfo 查询字典数据详细
func (c *cDictData) GetInfo(ctx context.Context, req *admin.DictDataGetInfoReq) (res *admin.DictDataGetInfoRes, err error) {
	out, err := sysService.DictData().GetInfo(ctx, req.DictCode)
	if err != nil {
		return
	}
	res = (*admin.DictDataGetInfoRes)(out)
	return
}

// GetByDictType 根据字典类型查询字典数据信息
func (c *cDictData) GetByDictType(ctx context.Context, req *admin.DictDataGetByDictTypeReq) (res admin.DictDataGetByDictTypeRes, err error) {
	res, err = sysService.DictData().GetByDictType(ctx, req.DictType)
	return
}

// Add 新增字典数据
func (c *cDictData) Add(ctx context.Context, req *admin.DictDataAddReq) (res *admin.DictDataAddRes, err error) {
	in := &model.DictDataAddInput{
		DictSort:  req.DictSort,
		DictLabel: req.DictLabel,
		DictValue: req.DictValue,
		DictType:  req.DictType,
		CssClass:  req.CssClass,
		ListClass: req.ListClass,
		IsDefault: req.IsDefault,
		Status:    req.Status,
		Remark:    req.Remark,
		CreateBy:  commonService.BizCtx().GetUserName(ctx),
	}
	err = sysService.DictData().Add(ctx, in)
	return
}

// Edit 修改保存字典数据
func (c *cDictData) Edit(ctx context.Context, req *admin.DictDataEditReq) (res *admin.DictDataEditRes, err error) {
	in := &model.DictDataEditInput{
		DictCode:  req.DictCode,
		DictSort:  req.DictSort,
		DictLabel: req.DictLabel,
		DictValue: req.DictValue,
		DictType:  req.DictType,
		CssClass:  req.CssClass,
		ListClass: req.ListClass,
		IsDefault: req.IsDefault,
		Status:    req.Status,
		Remark:    req.Remark,
		UpdateBy:  commonService.BizCtx().GetUserName(ctx),
	}
	err = sysService.DictData().Edit(ctx, in)
	return
}

// Delete 删除字典数据
func (c *cDictData) Delete(ctx context.Context, req *admin.DictDataDeleteReq) (res *admin.DictDataDeleteRes, err error) {
	err = sysService.DictData().Delete(ctx, req.DictCodes)
	return
}
