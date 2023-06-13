// =================================================================================
// Code generated by GoFrame CLI tool. DO NOT EDIT.
// =================================================================================

package entity

import (
	"github.com/gogf/gf/v2/os/gtime"
)

// Api is the golang structure for table api.
type Api struct {
	ApiId     int64       `json:"apiId"     description:"接口ID"`
	ApiModule string      `json:"apiModule" description:"业务模块"`
	ApiName   string      `json:"apiName"   description:"接口名称"`
	ApiMethod string      `json:"apiMethod" description:"请求方法"`
	ApiUrl    string      `json:"apiUrl"    description:"接口地址"`
	CreateBy  string      `json:"createBy"  description:"创建者"`
	CreatedAt *gtime.Time `json:"createdAt" description:"创建时间"`
	UpdateBy  string      `json:"updateBy"  description:"更新者"`
	UpdatedAt *gtime.Time `json:"updatedAt" description:"更新时间"`
	Remark    string      `json:"remark"    description:"备注"`
}