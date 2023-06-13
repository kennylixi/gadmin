package admin

import (
	"github.com/gogf/gf/v2/frame/g"
	"github.com/kennylixi/gadmin/internal/modules/system/model"
	"github.com/kennylixi/gadmin/internal/modules/system/model/entity"
)

type PostListReq struct {
	g.Meta   `path:"/post/list" tags:"岗位管理" method:"get" summary:"获取岗位列表"`
	PostCode string
	PostName string
	Status   string
}
type PostListRes struct {
	List  []*model.PostListItem `json:"list"`  // 列表
	Total int                   `json:"total"` // 数据总数
}

// PostExportReq 导出Excel数据
type PostExportReq struct {
	g.Meta   `path:"/post/export" tags:"岗位管理" method:"post" summary:"导出Excel数据"`
	PostCode string
	PostName string
	Status   string
}
type PostExportRes struct {
}

type PostGetInfoReq struct {
	g.Meta `path:"/post/{PostId}" tags:"岗位管理" method:"get" summary:"获取岗位详情"`
	PostId int64
}
type PostGetInfoRes entity.Post

type PostAddReq struct {
	g.Meta   `path:"/post" tags:"岗位管理" method:"post" summary:"新增岗位"`
	PostCode string // 岗位编码
	PostName string // 岗位名称
	PostSort int    // 显示顺序
	Status   string // 状态（0正常 1停用）
	Remark   string // 备注
}
type PostAddRes struct{}

type PostEditReq struct {
	g.Meta   `path:"/post" tags:"岗位管理" method:"put" summary:"修改岗位"`
	PostId   int64  // 岗位ID
	PostCode string // 岗位编码
	PostName string // 岗位名称
	PostSort int    // 显示顺序
	Status   string // 状态（0正常 1停用）
	Remark   string // 备注
}
type PostEditRes struct{}

type PostDeleteReq struct {
	g.Meta  `path:"/post" tags:"岗位管理" method:"delete" summary:"删除岗位"`
	PostIds []int64
}
type PostDeleteRes struct{}

type PostOptionselectReq struct {
	g.Meta `path:"/post/optionselect" tags:"岗位管理" method:"get" summary:"获取岗位选择框列表"`
}
type PostOptionselectRes []*entity.Post
