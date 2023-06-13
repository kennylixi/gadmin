package admin

import (
	"github.com/gogf/gf/v2/frame/g"
	"github.com/kennylixi/gadmin/internal/modules/system/model"
	"github.com/kennylixi/gadmin/internal/modules/system/model/entity"
)

type DistrictSyncReq struct {
	g.Meta `path:"/district/sync" tags:"行政区域" method:"get" summary:"同步行政区域结构"`
}
type DistrictSyncRes struct {
}

type DistrictListReq struct {
	g.Meta `path:"/district/list/{Id}" tags:"行政区域" method:"get" summary:"获取下级行政区域"`
	Id     int64
}
type DistrictListRes []*model.District

type DistrictGetInfoReq struct {
	g.Meta `path:"/district/{Id}" tags:"行政区域" method:"get" summary:"获取行政区域详情"`
	Id     int64
}
type DistrictGetInfoRes entity.District

type DistrictAddReq struct {
	g.Meta   `path:"/district" tags:"行政区域" method:"post" summary:"新增行政区域"`
	ParentId int64  `v:"min:0#请选择上级行政区"`  // 上级编号
	Name     string `v:"required#地区名称必填"` // 地区名称
	Center   string // 经纬度
	Citycode string // 区域编码
	Adcode   string // 城市代码
	Status   string `d:"0"` // 是否开放
	OrderNum int    // 排序
}
type DistrictAddRes struct {
}

type DistrictEditReq struct {
	g.Meta   `path:"/district" tags:"行政区域" method:"put" summary:"修改行政区域"`
	Id       int64  // 编号
	ParentId int64  `v:"min:0#请选择上级行政区"`  // 上级编号
	Name     string `v:"required#地区名称必填"` // 地区名称
	Center   string // 经纬度
	Citycode string // 城市编码
	Adcode   string // 邮编
	Status   string `d:"0"` // 是否开放
	OrderNum int    // 排序
}
type DistrictEditRes struct {
}

type DistrictDeleteReq struct {
	g.Meta `path:"/district" tags:"行政区域" method:"delete" summary:"删除行政区域"`
	Id     int64
}
type DistrictDeleteRes struct {
}

type DistrictExcludeReq struct {
	g.Meta `path:"/district/exclude/{Id}" tags:"行政区域" method:"get" summary:"获取包含特定行政区域树形结构"`
	Id     int64
}
type DistrictExcludeRes []*model.District
