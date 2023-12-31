// =================================================================================
// Code generated by GoFrame CLI tool. DO NOT EDIT.
// =================================================================================

package entity

import (
	"github.com/gogf/gf/v2/os/gtime"
)

// Notice is the golang structure for table notice.
type Notice struct {
	NoticeId      int         `json:"noticeId"      description:"公告ID"`
	NoticeTitle   string      `json:"noticeTitle"   description:"公告标题"`
	NoticeType    string      `json:"noticeType"    description:"公告类型（1通知 2公告）"`
	NoticeContent string      `json:"noticeContent" description:"公告内容"`
	Status        string      `json:"status"        description:"公告状态（0正常 1关闭）"`
	CreateBy      string      `json:"createBy"      description:"创建者"`
	CreatedAt     *gtime.Time `json:"createdAt"     description:"创建时间"`
	UpdateBy      string      `json:"updateBy"      description:"更新者"`
	UpdatedAt     *gtime.Time `json:"updatedAt"     description:"更新时间"`
	Remark        string      `json:"remark"        description:"备注"`
}
