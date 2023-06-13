package admin

import (
	"context"
	"github.com/gogf/gf/v2/text/gstr"
	"github.com/gogf/gf/v2/util/gconv"
	commonService "github.com/kennylixi/gadmin/internal/modules/common/service"
	"github.com/kennylixi/gadmin/internal/modules/system/api/v1/admin"
	"github.com/kennylixi/gadmin/internal/modules/system/model"
	"github.com/kennylixi/gadmin/internal/modules/system/model/entity"
	sysService "github.com/kennylixi/gadmin/internal/modules/system/service"
)

// Dept 部门管理
var Dept = cDept{}

type cDept struct{}

// List 获取部门列表
func (c *cDept) List(ctx context.Context, req *admin.DeptListReq) (res admin.DeptListRes, err error) {
	dept := &model.DeptListInput{
		DeptName: req.DeptName,
		Status:   req.Status,
	}
	res, err = sysService.Dept().List(ctx, dept)
	if err == nil && res == nil {
		res = []*entity.Dept{}
	}
	return
}

// Exclude 查询部门列表（排除节点）
func (c *cDept) Exclude(ctx context.Context, req *admin.DeptExclueReq) (res admin.DeptExclueRes, err error) {
	deptList, err := sysService.Dept().List(ctx, &model.DeptListInput{})
	if err != nil || deptList == nil {
		return
	}

	depts := make([]*entity.Dept, 0, len(deptList))
	for i, dept := range deptList {
		if dept.DeptId != req.DeptId && !gstr.InArray(gstr.Split(dept.Ancestors, ","), gconv.String(req.DeptId)) {
			depts = append(depts, deptList[i])
		}
	}
	res = depts
	return
}

// GetInfo 根据部门编号获取详细信息
func (c *cDept) GetInfo(ctx context.Context, req *admin.DeptGetInfoReq) (res *admin.DeptGetInfoRes, err error) {
	err = sysService.Dept().CheckDeptDataScope(ctx, req.DeptId)
	if err != nil {
		return
	}
	dept, err := sysService.Dept().SelectDeptById(ctx, req.DeptId)
	if err != nil {
		return
	}
	res = &admin.DeptGetInfoRes{
		DeptId:    dept.DeptId,
		ParentId:  dept.ParentId,
		DeptName:  dept.DeptName,
		OrderNum:  dept.OrderNum,
		Leader:    dept.Leader,
		Phone:     dept.Phone,
		Email:     dept.Email,
		Status:    dept.Status,
		CreateBy:  dept.CreateBy,
		CreatedAt: dept.CreatedAt,
		UpdateBy:  dept.UpdateBy,
		UpdatedAt: dept.UpdatedAt,
	}
	return
}

// Add 新增部门
func (c *cDept) Add(ctx context.Context, req *admin.DeptAddReq) (res *admin.DeptAddRes, err error) {
	_, err = sysService.Dept().Add(ctx, &model.DeptAddInput{
		ParentId: req.ParentId,
		DeptName: req.DeptName,
		OrderNum: req.OrderNum,
		Leader:   req.Leader,
		Phone:    req.Phone,
		Email:    req.Email,
		Status:   req.Status,
		CreateBy: commonService.BizCtx().GetUserName(ctx),
	})
	return
}

// Edit 修改部门
func (c *cDept) Edit(ctx context.Context, req *admin.DeptEditReq) (res *admin.DeptEditRes, err error) {
	err = sysService.Dept().Edit(ctx, &model.DeptEditInput{
		DeptId:   req.DeptId,
		ParentId: req.ParentId,
		DeptName: req.DeptName,
		OrderNum: req.OrderNum,
		Leader:   req.Leader,
		Phone:    req.Phone,
		Email:    req.Email,
		Status:   req.Status,
		UpdateBy: commonService.BizCtx().GetUserName(ctx),
	})
	return
}

// Delete 删除部门
func (c *cDept) Delete(ctx context.Context, req *admin.DeptDeleteReq) (res *admin.DeptDeleteRes, err error) {
	err = sysService.Dept().Delete(ctx, req.DeptId)
	return
}
