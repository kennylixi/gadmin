package admin

import (
	"github.com/gogf/gf/v2/frame/g"
	"github.com/gogf/gf/v2/os/gtime"
	"github.com/kennylixi/gadmin/internal/modules/system/model/entity"
)

// DeptListReq 获取部门列表
type DeptListReq struct {
	g.Meta   `path:"/dept/list" tags:"部门管理" method:"get" summary:"获取部门列表"`
	DeptName string // 部门名称
	Status   string // 部门状态（0正常 1停用）
}
type DeptListRes []*entity.Dept

// DeptExclueReq 查询部门列表（排除节点）
type DeptExclueReq struct {
	g.Meta `path:"/dept/list/exclude/{deptId}" tags:"部门管理" method:"get" summary:"查询部门列表（排除节点）"`
	DeptId int64 `json:"deptId"`
}
type DeptExclueRes []*entity.Dept

// DeptGetInfoReq 根据部门编号获取详细信息
type DeptGetInfoReq struct {
	g.Meta `path:"/dept/{deptId}" tags:"部门管理" method:"get" summary:"根据部门编号获取详细信息"`
	DeptId int64 `json:"deptId"`
}
type DeptGetInfoRes struct {
	DeptId    int64       `json:"deptId"`
	ParentId  int64       `json:"parentId"`
	DeptName  string      `json:"deptName"`
	OrderNum  int         `json:"orderNum"`
	Leader    string      `json:"leader"`
	Phone     string      `json:"phone"`
	Email     string      `json:"email"`
	Status    string      `json:"status"`
	CreateBy  string      `json:"createBy"`
	CreatedAt *gtime.Time `json:"createdAt"`
	UpdateBy  string      `json:"updateBy"`
	UpdatedAt *gtime.Time `json:"updatedAt"`
}

// DeptAddReq 新增部门
type DeptAddReq struct {
	g.Meta   `path:"/dept" tags:"部门管理" method:"post" summary:"新增部门"`
	ParentId int64  `json:"parentId"` // 父部门id
	DeptName string `json:"deptName"` // 部门名称
	OrderNum int    `json:"orderNum"` // 显示顺序
	Leader   string `json:"leader"`   // 负责人
	Phone    string `json:"phone"`    // 联系电话
	Email    string `json:"email"`    // 邮箱
	Status   string `json:"status"`   // 部门状态（0正常 1停用）
}
type DeptAddRes struct{}

// DeptEditReq 修改部门
type DeptEditReq struct {
	g.Meta   `path:"/dept" tags:"部门管理" method:"put" summary:"修改部门"`
	DeptId   int64  `json:"deptId"`   // 部门id
	ParentId int64  `json:"parentId"` // 父部门id
	DeptName string `json:"deptName"` // 部门名称
	OrderNum int    `json:"orderNum"` // 显示顺序
	Leader   string `json:"leader"`   // 负责人
	Phone    string `json:"phone"`    // 联系电话
	Email    string `json:"email"`    // 邮箱
	Status   string `json:"status"`   // 部门状态（0正常 1停用）
}
type DeptEditRes struct{}

// DeptDeleteReq 删除部门
type DeptDeleteReq struct {
	g.Meta `path:"/dept/{DeptId}" tags:"部门管理" method:"delete" summary:"删除部门"`
	DeptId int64 `json:"deptId"`
}
type DeptDeleteRes struct{}
