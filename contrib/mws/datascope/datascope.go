package datascope

import (
	"fmt"
	"github.com/gogf/gf/v2/net/ghttp"
	"github.com/kennylixi/gadmin/internal/consts"
	"github.com/kennylixi/gadmin/internal/core/response"
	commonService "github.com/kennylixi/gadmin/internal/modules/common/service"
	"github.com/kennylixi/gadmin/internal/modules/system/service"
)

const (
	DataScopeAll          = "1" //全部数据权限
	DataScopeCustom       = "2" //自定数据权限
	DataScopeDept         = "3" //部门数据权限
	DataScopeDeptAndChild = "4" //部门及以下数据权限
	DataScopeSelf         = "5" //仅本人数据权限
)

// DataScope 数据权限判断处理中间件
func DataScope() func(r *ghttp.Request) {
	return func(r *ghttp.Request) {
		ctx := r.GetCtx()
		userId := commonService.BizCtx().GetUserId(ctx)
		deptId := commonService.BizCtx().GetDeptId(ctx)

		roles, err := service.Role().SelectRolesByUserId(ctx, userId)
		if err != nil {
			response.JsonExit(r, consts.Fail, "获取数据权限失败")
			return
		}

		whereMap := make(map[string]string)
		for _, role := range roles {
			switch role.DataScope {
			case DataScopeAll: //全部数据权限
				whereMap[DataScopeAll] = ""
			case DataScopeCustom: //自定数据权限
				whereMap[DataScopeCustom] = fmt.Sprintf(" OR d.dept_id IN ( SELECT dept_id FROM role_dept WHERE role_id = %d ) ", role.RoleId)
			case DataScopeDept: //部门数据权限
				whereMap[DataScopeDept] = fmt.Sprintf(" OR d.dept_id = %d ", deptId)
			case DataScopeDeptAndChild: //部门及以下数据权限
				whereMap[DataScopeDeptAndChild] = fmt.Sprintf(" OR d.dept_id IN ( SELECT dept_id FROM sys_dept WHERE dept_id = %d or find_in_set( %d , ancestors ) )", deptId, deptId)
			case DataScopeSelf: //仅本人数据权限
				whereMap[DataScopeSelf] = fmt.Sprintf(" OR u.user_id = %d ", userId)
			}
		}

		if len(whereMap) > 0 {
			var scopeSql string
			for _, sql := range whereMap {
				scopeSql = scopeSql + sql
			}
			commonService.BizCtx().SetScopeData(ctx, "( "+scopeSql[4:]+" )")
		}

		r.Middleware.Next()
	}
}
