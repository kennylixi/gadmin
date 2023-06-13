// ============================================================================
// This is auto-generated by gen tool only once. Fill this file as you wish.
// 渠道类型管理Logic层
// @author kennylixi
// @date 2023-02-22 10:47:28
// ============================================================================

package service

import (
	"context"
	"fmt"
	"github.com/gogf/gf/v2/encoding/gjson"
	"github.com/gogf/gf/v2/errors/gerror"
	"github.com/gogf/gf/v2/text/gstr"
	commonModel "github.com/kennylixi/gadmin/internal/modules/common/model"
	"github.com/kennylixi/gadmin/internal/modules/system/dao"
	systemModel "github.com/kennylixi/gadmin/internal/modules/system/model"
	"github.com/kennylixi/gadmin/internal/modules/system/model/do"
	"github.com/kennylixi/gadmin/internal/modules/system/model/entity"
	"github.com/kennylixi/gadmin/internal/modules/system/service"
)

// 渠道类型管理服务
type sPushType struct{}

func init() {
	service.RegisterPushType(New())
}

func New() *sPushType {
	return &sPushType{}
}

func (s *sPushType) GetList(ctx context.Context, in *systemModel.PushTypeListInput) (out []*systemModel.PushType, err error) {
	m := dao.PushType.Ctx(ctx).Fields(entity.PushType{})
	if status := gstr.Trim(in.Status); len(status) > 0 {
		m = m.Where(dao.PushType.Columns().Status, status)
	}
	if name := gstr.Trim(in.Name); len(name) > 0 {
		m = m.WhereLike(dao.PushType.Columns().Name, "%"+name+"%")
	}
	if err = m.Order(dao.PushType.Columns().ParentId + "," + dao.PushType.Columns().Sort).Scan(&out); err != nil {
		return
	}
	return
}

func (s *sPushType) GetById(ctx context.Context, id int64) (cate *entity.PushType, err error) {
	err = dao.PushType.Ctx(ctx).Scan(&cate, dao.PushType.Columns().Id, id)
	return
}

// BuildMenuTreeSelect 构建前端所需要下拉树结构
// @param menus 菜单列表
// @return 下拉树结构列表
func (s *sPushType) BuildMenuTreeSelect(cates []*systemModel.PushType) []*commonModel.TreeSelect {
	cateIdMap := make(map[int64]int64)
	for _, cate := range cates {
		cateIdMap[cate.Id] = cate.Id
	}

	returnList := make([]*commonModel.TreeSelect, 0)
	for _, cate := range cates {
		// 如果是顶级节点, 遍历该父节点的所有子节点
		if _, ok := cateIdMap[cate.ParentId]; !ok {
			returnList = append(returnList, s.recursionTreeSelectFn(cates, cate))
		}
	}

	return returnList
}

// 递归组装树
func (s *sPushType) recursionTreeSelectFn(cates []*systemModel.PushType, cate *systemModel.PushType) *commonModel.TreeSelect {
	treeItem := &commonModel.TreeSelect{
		Id:    cate.Id,
		Label: cate.Name,
	}
	for _, item := range cates {
		if item.ParentId == cate.Id {
			if treeItem.Children == nil {
				treeItem.Children = make([]*commonModel.TreeSelect, 0)
			}
			treeItem.Children = append(treeItem.Children, s.recursionTreeSelectFn(cates, item))
		}
	}
	return treeItem
}

// 检查编码是否唯一
func (s *sPushType) checkUniqueCode(ctx context.Context, id int64, code string) (unique bool, err error) {
	cate := (*entity.PushType)(nil)
	err = dao.PushType.Ctx(ctx).Where(&do.PushType{Code: code}).Scan(&cate)
	if err != nil {
		return
	}
	unique = true
	if cate != nil && cate.Id != id {
		unique = false
	}
	return
}

