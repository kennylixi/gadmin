// ============================================================================
// This is auto-generated by gen tool only once. Fill this file as you wish.
// 消息模板Controller层
// @author kennylixi
// @date 2023-03-29 15:55:04
// ============================================================================

package admin

import (
	"context"
	commonService "github.com/kennylixi/gadmin/internal/modules/common/service"
	"github.com/kennylixi/gadmin/internal/modules/system/api/v1/admin"
	"github.com/kennylixi/gadmin/internal/modules/system/model"
	"github.com/kennylixi/gadmin/internal/modules/system/service"
)

// PushTemplate 消息模板管理
var PushTemplate = cPushTemplate{}

type cPushTemplate struct{}

// List 查询消息模板列表
func (c *cPushTemplate) List(ctx context.Context, req *admin.PushTemplateListReq) (res *admin.PushTemplateListRes, err error) {
	out, err := service.PushTemplate().SelectList(ctx, &model.PushTemplateListInput{
		Name:      req.Name,
		Code:      req.Code,
		ChannelId: req.ChannelId,
		MsgType:   req.MsgType,
	})
	if err != nil {
		return
	}
	res = &admin.PushTemplateListRes{
		List:  out.List,
		Total: out.Total,
	}
	return
}

// GetInfo 获取消息模板详细信息
func (c *cPushTemplate) GetInfo(ctx context.Context, req *admin.PushTemplateGetInfoReq) (res *admin.PushTemplateGetInfoRes, err error) {
	out, err := service.PushTemplate().SelectById(ctx, req.Id)
	if err != nil {
		return
	}
	res = (*admin.PushTemplateGetInfoRes)(out)
	return
}

// Test 测试消息推送
func (c *cPushTemplate) Test(ctx context.Context, req *admin.PushTemplateTestReq) (res *admin.PushTemplateTestRes, err error) {
	err = service.PushTemplate().SendTest(ctx, &model.PushTemplateTestInput{
		Id:             req.Id,
		Account:        req.Account,
		TemplateParams: req.TemplateParams,
	})
	return
}

// Add 新增消息模板
func (c *cPushTemplate) Add(ctx context.Context, req *admin.PushTemplateAddReq) (res *admin.PushTemplateAddRes, err error) {
	in := &model.PushTemplateAddInput{
		Name:      req.Name,
		Code:      req.Code,
		ChannelId: req.ChannelId,
		Params:    req.Params,
		Cron:      req.Cron,
		MsgType:   req.MsgType,
		Remark:    req.Remark,
		CreateBy:  commonService.BizCtx().GetUserName(ctx),
	}
	err = service.PushTemplate().Insert(ctx, in)
	return
}

// Edit 修改消息模板
func (c *cPushTemplate) Edit(ctx context.Context, req *admin.PushTemplateEditReq) (res *admin.PushTemplateEditRes, err error) {
	in := &model.PushTemplateEditInput{
		Id:        req.Id,
		Name:      req.Name,
		Code:      req.Code,
		ChannelId: req.ChannelId,
		Params:    req.Params,
		Cron:      req.Cron,
		MsgType:   req.MsgType,
		Remark:    req.Remark,
		UpdateBy:  commonService.BizCtx().GetUserName(ctx),
	}
	err = service.PushTemplate().Update(ctx, in)
	return
}

// Delete 删除消息模板
func (c *cPushTemplate) Delete(ctx context.Context, req *admin.PushTemplateDeleteReq) (res *admin.PushTemplateDeleteRes, err error) {
	err = service.PushTemplate().DeleteByIds(ctx, req.Ids)
	return
}
