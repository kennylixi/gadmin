package admin

import (
	"context"
	commonService "github.com/kennylixi/gadmin/internal/modules/common/service"
	"github.com/kennylixi/gadmin/internal/modules/system/api/v1/admin"
	"github.com/kennylixi/gadmin/internal/modules/system/model"
	sysService "github.com/kennylixi/gadmin/internal/modules/system/service"
)

// Notice 通知管理
var Notice = cNotice{}

type cNotice struct{}

// List 获取通知公告列表
func (c *cNotice) List(ctx context.Context, req *admin.NoticeListReq) (res *admin.NoticeListRes, err error) {
	out, err := sysService.Notice().SelectNoticeList(ctx, &model.NoticeListInput{
		NoticeType:  req.NoticeType,
		NoticeTitle: req.NoticeTitle,
		CreateBy:    req.CreateBy,
	})
	if err != nil {
		return
	}
	res = &admin.NoticeListRes{
		List:  out.List,
		Total: out.Total,
	}
	return
}

// GetInfo 根据通知公告编号获取详细信息
func (c *cNotice) GetInfo(ctx context.Context, req *admin.NoticeGetInfoReq) (res *admin.NoticeGetInfoRes, err error) {
	out, err := sysService.Notice().SelectNoticeById(ctx, req.NoticeId)
	if err != nil {
		return
	}
	res = (*admin.NoticeGetInfoRes)(out)
	return
}

// Add 新增通知公告
func (c *cNotice) Add(ctx context.Context, req *admin.NoticeAddReq) (res *admin.NoticeAddRes, err error) {
	err = sysService.Notice().Add(ctx, &model.NoticeAddInput{
		NoticeTitle:   req.NoticeTitle,
		NoticeType:    req.NoticeType,
		NoticeContent: req.NoticeContent,
		Status:        req.Status,
		Remark:        req.Remark,
		CreateBy:      commonService.BizCtx().GetUserName(ctx),
	})
	return
}

// Edit 修改通知公告
func (c *cNotice) Edit(ctx context.Context, req *admin.NoticeEditReq) (res *admin.NoticeEditRes, err error) {
	err = sysService.Notice().Edit(ctx, &model.NoticeEditInput{
		NoticeId:      req.NoticeId,
		NoticeTitle:   req.NoticeTitle,
		NoticeType:    req.NoticeType,
		NoticeContent: req.NoticeContent,
		Status:        req.Status,
		Remark:        req.Remark,
		UpdateBy:      commonService.BizCtx().GetUserName(ctx),
	})
	return
}

// Delete 删除通知公告
func (c *cNotice) Delete(ctx context.Context, req *admin.NoticeDeleteReq) (res *admin.NoticeDeleteRes, err error) {
	err = sysService.Notice().Delete(ctx, req.NoticeIds)
	return
}
