package admin

import (
	"github.com/gogf/gf/v2/frame/g"
	"github.com/kennylixi/gadmin/internal/modules/system/model/entity"
)

type NoticeListReq struct {
	g.Meta      `path:"/notice/list" tags:"通知管理" method:"get" summary:"获取通知列表"`
	NoticeTitle string // 公告标题
	NoticeType  string // 公告类型（1通知 2公告）
	CreateBy    string // 创建者
}
type NoticeListRes struct {
	List  []*entity.Notice `json:"list"`  // 列表
	Total int              `json:"total"` // 数据总数
}

type NoticeGetInfoReq struct {
	g.Meta   `path:"/notice/{NoticeId}" tags:"通知管理" method:"get" summary:"获取通知详情"`
	NoticeId int64
}
type NoticeGetInfoRes entity.Notice

type NoticeAddReq struct {
	g.Meta        `path:"/notice" tags:"通知管理" method:"post" summary:"新增通知"`
	NoticeTitle   string // 公告标题
	NoticeType    string // 公告类型（1通知 2公告）
	NoticeContent string // 公告内容
	Status        string // 公告状态（0正常 1关闭）
	Remark        string // 备注
}
type NoticeAddRes struct{}

type NoticeEditReq struct {
	g.Meta        `path:"/notice" tags:"通知管理" method:"put" summary:"修改通知"`
	NoticeId      int64  // 公告ID
	NoticeTitle   string // 公告标题
	NoticeType    string // 公告类型（1通知 2公告）
	NoticeContent string // 公告内容
	Status        string // 公告状态（0正常 1关闭）
	Remark        string // 备注
}
type NoticeEditRes struct{}

type NoticeDeleteReq struct {
	g.Meta    `path:"/notice" tags:"通知管理" method:"delete" summary:"删除通知"`
	NoticeIds []int64
}
type NoticeDeleteRes struct{}
