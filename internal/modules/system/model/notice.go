package model

import (
	"github.com/kennylixi/gadmin/internal/modules/system/model/entity"
)

type NoticeListInput struct {
	NoticeTitle string // 公告标题
	NoticeType  string // 公告类型（1通知 2公告）
	CreateBy    string // 创建者
}
type NoticeListOutput struct {
	List  []*entity.Notice `json:"list"`  // 列表
	Total int              `json:"total"` // 数据总数
}

type NoticeAddInput struct {
	NoticeTitle   string // 公告标题
	NoticeType    string // 公告类型（1通知 2公告）
	NoticeContent string // 公告内容
	Status        string // 公告状态（0正常 1关闭）
	Remark        string // 备注
	CreateBy      string
}
type NoticeAddOutput struct{}

type NoticeEditInput struct {
	NoticeId      int64  // 公告ID
	NoticeTitle   string // 公告标题
	NoticeType    string // 公告类型（1通知 2公告）
	NoticeContent string // 公告内容
	Status        string // 公告状态（0正常 1关闭）
	Remark        string // 备注
	UpdateBy      string
}
type NoticeEditOutput struct{}
