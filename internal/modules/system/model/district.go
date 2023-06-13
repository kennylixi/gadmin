package model

import (
	"github.com/kennylixi/gadmin/internal/modules/system/model/entity"
)

type District struct {
	entity.District
	Children []*District `json:"children"`
}

type ZDistrictItem struct {
	Id   int64  `json:"id"`
	Name string `json:"name"`
}

type DistrictInsertInput struct {
	ParentId int64  // 上级编号
	Name     string // 地区名称
	Center   string // 经纬度
	Citycode string // 城市编码
	Adcode   string // 邮编
	Status   string // 是否开放
	OrderNum int    // 排序
	CreateBy string // 创建者
}

type DistrictUpdateInput struct {
	Id       int64  // 编号
	ParentId int64  // 上级编号
	Name     string // 地区名称
	Center   string // 经纬度
	Citycode string // 城市编码
	Adcode   string // 邮编
	Status   string // 是否开放
	OrderNum int    // 排序
	UpdateBy string // 修改者
}
