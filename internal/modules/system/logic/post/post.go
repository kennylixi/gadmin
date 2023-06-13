package post

import (
	"context"
	"github.com/gogf/gf/v2/errors/gerror"
	"github.com/kennylixi/gadmin/internal/modules/system/dao"
	"github.com/kennylixi/gadmin/internal/modules/system/model"
	"github.com/kennylixi/gadmin/internal/modules/system/model/do"
	"github.com/kennylixi/gadmin/internal/modules/system/model/entity"
	sysService "github.com/kennylixi/gadmin/internal/modules/system/service"
)

type sPost struct{}

func init() {
	sysService.RegisterPost(New())
}

func New() *sPost {
	return &sPost{}
}

// SelectPostById 通过岗位ID查询岗位信息
// @param postId 岗位ID
func (s *sPost) SelectPostById(ctx context.Context, postId int64) (*entity.Post, error) {
	return dao.Post.SelectPostById(ctx, postId)
}

// SelectPostList 查询岗位信息集合
// @param ctx 上下文
// @param req 过滤条件
func (s *sPost) SelectPostList(ctx context.Context, in *model.PostListInput) (out *model.PostListOutput, err error) {
	out = &model.PostListOutput{}
	out.List, out.Total, err = dao.Post.SelectPostList(ctx, in)
	return
}

// SelectPostAll 查询岗位信息集合
// @param ctx 上下文
// @param req 过滤条件
func (s *sPost) SelectPostAll(ctx context.Context) ([]*entity.Post, error) {
	return dao.Post.SelectPostAll(ctx)
}

// SelectPostListByUserId 根据用户ID获取岗位选择框列表
// @param ctx	 上下文
// @param userId 用户ID
// @return 选中岗位ID列表
func (s *sPost) SelectPostListByUserId(ctx context.Context, userId int64) ([]int64, error) {
	return dao.Post.SelectPostListByUserId(ctx, userId)
}

// SelectPostsByUserName 查询用户所属岗位组
// @param ctx	 	上下文
// @param userName	用户名
// @return 结果
func (s *sPost) SelectPostsByUserName(ctx context.Context, userName string) ([]*entity.Post, error) {
	return dao.Post.SelectPostsByUserName(ctx, userName)
}

// GetByPostName 根据岗位名字获取岗位信息
// @param ctx	 	上下文
// @param postName 	岗位名称
func (s *sPost) GetByPostName(ctx context.Context, postName string) (*entity.Post, error) {
	return dao.Post.GetByPostName(ctx, postName)
}

// GetByPostCode 根据岗位编号获取岗位信息
// @param ctx	 	上下文
// @param postCode 	岗位编号
func (s *sPost) GetByPostCode(ctx context.Context, postCode string) (*entity.Post, error) {
	return dao.Post.GetByPostCode(ctx, postCode)
}

// Add 新增保存岗位信息
// @param ctx 上下文
// @param req 公告信息
// @return 结果
func (s *sPost) Add(ctx context.Context, in *model.PostAddInput) error {
	has, err := s.checkPostNameUnique(ctx, in.PostName, -1)
	if err != nil {
		return err
	}
	if !has {
		return gerror.New("新增岗位'" + in.PostName + "'失败，岗位名称已存在")
	}
	has, err = s.checkPostCodeUnique(ctx, in.PostCode, -1)
	if err != nil {
		return err
	}
	if !has {
		return gerror.New("新增岗位'" + in.PostName + "'失败，岗位编码已存在")
	}

	_, err = dao.Post.Add(ctx, &do.Post{
		PostCode: in.PostCode,
		PostName: in.PostName,
		PostSort: in.PostSort,
		Status:   in.Status,
		CreateBy: in.CreateBy,
		Remark:   in.Remark,
	})
	return err
}

// Edit 修改保存岗位信息
// @param ctx 上下文
// @param req 公告信息
// @return 结果
func (s *sPost) Edit(ctx context.Context, in *model.PostEditInput) error {
	isUnique, err := s.checkPostNameUnique(ctx, in.PostName, in.PostId)
	if err != nil {
		return err
	}
	if !isUnique {
		return gerror.New("修改岗位'" + in.PostName + "'失败，岗位名称已存在")
	}
	isUnique, err = s.checkPostCodeUnique(ctx, in.PostCode, in.PostId)
	if err != nil {
		return err
	}
	if !isUnique {
		return gerror.New("修改岗位'" + in.PostName + "'失败，岗位编码已存在")
	}

	return dao.Post.Edit(ctx, &do.Post{
		PostId:   in.PostId,
		PostCode: in.PostCode,
		PostName: in.PostName,
		PostSort: in.PostSort,
		Status:   in.Status,
		UpdateBy: in.UpdateBy,
		Remark:   in.Remark,
	})
}

// Delete 批量删除公告信息
// @param postIds 需要删除的公告ID
// @return 结果
func (s *sPost) Delete(ctx context.Context, postIds []int64) error {
	for _, postId := range postIds {
		count, err := s.countUserPostById(ctx, postId)
		if err != nil {
			return gerror.New("删除失败")
		}
		if count > 0 {
			post, err := s.SelectPostById(ctx, postId)
			if err != nil {
				return gerror.New("删除失败")
			}
			return gerror.Newf("%s已分配,不能删除", post.PostName)
		}
	}
	return dao.Post.Delete(ctx, postIds)
}

// 通过岗位ID查询岗位使用数量
// @param postId 岗位ID
// @return 结果
func (s *sPost) countUserPostById(ctx context.Context, postId int64) (int, error) {
	return dao.UserPost.CountUserPostById(ctx, postId)
}

// 校验岗位名称是否唯一
// @param post 岗位信息
// @return 结果 (true 唯一，false 不唯一)
func (s *sPost) checkPostNameUnique(ctx context.Context, postName string, postId int64) (bool, error) {
	info, err := dao.Post.GetByPostName(ctx, postName)
	if err != nil {
		return false, err
	}
	if info != nil && info.PostId != postId {
		return false, nil
	}
	return true, nil
}

// 校验岗位编码是否唯一
// @param post 岗位信息
// @return 结果 (true 唯一，false 不唯一)
func (s *sPost) checkPostCodeUnique(ctx context.Context, postCode string, postId int64) (bool, error) {
	info, err := dao.Post.GetByPostCode(ctx, postCode)
	if err != nil {
		return false, err
	}
	if info != nil && info.PostId != postId {
		return false, nil
	}
	return true, nil
}
