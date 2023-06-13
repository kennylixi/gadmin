package admin

import (
	"context"
	"github.com/gogf/gf/v2/frame/g"
	"github.com/gogf/gf/v2/os/grpool"
	commonService "github.com/kennylixi/gadmin/internal/modules/common/service"
	"github.com/kennylixi/gadmin/internal/modules/system/api/v1/admin"
	"github.com/kennylixi/gadmin/internal/modules/system/model"
	sysService "github.com/kennylixi/gadmin/internal/modules/system/service"
)

// District 行政区域
var District = cDistrict{}

type cDistrict struct{}

// Sync 同步行政区域结构
func (c *cDistrict) Sync(ctx context.Context, req *admin.DistrictSyncReq) (res admin.DistrictSyncRes, err error) {
	err = grpool.AddWithRecover(ctx, func(ctx context.Context) {
		err = sysService.District().Sync(ctx)
		if err != nil {
			g.Log().Error(ctx, err)
		}
	}, func(ctx context.Context, err error) {
		if err != nil {
			g.Log().Error(ctx, err)
		}
	})
	return
}

// List 查询指定区域的下级列表
func (c *cDistrict) List(ctx context.Context, req *admin.DistrictListReq) (res admin.DistrictListRes, err error) {
	res, err = sysService.District().GetListByParentId(ctx, req.Id)
	if err != nil {
		return
	}
	if res == nil {
		res = admin.DistrictListRes{}
	}
	return
}

// GetInfo 获取行政区域的详细信息
func (c *cDistrict) GetInfo(ctx context.Context, req *admin.DistrictGetInfoReq) (res *admin.DistrictGetInfoRes, err error) {
	data, err := sysService.District().GetById(ctx, req.Id)
	if err != nil {
		return
	}
	res = (*admin.DistrictGetInfoRes)(data)
	return
}

// Add 新增定行政区域
func (c *cDistrict) Add(ctx context.Context, req *admin.DistrictAddReq) (res *admin.DistrictAddRes, err error) {
	in := &model.DistrictInsertInput{
		ParentId: req.ParentId,
		Name:     req.Name,
		Center:   req.Center,
		Citycode: req.Citycode,
		Adcode:   req.Adcode,
		Status:   req.Status,
		OrderNum: req.OrderNum,
		CreateBy: commonService.BizCtx().GetUserName(ctx),
	}
	err = sysService.District().Insert(ctx, in)
	return
}

// Edit 修改定时任务调度表
func (c *cDistrict) Edit(ctx context.Context, req *admin.DistrictEditReq) (res *admin.DistrictEditRes, err error) {
	in := &model.DistrictUpdateInput{
		Id:       req.Id,
		ParentId: req.ParentId,
		Name:     req.Name,
		Center:   req.Center,
		Citycode: req.Citycode,
		Adcode:   req.Adcode,
		Status:   req.Status,
		OrderNum: req.OrderNum,
		UpdateBy: commonService.BizCtx().GetUserName(ctx),
	}
	err = sysService.District().Update(ctx, in)
	return
}

// Delete 删除行政区域
func (c *cDistrict) Delete(ctx context.Context, req *admin.DistrictDeleteReq) (res *admin.DistrictDeleteRes, err error) {
	err = sysService.District().Delete(ctx, req.Id)
	return
}

// GetExclude 获取包含特定行政区域树形结构
func (c *cDistrict) GetExclude(ctx context.Context, req *admin.DistrictExcludeReq) (res admin.DistrictExcludeRes, err error) {
	res, err = sysService.District().GetExclude(ctx, req.Id)
	if res == nil {
		res = admin.DistrictExcludeRes{}
	}
	return
}
