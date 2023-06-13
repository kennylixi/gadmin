package model

import (
	"github.com/kennylixi/gadmin/internal/modules/system/model/entity"
)

type DeptListInput struct {
	ParentId int64  // 上级部门编号
	DeptId   int64  // 部门编号
	DeptName string // 部门名称
	Status   string // 部门状态（0正常 1停用）
}

type DeptAddInput struct {
	ParentId int64  // 父部门id
	DeptName string // 部门名称
	OrderNum int    // 显示顺序
	Leader   string // 负责人
	Phone    string // 联系电话
	Email    string // 邮箱
	Status   string // 部门状态（0正常 1停用）
	CreateBy string // 创建者
}

type DeptEditInput struct {
	DeptId   int64  // 部门id
	ParentId int64  // 父部门id
	DeptName string // 部门名称
	OrderNum int    // 显示顺序
	Leader   string // 负责人
	Phone    string // 联系电话
	Email    string // 邮箱
	Status   string // 部门状态（0正常 1停用）
	UpdateBy string // 更新者
}

type DeptSelectDeptTreeListInput struct {
	entity.Dept
}
