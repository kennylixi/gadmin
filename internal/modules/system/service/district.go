// ================================================================================
// Code generated by GoFrame CLI tool. DO NOT EDIT.
// You can delete these comments if you wish manually maintain this interface file.
// ================================================================================

package service

import (
	"context"
	"github.com/kennylixi/gadmin/internal/modules/system/model"
	"github.com/kennylixi/gadmin/internal/modules/system/model/entity"
)

type (
	IDistrict interface {
		Sync(ctx context.Context) error
		GetListByParentId(ctx context.Context, parentId int64) (districts []*model.District, err error)
		GetAllCitiyList(ctx context.Context) (districts map[string][]*model.ZDistrictItem, err error)
		GetAllCityAndDistrictList(ctx context.Context) (districts map[string][]*model.ZDistrictItem, err error)
		GetExclude(ctx context.Context, id int64) (districts []*model.District, err error)
		GetById(ctx context.Context, id int64) (entity *entity.District, err error)
		GetMaxId(ctx context.Context) (maxId int64, err error)
		Insert(ctx context.Context, in *model.DistrictInsertInput) (err error)
		Update(ctx context.Context, in *model.DistrictUpdateInput) (err error)
		Delete(ctx context.Context, id int64) (err error)
	}
)

var (
	localDistrict IDistrict
)

func District() IDistrict {
	if localDistrict == nil {
		panic("implement not found for interface IDistrict, forgot register?")
	}
	return localDistrict
}

func RegisterDistrict(i IDistrict) {
	localDistrict = i
}
