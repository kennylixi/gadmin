package model

import (
	"github.com/gogf/gf/v2/os/gtime"
)

type PostListItem struct {
	PostId    int64       `json:"postId" meta:"name|岗位编号;cellType|0"`
	PostCode  string      `json:"postCode" meta:"name|岗位编码"`
	PostName  string      `json:"postName" meta:"name|岗位名称"`
	PostSort  int         `json:"postSort" meta:"name|显示顺序"`
	Status    string      `json:"status" meta:"name|状态;readConverterExp|0=正常,1=停用;combo|正常,停用"`
	CreatedAt *gtime.Time `json:"createdAt" meta:"name|创建时间;width|25;dateFormat|Y-m-d H:i:s"`
	Remark    string      `json:"remark" meta:"name|备注"`
}

type PostListInput struct {
	PostCode string
	PostName string
	Status   string
}
type PostListOutput struct {
	List  []*PostListItem `json:"list"`  // 列表
	Total int             `json:"total"` // 数据总数
}

type PostAddInput struct {
	PostCode string // 岗位编码
	PostName string // 岗位名称
	PostSort int    // 显示顺序
	Status   string // 状态（0正常 1停用）
	Remark   string // 备注
	CreateBy string // 创建者
}

type PostEditInput struct {
	PostId   int64  // 岗位ID
	PostCode string // 岗位编码
	PostName string // 岗位名称
	PostSort int    // 显示顺序
	Status   string // 状态（0正常 1停用）
	Remark   string // 备注
	UpdateBy string // 更新者
}
