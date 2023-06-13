package dict_type

import (
	"context"
	"github.com/gogf/gf/v2/database/gdb"
	"github.com/gogf/gf/v2/errors/gerror"
	"github.com/gogf/gf/v2/frame/g"
	"github.com/gogf/gf/v2/text/gstr"
	commonService "github.com/kennylixi/gadmin/internal/modules/common/service"
	"github.com/kennylixi/gadmin/internal/modules/system/dao"
	"github.com/kennylixi/gadmin/internal/modules/system/model"
	"github.com/kennylixi/gadmin/internal/modules/system/model/do"
	"github.com/kennylixi/gadmin/internal/modules/system/model/entity"
	"github.com/kennylixi/gadmin/internal/modules/system/service"
)

type sDictType struct {
}

func init() {
	service.RegisterDictType(New())
}

func New() *sDictType {
	return &sDictType{}
}

func (s *sDictType) List(ctx context.Context, in *model.DictTypeListInput) (out *model.DictTypeListOutput, err error) {
	out = &model.DictTypeListOutput{}
	m := dao.DictType.Ctx(ctx)
	if dictName := gstr.Trim(in.DictName); len(dictName) > 0 {
		m = m.WhereLike(dao.DictType.Columns().DictName, "%"+dictName+"%")
	}
	if status := gstr.Trim(in.Status); len(status) > 0 {
		m = m.Where(dao.DictType.Columns().Status, status)
	}
	if dictType := gstr.Trim(in.DictType); len(dictType) > 0 {
		m = m.WhereLike(dao.DictType.Columns().DictType, "%"+dictType+"%")
	}

	m = commonService.BizCtx().WhereBeginTime(ctx, dao.DictType.Columns().CreatedAt, m)
	m = commonService.BizCtx().WhereEndTime(ctx, dao.DictType.Columns().CreatedAt, m)

	out.Total, err = m.Fields("*").Count()
	if err != nil || out.Total == 0 {
		return
	}

	out.List = ([]*model.DictTypeItemList)(nil)
	err = commonService.BizCtx().Page(ctx, m).Fields(entity.DictType{}).Scan(&out.List)

	return
}

// SelectDictTypeAll 获取所有字典类型
func (s *sDictType) SelectDictTypeAll(ctx context.Context) (list []*entity.DictType, err error) {
	err = dao.DictType.Ctx(ctx).Scan(&list)
	return list, err
}

func (s *sDictType) GetInfo(ctx context.Context, dictId int64) (dictType *entity.DictType, err error) {
	err = dao.DictType.Ctx(ctx).Scan(&dictType, dao.DictType.Columns().DictId, dictId)
	if err != nil {
		g.Log().Error(ctx, err)
		return nil, err
	}
	if dictType == nil {
		err = gerror.New("数据不存在")
		return
	}
	return
}

func (s *sDictType) Add(ctx context.Context, in *model.DictTypeAddInput) error {
	isUnique, err := s.CheckDictTypeUnique(ctx, in.DictType, -1)
	if err != nil {
		return err
	}
	if !isUnique {
		return gerror.New("新增字典'" + in.DictType + "'失败，字典类型已存在")
	}

	_, err = dao.DictType.Ctx(ctx).Insert(&do.DictType{
		DictName: in.DictName,
		DictType: in.DictType,
		Status:   in.Status,
		CreateBy: in.CreateBy,
		Remark:   in.Remark,
	})
	if err != nil {
		return err
	}
	return nil
}

func (s *sDictType) Edit(ctx context.Context, in *model.DictTypeEditInput) error {
	isUnique, err := s.CheckDictTypeUnique(ctx, in.DictType, in.DictId)
	if err != nil {
		return err
	}
	if !isUnique {
		return gerror.New("修改字典'" + in.DictType + "'失败，字典类型已存在")
	}
	dictType, err := s.GetInfo(ctx, in.DictId)
	if err != nil {
		return err
	}

	return dao.DictType.Transaction(ctx, func(ctx context.Context, tx gdb.TX) error {
		_, err = dao.DictType.Ctx(ctx).TX(tx).Update(&do.DictType{
			DictName: in.DictName,
			DictType: in.DictType,
			Status:   in.Status,
			UpdateBy: in.UpdateBy,
			Remark:   in.Remark,
		}, dao.DictType.Columns().DictId, in.DictId)
		if err != nil {
			return err
		}
		// 如果修改字典类型，并且修改字典数据里面的字典类型，清除对应字典缓存
		if dictType.DictType != in.DictType {
			_, err = dao.DictData.Ctx(ctx).TX(tx).Update(&do.DictData{
				DictType: in.DictType,
			}, dao.DictData.Columns().DictType, dictType.DictType)
			service.DictCache().DelCache(ctx, dictType.DictType)
		}
		return err
	})
}

func (s *sDictType) Delete(ctx context.Context, dictIds []int64) error {
	for _, dictId := range dictIds {
		dictType, err := service.DictType().GetInfo(ctx, dictId)
		if err != nil {
			return err
		}
		count, err := service.DictData().CountDictDataByType(ctx, dictType.DictType)
		if err != nil {
			return gerror.New("删除失败")
		}
		if count > 0 {
			return gerror.Newf("%s已分配,不能删除", dictType.DictName)
		}
		_, err = dao.DictType.Ctx(ctx).Delete(dao.DictType.Columns().DictId, dictId)
		if err != nil {
			return err
		}
		service.DictCache().DelCache(ctx, dictType.DictType)
	}

	return nil
}

// CheckDictTypeUnique 校验字典类型称是否唯一
// @param dict 字典类型
func (s *sDictType) CheckDictTypeUnique(ctx context.Context, dictType string, dictId int64) (bool, error) {
	entity, err := dao.DictType.GetByDictType(ctx, dictType)
	if err != nil {
		return false, err
	}
	if entity != nil && entity.DictId != dictId {
		return false, nil
	}
	return true, nil
}
