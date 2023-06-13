package notice

import (
	"context"
	"github.com/kennylixi/gadmin/internal/modules/system/dao"
	"github.com/kennylixi/gadmin/internal/modules/system/model"
	"github.com/kennylixi/gadmin/internal/modules/system/model/do"
	"github.com/kennylixi/gadmin/internal/modules/system/model/entity"
	sysService "github.com/kennylixi/gadmin/internal/modules/system/service"
)

type sNotice struct{}

func init() {
	sysService.RegisterNotice(New())
}

func New() *sNotice {
	return &sNotice{}
}

// SelectNoticeById 查询公告信息
// @param noticeId 公告ID
func (s *sNotice) SelectNoticeById(ctx context.Context, noticeId int64) (*entity.Notice, error) {
	return dao.Notice.SelectNoticeById(ctx, noticeId)
}

// SelectNoticeList 查询公告列表
// @param ctx 上下文
// @param req 过滤条件
func (s *sNotice) SelectNoticeList(ctx context.Context, in *model.NoticeListInput) (out *model.NoticeListOutput, err error) {
	out = &model.NoticeListOutput{}
	out.List, out.Total, err = dao.Notice.SelectNoticeList(ctx, &entity.Notice{
		NoticeTitle: in.NoticeTitle,
		NoticeType:  in.NoticeType,
		CreateBy:    in.CreateBy,
	})
	return out, err
}

// Add 新增公告
// @param ctx 上下文
// @param req 公告信息
// @return 结果
func (s *sNotice) Add(ctx context.Context, in *model.NoticeAddInput) error {
	_, err := dao.Notice.Add(ctx, &do.Notice{
		NoticeTitle:   in.NoticeTitle,
		NoticeType:    in.NoticeType,
		NoticeContent: in.NoticeContent,
		Status:        in.Status,
		CreateBy:      in.CreateBy,
		Remark:        in.Remark,
	})
	return err
}

// Edit 修改公告
// @param ctx 上下文
// @param req 公告信息
// @return 结果
func (s *sNotice) Edit(ctx context.Context, in *model.NoticeEditInput) error {
	return dao.Notice.Edit(ctx, &do.Notice{
		NoticeId:      in.NoticeId,
		NoticeTitle:   in.NoticeTitle,
		NoticeType:    in.NoticeType,
		NoticeContent: in.NoticeContent,
		Status:        in.Status,
		UpdateBy:      in.UpdateBy,
		Remark:        in.Remark,
	})
}

// Delete 批量删除公告信息
// @param noticeIds 需要删除的公告ID
// @return 结果
func (s *sNotice) Delete(ctx context.Context, noticeIds []int64) error {
	return dao.Notice.Delete(ctx, noticeIds)
}
