package user_online

import (
	"context"
	"github.com/gogf/gf/v2/database/gdb"
	"github.com/gogf/gf/v2/errors/gerror"
	"github.com/gogf/gf/v2/frame/g"
	"github.com/kennylixi/gadmin/internal/modules/system/dao"
	"github.com/kennylixi/gadmin/internal/modules/system/model"
	"github.com/kennylixi/gadmin/internal/modules/system/model/do"
	"github.com/kennylixi/gadmin/internal/modules/system/model/entity"
	"github.com/kennylixi/gadmin/internal/modules/system/service"
)

type sUserOnline struct{}

func init() {
	service.RegisterUserOnline(New())
}

func New() *sUserOnline {
	return &sUserOnline{}
}

// SelectList 查询在线用户状态信息集合
// @param ctx 上下文
// @param req 过滤条件
func (s *sUserOnline) SelectList(ctx context.Context, in *model.UserOnlineListInput) (out *model.UserOnlineListOutput, err error) {
	out = &model.UserOnlineListOutput{}
	out.List, out.Total, err = dao.UserOnline.SelectList(ctx, &entity.UserOnline{
		UserName: in.UserName,
		Ipaddr:   in.Ipaddr,
	})
	return
}

// ForceLogout 强制退出登录
// @param ctx 上下文
// @param ids 需要退出的记录
func (s *sUserOnline) ForceLogout(ctx context.Context, tokenId string) error {
	online, err := dao.UserOnline.SelectByTokenId(ctx, tokenId)
	if err != nil {
		return err
	}
	if online == nil {
		return nil
	}

	err = dao.UserOnline.Transaction(ctx, func(ctx context.Context, tx gdb.TX) error {
		if err = dao.UserOnline.DeleteById(ctx, online.Id, tx); err != nil {
			return err
		}

		resp := service.Token().RemoveToken(ctx, online.Token)
		if !resp.Success() {
			return err
		}
		return nil
	})
	return err
}

// DeleteByToken 根据Token删除在线信息
// @param token
func (s *sUserOnline) DeleteByToken(ctx context.Context, token string) error {
	if err := dao.UserOnline.DeleteByToken(ctx, token); err != nil {
		g.Log().Error(ctx, err)
		return gerror.New("删除记录失败")
	}

	resp := service.Token().RemoveToken(ctx, token)
	if !resp.Success() {
		g.Log().Error(ctx, resp.Msg)
		return gerror.New("删除Token失败")
	}
	return nil
}

// Save 保存在线用户信息
func (s *sUserOnline) Save(ctx context.Context, online *do.UserOnline) error {
	_, err := dao.UserOnline.Ctx(ctx).Save(online)
	return err
}
