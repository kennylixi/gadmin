// =================================================================================
// Code generated by GoFrame CLI tool. DO NOT EDIT.
// =================================================================================

package entity

import (
	"github.com/gogf/gf/v2/os/gtime"
)

// District is the golang structure for table district.
type District struct {
	Id          int64       `json:"id"          description:"编号"`
	ParentId    int64       `json:"parentId"    description:"上级编号"`
	Ancestors   string      `json:"ancestors"   description:"祖级列表"`
	Name        string      `json:"name"        description:"地区名称"`
	Center      string      `json:"center"      description:"经纬度"`
	Citycode    string      `json:"citycode"    description:"城市编码"`
	Adcode      string      `json:"adcode"      description:"邮编"`
	Pinyin      string      `json:"pinyin"      description:"拼音"`
	FirstPinyin string      `json:"firstPinyin" description:"拼音第一个字母"`
	Level       string      `json:"level"       description:"级别"`
	Status      string      `json:"status"      description:"是否开放"`
	OrderNum    int         `json:"orderNum"    description:"排序"`
	CreateBy    string      `json:"createBy"    description:"创建者"`
	CreatedAt   *gtime.Time `json:"createdAt"   description:"创建时间"`
	UpdateBy    string      `json:"updateBy"    description:"更新者"`
	UpdatedAt   *gtime.Time `json:"updatedAt"   description:"更新时间"`
	DeletedAt   *gtime.Time `json:"deletedAt"   description:"删除时间"`
}