package admin

import (
	"github.com/gogf/gf/v2/frame/g"
	"github.com/kennylixi/gadmin/internal/modules/system/model/entity"
)

// LoginInforListReq 用户登录日志列表请求
type LoginInforListReq struct {
	g.Meta   `path:"/logininfor/list" tags:"登录日志" method:"get" summary:"获取登录日志列表"`
	UserName string // 用户名称
	Ipaddr   string // 登录地址
	Status   string // 状态
}
type LoginInforListRes struct {
	List  []*entity.Logininfor `json:"list"`  // 列表
	Total int                  `json:"total"` // 数据总数
}

// LoginInforExportReq 导出Excel
type LoginInforExportReq struct {
	g.Meta   `path:"/logininfor/export" tags:"登录日志" method:"post" summary:"导出登录日志"`
	UserName string // 用户名称
	Ipaddr   string // 登录地址
	Status   string // 状态
}
type LoginInforExportRes struct {
}

// LoginInforDeleteReq 删除用户日志
type LoginInforDeleteReq struct {
	g.Meta `path:"/logininfor" tags:"登录日志" method:"delete" summary:"删除登录日志"`
	Ids    []int64
}
type LoginInforDeleteRes struct{}

type LoginInforCleanReq struct {
	g.Meta `path:"/logininfor/clean" tags:"登录日志" method:"delete" summary:"清空登录日志"`
}
type LoginInforCleanRes struct{}

type LoginInforUnlockReq struct {
	g.Meta   `path:"/logininfor/unlock/{UserName}" tags:"登录日志" method:"get" summary:"账户解锁"`
	UserName string
}
type LoginInforUnlockRes struct{}
