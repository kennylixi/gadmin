package admin

import (
	"github.com/gogf/gf/v2/frame/g"
	"github.com/kennylixi/gadmin/internal/modules/system/model"
	"github.com/kennylixi/gadmin/internal/modules/system/model/entity"
)

// ConfigListReq API请求参数设置列表
type ConfigListReq struct {
	g.Meta     `path:"/config/list" tags:"参数管理" method:"get" summary:"获取参数列表"`
	ConfigName string `json:"configName" dc:"参数名称"`        // 参数名称
	ConfigKey  string `json:"configKey" dc:"参数键名"`         // 参数键名
	ConfigType string `json:"configType" dc:"系统内置（Y是 N否）"` // 系统内置（Y是 N否）
}
type ConfigListRes struct {
	List  []*model.ConfigListItem `json:"list"`  // 列表
	Total int                     `json:"total"` // 数据总数
}

// ConfigExportReq 导出Excel
type ConfigExportReq struct {
	g.Meta     `path:"/config/export" tags:"参数管理" method:"post" summary:"导出Excel"`
	ConfigName string `json:"configName" dc:"参数名称"`        // 参数名称
	ConfigKey  string `json:"configKey" dc:"参数键名"`         // 参数键名
	ConfigType string `json:"configType" dc:"系统内置（Y是 N否）"` // 系统内置（Y是 N否）
}
type ConfigExportRes struct {
}

// ConfigGetInfoReq 根据参数编号获取详细信息
type ConfigGetInfoReq struct {
	g.Meta   `path:"/config/{configId}" tags:"参数管理" method:"get" summary:"根据ID获取参数详情"`
	ConfigId int64 `in:"path" json:"configId" v:"required#请选择参数" dc:"参数ID"` // 参数ID
}
type ConfigGetInfoRes struct {
	entity.Config
}

// ConfigKeyReq 根据参数键名查询参数值
type ConfigKeyReq struct {
	g.Meta    `path:"/config/configKey/{configKey}" tags:"参数管理" method:"get" summary:"根据Key获取参数详情"`
	ConfigKey string `in:"path" json:"configKey" v:"required#请选择参数" dc:"参数键值"`
}
type ConfigKeyRes string

// ConfigAddReq 新增参数配置
type ConfigAddReq struct {
	g.Meta      `path:"/config" tags:"参数管理" method:"post" summary:"新增参数"`
	ConfigName  string `json:"configName" v:"required#请输入参数名称" dc:"参数名称"`          // 参数名称
	ConfigKey   string `json:"configKey" v:"required#请输入参数键名" dc:"参数键名"`           // 参数键名
	ConfigValue string `json:"configValue" v:"required#请输入参数键值" dc:"参数键值"`         // 参数键值
	ConfigType  string `json:"configType" v:"required#请选择是否系统内置" dc:"系统内置（Y是 N否）"` // 系统内置（Y是 N否）
	Remark      string `json:"remark" dc:"备注"`                                     // 备注
}
type ConfigAddRes struct {
	ConfigId int64 `json:"configId"` // 参数主键
}

// ConfigEditReq 修改参数配置
type ConfigEditReq struct {
	g.Meta      `path:"/config" tags:"参数管理" method:"put" summary:"修改参数"`
	ConfigId    int64  `json:"configId" v:"required#请选择需要修改的参数" dc:"参数主键"`         // 参数主键
	ConfigName  string `json:"configName" v:"required#请输入参数名称" dc:"参数名称"`          // 参数名称
	ConfigKey   string `json:"configKey" v:"required#请输入参数键名" dc:"参数键名"`           // 参数键名
	ConfigValue string `json:"configValue" v:"required#请输入参数键值" dc:"参数键值"`         // 参数键值
	ConfigType  string `json:"configType" v:"required#请选择是否系统内置" dc:"系统内置（Y是 N否）"` // 系统内置
	Remark      string `json:"remark" dc:"备注"`                                     // 备注
}
type ConfigEditRes struct{}

// ConfigEditValueReq 修改参数配置
type ConfigEditValueReq struct {
	g.Meta      `path:"/config/value" tags:"参数管理" method:"put" summary:"修改参数值"`
	ConfigKey   string `json:"configKey" v:"required#请输入参数键名" dc:"参数键名"`   // 参数键名
	ConfigValue string `json:"configValue" v:"required#请输入参数键值" dc:"参数键值"` // 参数键值
}
type ConfigEditValueRes struct{}

// ConfigDeleteReq 删除参数配置
type ConfigDeleteReq struct {
	g.Meta    `path:"/config" tags:"参数管理" method:"delete" summary:"删除参数"`
	ConfigIds []int64 `json:"configIds" v:"required#请选择需要删除的参数" dc:"参数IDS"`
}
type ConfigDeleteRes struct{}

// ConfigRefreshCacheReq 刷新参数缓存
type ConfigRefreshCacheReq struct {
	g.Meta `path:"/config/refreshCache" tags:"参数管理" method:"delete" summary:"刷新参数缓存"`
}
type ConfigRefreshCacheRes struct{}
