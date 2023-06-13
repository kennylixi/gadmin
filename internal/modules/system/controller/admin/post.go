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

// Post 岗位管理
var Post = cPost{}

type cPost struct{}

// List 获取岗位列表
func (c *cPost) List(ctx context.Context, req *admin.PostListReq) (res *admin.PostListRes, err error) {
	res = &admin.PostListRes{}
	out, err := sysService.Post().SelectPostList(ctx, &model.PostListInput{
		PostCode: req.PostCode,
		PostName: req.PostName,
		Status:   req.Status,
	})
	if err != nil {
		return
	}
	res.List = out.List
	res.Total = out.Total
	return
}

// Export 导出
func (c *cPost) Export(ctx context.Context, req *admin.PostExportReq) (res *admin.PostExportRes, err error) {
	commonService.BizCtx().SetNoPage(ctx)
	out, err := sysService.Post().SelectPostList(ctx, &model.PostListInput{
		PostCode: req.PostCode,
		PostName: req.PostName,
		Status:   req.Status,
	})
	if err != nil {
		return
	}
	e, err := poi.NewExcel(ctx, (*model.PostListItem)(nil))
	if err != nil {
		return
	}
	err = e.ExportExcel(g.NewVar(out.List).Maps(), "角色管理", "")
	return
}

// GetInfo 根据岗位编号获取详细信息
func (c *cPost) GetInfo(ctx context.Context, req *admin.PostGetInfoReq) (res *admin.PostGetInfoRes, err error) {
	out, err := sysService.Post().SelectPostById(ctx, req.PostId)
	if err != nil {
		return
	}
	res = (*admin.PostGetInfoRes)(out)
	return
}

// Add 新增岗位
func (c *cPost) Add(ctx context.Context, req *admin.PostAddReq) (res *admin.PostAddRes, err error) {
	post := &model.PostAddInput{
		PostCode: req.PostCode,
		PostName: req.PostName,
		PostSort: req.PostSort,
		Status:   req.Status,
		Remark:   req.Remark,
		CreateBy: commonService.BizCtx().GetUserName(ctx),
	}
	err = sysService.Post().Add(ctx, post)
	return
}

// Edit 修改岗位
func (c *cPost) Edit(ctx context.Context, req *admin.PostEditReq) (res *admin.PostEditRes, err error) {
	post := &model.PostEditInput{
		PostId:   req.PostId,
		PostCode: req.PostCode,
		PostName: req.PostName,
		PostSort: req.PostSort,
		Status:   req.Status,
		Remark:   req.Remark,
		UpdateBy: commonService.BizCtx().GetUserName(ctx),
	}
	err = sysService.Post().Edit(ctx, post)
	return
}

// Delete 删除岗位
func (c *cPost) Delete(ctx context.Context, req *admin.PostDeleteReq) (res *admin.PostDeleteRes, err error) {
	err = sysService.Post().Delete(ctx, req.PostIds)
	return
}

// Optionselect 获取岗位选择框列表
func (c *cPost) Optionselect(ctx context.Context, req *admin.PostOptionselectReq) (res admin.PostOptionselectRes, err error) {
	res, err = sysService.Post().SelectPostAll(ctx)
	return
}
