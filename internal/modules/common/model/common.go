package model

import (
	"fmt"
	"github.com/gogf/gf/v2/database/gdb"
	"github.com/gogf/gf/v2/text/gstr"
	"github.com/gogf/gf/v2/util/gconv"
)

// SearchParams 搜索参数
type SearchParams struct {
	PageNum       int                    `json:"pageNum" d:"1" dc:"当前记录起始索引"`           //当前记录起始索引
	PageSize      int                    `json:"pageSize" d:"10" dc:"每页显示记录数"`          //每页显示记录数
	OrderByColumn string                 `json:"orderByColumn" dc:"排序列"`                //排序列
	IsAsc         string                 `json:"isAsc" dc:"排序的方向descending或者ascending"` //排序的方向desc或者asc
	Params        map[string]interface{} `json:"params" dc:"参数"`
}

// Page 分页
func (s *SearchParams) Page(model *gdb.Model) *gdb.Model {
	return model.Page(s.PageNum, s.PageSize)
}

// OrderBy 排序
func (s *SearchParams) OrderBy(model *gdb.Model, tablePrefix ...string) *gdb.Model {
	columName := gstr.CaseSnake(s.OrderByColumn)
	if len(tablePrefix) > 0 {
		columName = tablePrefix[0] + "." + columName
	}
	if s.IsAsc == "descending" {
		return model.OrderDesc(columName)
	}
	return model.OrderAsc(columName)
}

// GetBeginTime 获取指定字段的开始时间
func (s *SearchParams) GetBeginTime(columName string) interface{} {
	if s.Params == nil {
		return nil
	}

	columValue, ok := s.Params["begin"+gstr.CaseCamel(columName)]
	if !ok {
		columValue, _ = s.Params["beginTime"]
	}
	return columValue
}

// GetEndTime 获取指定字段的结束时间
func (s *SearchParams) GetEndTime(columName string, tablePrefix ...string) interface{} {
	if s.Params == nil {
		return nil
	}

	if len(tablePrefix) > 0 {
		columName = tablePrefix[0] + "." + columName
	}
	columValue, ok := s.Params["end"+gstr.CaseCamel(columName)]
	if !ok {
		columValue, _ = s.Params["endTime"]
	}
	return columValue
}

// WhereBeginTime 拼装时间sql语句
// @param columName 	字段名，sql字段名
// @param model			Model
// @param tablePrefix	表前缀
func (s *SearchParams) WhereBeginTime(columName string, model *gdb.Model, tablePrefix ...string) *gdb.Model {
	columValue := s.GetBeginTime(columName)

	if len(tablePrefix) > 0 {
		columName = tablePrefix[0] + "." + columName
	}

	if columValue != nil && len(gconv.String(columName)) > 0 {
		return model.Where(fmt.Sprintf("%s >= ?", columName), columValue)
	}
	return model
}

// WhereEndTime 拼装时间sql语句
// @param columName 	字段名，sql字段名
// @param model			Model
// @param tablePrefix	表前缀
func (s *SearchParams) WhereEndTime(columName string, model *gdb.Model, tablePrefix ...string) *gdb.Model {
	columValue := s.GetEndTime(columName)

	if len(tablePrefix) > 0 {
		columName = tablePrefix[0] + "." + columName
	}

	if columValue != nil && len(gconv.String(columValue)) > 0 {
		return model.Where(fmt.Sprintf("%s <= ?", columName), columValue)
	}
	return model
}

// IsAdmin 指定用户是否为管理员
func IsAdmin(userId int64) bool {
	return userId == 1
}

func IsAdminRole(roleId int64) bool {
	return roleId == 1
}