func (s *sPushType) Insert(ctx context.Context, in *systemModel.PushTypeAddInput) error {
	if cfg := gstr.Trim(in.Config); cfg != "" {
		if _, err := gjson.Decode(in.Config); err != nil {
			return gerror.Wrap(err, "配置范例Json格式错误")
		}
	}
	if cfg := gstr.Trim(in.TemplateParams); cfg != "" {
		if _, err := gjson.Decode(in.TemplateParams); err != nil {
			return gerror.Wrap(err, "模板参数Json格式错误")
		}
	}

	in.Code = gstr.ToLower(in.Code)
	isUnique, err := s.checkUniqueCode(ctx, -1, in.Code)
	if err != nil {
		return gerror.New("新增失败")
	}
	if !isUnique {
		return gerror.New("新增类型'" + in.Name + "'失败，类型编码已存在")
	}

	// 检查上级
	parent, err := s.GetById(ctx, in.ParentId)
	if err != nil {
		return gerror.Wrap(err, "新增失败")
	}
	ancestors := "0"
	if parent != nil {
		ancestors = fmt.Sprintf("%s,%d", parent.Ancestors, in.ParentId)
	}

	if _, err = dao.PushType.Ctx(ctx).Insert(&do.PushType{
		ParentId:       in.ParentId,
		Ancestors:      ancestors,
		Name:           in.Name,
		Code:           in.Code,
		Status:         in.Status,
		Sort:           in.Sort,
		Config:         in.Config,
		TemplateParams: in.TemplateParams,
		CreateBy:       in.CreateBy,
	}); err != nil {
		return gerror.New("新增失败")
	}
	return nil
}

func (s *sPushType) Update(ctx context.Context, in *systemModel.PushTypeEditInput) (err error) {
	if cfg := gstr.Trim(in.Config); cfg != "" {
		if _, err := gjson.Decode(in.Config); err != nil {
			return gerror.Wrap(err, "配置范例Json格式错误")
		}
	}
	if cfg := gstr.Trim(in.TemplateParams); cfg != "" {
		if _, err := gjson.Decode(in.TemplateParams); err != nil {
			return gerror.Wrap(err, "模板参数Json格式错误")
		}
	}

	in.Code = gstr.ToLower(in.Code)
	isUnique, err := s.checkUniqueCode(ctx, in.Id, in.Code)
	if err != nil {
		return gerror.New("编辑失败")
	}
	if !isUnique {
		return gerror.New("修改渠道类型'" + in.Name + "'失败，编码已存在")
	}
	if in.Id == in.ParentId {
		return gerror.New("修改渠道类型'" + in.Name + "'失败，上级渠道类型不能选择自己")
	}

	// 检查上级
	parent, err := s.GetById(ctx, in.ParentId)
	if err != nil {
		return gerror.Wrap(err, "新增失败")
	}
	ancestors := "0"
	if parent != nil {
		ancestors = fmt.Sprintf("%s,%d", parent.Ancestors, in.ParentId)
	}

	if _, err = dao.PushType.Ctx(ctx).Update(&do.PushType{
		ParentId:       in.ParentId,
		Ancestors:      ancestors,
		Name:           in.Name,
		Code:           in.Code,
		Status:         in.Status,
		Sort:           in.Sort,
		Config:         in.Config,
		TemplateParams: in.TemplateParams,
		UpdateBy:       in.UpdateBy,
	}, &do.PushType{Id: in.Id}); err != nil {
		return gerror.New("更新失败")
	}
	return nil
}

// Delete 删除渠道类型信息
// @param ctx  上下文
// @param menu 菜单信息
func (s *sPushType) Delete(ctx context.Context, id int64) (err error) {
	has, err := s.hasChildById(ctx, id)
	if err != nil {
		return
	}
	if has {
		return gerror.New("存在子渠道类型,不允许删除")
	}

	// 检查是否有对应的渠道
	has, err = service.PushChannel().HasByChannelIds(ctx, id)
	if err != nil {
		return
	}
	if has {
		err = gerror.New("请先删除渠道")
		return
	}

	_, err = dao.PushType.Ctx(ctx).Where(&do.PushType{Id: id}).Delete()
	return err
}

func (s *sPushType) hasChildById(ctx context.Context, id int64) (has bool, err error) {
	result, err := dao.PushType.Ctx(ctx).Count(dao.PushType.Columns().ParentId, id)
	if err != nil {
		err = gerror.Wrap(err, "系统错误")
		return
	}
	has = result > 0
	return
}