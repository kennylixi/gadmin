package dict_data

import (
	"context"
	"github.com/gogf/gf/v2/database/gdb"
	"github.com/gogf/gf/v2/errors/gerror"
	"github.com/gogf/gf/v2/frame/g"
	"github.com/gogf/gf/v2/text/gstr"
	"github.com/kennylixi/gadmin/internal/consts/user_consts"
	commonService "github.com/kennylixi/gadmin/internal/modules/common/service"
	"github.com/kennylixi/gadmin/internal/modules/system/dao"
	"github.com/kennylixi/gadmin/internal/modules/system/model"
	"github.com/kennylixi/gadmin/internal/modules/system/model/do"
	"github.com/kennylixi/gadmin/internal/modules/system/model/entity"
	"github.com/kennylixi/gadmin/internal/modules/system/service"
)

type sDictData struct{}

func init() {
	service.RegisterDictData(New())
}

func New() *sDictData {
	return &sDictData{}
}

func (s *sDictData) List(ctx context.Context, in *model.DictDataListInput) (out *model.DictDataListOutput, err error) {
	out = &model.DictDataListOutput{}
	m := dao.DictData.Ctx(ctx)
	if dictLabel := gstr.Trim(in.DictLabel); len(dictLabel) > 0 {
		m = m.WhereLike(dao.DictData.Columns().DictLabel, "%"+dictLabel+"%")
	}
	if status := gstr.Trim(in.Status); len(status) > 0 {
		m = m.Where(dao.DictData.Columns().Status, status)
	}
	if dictType := gstr.Trim(in.DictType); len(dictType) > 0 {
		m = m.Where(dao.DictData.Columns().DictType, dictType)
	}
	m = commonService.BizCtx().WhereBeginTime(ctx, dao.DictData.Columns().CreatedAt, m)
	m = commonService.BizCtx().WhereEndTime(ctx, dao.DictData.Columns().CreatedAt, m)

	out.Total, err = m.Count()
	if err != nil || out.Total == 0 {
		return
	}

	out.List = ([]*model.DictDataListItem)(nil)
	err = commonService.BizCtx().Page(ctx, m).Fields(&entity.DictData{}).OrderAsc(dao.DictData.Columns().DictSort).Scan(&out.List)

	return
}

// All 根据状态获取所有字典数据
func (s *sDictData) All(ctx context.Context, status string) (list []*entity.DictData, err error) {
	m := dao.DictData.Ctx(ctx)
	if status := gstr.Trim(status); len(status) > 0 {
		m = m.Where(dao.DictData.Columns().Status, status)
	}
	err = m.Fields(entity.DictData{}).
		OrderAsc(dao.DictData.Columns().DictType).
		OrderAsc(dao.DictData.Columns().DictSort).Scan(&list)
	return
}

// GetByDictType 获取指定字典类型的所有数据
//	@param dictType 字典类型
func (s *sDictData) GetByDictType(ctx context.Context, dictType string) (items []*entity.DictData, err error) {
	items = service.DictCache().GetCache(ctx, dictType)
	if items != nil {
		return items, nil
	}
	items, err = s.cacheByDictType(ctx, dictType)
	return
}

// 获取指定字典类型的所有数据并且缓存
func (s *sDictData) cacheByDictType(ctx context.Context, dictType string) (items []*entity.DictData, err error) {
	m := dao.DictData.Ctx(ctx).Fields(entity.DictData{}).
		Where(dao.DictData.Columns().DictType, dictType).
		Where(dao.DictData.Columns().Status, user_consts.DictNormal).
		OrderAsc(dao.DictData.Columns().DictSort)
	err = m.Scan(&items)
	if err != nil {
		return
	}
	if items == nil {
		service.DictCache().DelCache(ctx, dictType)
	} else {
		service.DictCache().SetCache(ctx, dictType, items)
	}
	return
}

// CountDictDataByType 获取指定字典类型的所有数据条数
//	@param dictType 字典类型
func (s *sDictData) CountDictDataByType(ctx context.Context, dictType string) (int, error) {
	return dao.DictData.Ctx(ctx).Count(dao.DictData.Columns().DictType, dictType)
}

func (s *sDictData) GetInfo(ctx context.Context, dictCode int64) (*entity.DictData, error) {
	entity := (*entity.DictData)(nil)
	err := dao.DictData.Ctx(ctx).Scan(&entity, dao.DictData.Columns().DictCode, dictCode)
	if err != nil {
		g.Log().Error(ctx, err)
		return nil, err
	}
	if entity == nil {
		err = gerror.New("数据不存在")
		return nil, nil
	}
	return entity, nil
}

func (s *sDictData) Add(ctx context.Context, in *model.DictDataAddInput) error {
	_, err := dao.DictData.Ctx(ctx).Insert(&do.DictData{
		DictSort:  in.DictSort,
		DictLabel: in.DictLabel,
		DictValue: in.DictValue,
		DictType:  in.DictType,
		CssClass:  in.CssClass,
		ListClass: in.ListClass,
		IsDefault: in.IsDefault,
		Status:    in.Status,
		CreateBy:  in.CreateBy,
		Remark:    in.Remark,
	})
	if err != nil {
		return err
	}

	s.cacheByDictType(ctx, in.DictType)
	return nil
}

func (s *sDictData) Edit(ctx context.Context, in *model.DictDataEditInput) error {
	_, err := dao.DictData.Ctx(ctx).Update(&do.DictData{
		DictSort:  in.DictSort,
		DictLabel: in.DictLabel,
		DictValue: in.DictValue,
		DictType:  in.DictType,
		CssClass:  in.CssClass,
		ListClass: in.ListClass,
		IsDefault: in.IsDefault,
		Status:    in.Status,
		UpdateBy:  in.UpdateBy,
		Remark:    in.Remark,
	}, dao.DictData.Columns().DictCode, in.DictCode)

	s.cacheByDictType(ctx, in.DictType)
	return err
}

func (s *sDictData) Delete(ctx context.Context, dictCodes []int64) error {
	dictTypeMap := map[string]bool{}
	err := dao.DictData.Ctx(ctx).Transaction(ctx, func(ctx context.Context, tx gdb.TX) error {
		for _, dictCode := range dictCodes {
			dictData, err := s.GetInfo(ctx, dictCode)
			if err != nil {
				return err
			}
			_, err = dao.DictData.Ctx(ctx).TX(tx).Delete(dao.DictData.Columns().DictCode, dictCode)
			if err != nil {
				return err
			}
			dictTypeMap[dictData.DictType] = true
		}
		return nil
	})
	if err != nil {
		return nil
	}
	for dictType, _ := range dictTypeMap {
		s.cacheByDictType(ctx, dictType)
	}
	return nil
}
