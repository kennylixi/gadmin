// ================================================================================
// Code generated by GoFrame CLI tool. DO NOT EDIT.
// You can delete these comments if you wish manually maintain this interface file.
// ================================================================================

package service

import (
	"context"
	commonModel "github.com/kennylixi/gadmin/internal/modules/common/model"
	systemModel "github.com/kennylixi/gadmin/internal/modules/system/model"
	"github.com/kennylixi/gadmin/internal/modules/system/model/entity"

	"github.com/gogf/gf/v2/database/gdb"
)

type (
	IDept interface {
		List(ctx context.Context, req *systemModel.DeptListInput) (depts []*entity.Dept, err error)
		SelectDeptById(ctx context.Context, deptId int64) (dept *entity.Dept, err error)
		SelectDeptTreeList(ctx context.Context, dept *systemModel.DeptSelectDeptTreeListInput) (depts []*commonModel.TreeSelect, err error)
		BuildDeptTreeSelect(ctx context.Context, depts []*entity.Dept) []*commonModel.TreeSelect
		SelectDeptListByRoleId(ctx context.Context, roleId int64) ([]int64, error)
		Add(ctx context.Context, in *systemModel.DeptAddInput) (int64, error)
		Edit(ctx context.Context, in *systemModel.DeptEditInput) error
		Delete(ctx context.Context, deptId int64) error
		HasChildByDeptId(ctx context.Context, deptId int64) (bool, error)
		CheckDeptExistUser(ctx context.Context, deptId int64) (bool, error)
		CheckDeptNameUnique(ctx context.Context, parentId int64, deptName string, deptId ...int64) (bool, error)
		CheckDeptDataScope(ctx context.Context, deptId int64) error
		UpdateDeptChildren(ctx context.Context, deptId int64, newAncestors, oldAncestors string, tx gdb.TX) error
	}
)

var (
	localDept IDept
)

func Dept() IDept {
	if localDept == nil {
		panic("implement not found for interface IDept, forgot register?")
	}
	return localDept
}

func RegisterDept(i IDept) {
	localDept = i
}
