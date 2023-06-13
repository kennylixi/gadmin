package model

import "github.com/gogf/gf/v2/os/gtime"

// ConfigListItem 用于列表展示
type ConfigListItem struct {
	ConfigId    int         `json:"configId"    meta:"name|编号;cellType|0"`                           // 参数主键
	ConfigName  string      `json:"configName"  meta:"name|参数名称"`                                    // 参数名称
	ConfigKey   string      `json:"configKey"   meta:"name|参数键名"`                                    // 参数键名
	ConfigValue string      `json:"configValue" meta:"name|参数键值"`                                    // 参数键值
	ConfigType  string      `json:"configType"  meta:"name|系统内置;readConverterExp|Y=是,N=否;combo|是,否"` // 系统内置（Y是 N否）
	CreatedAt   *gtime.Time `json:"createdAt"   meta:"name|创建时间;width|25;dateFormat|Y-m-d H:i:s"`    // 创建时间
	Remark      string      `json:"remark"      meta:"name|备注"`                                      // 备注
}

// ConfigListInput 参数列表输入参数
type ConfigListInput struct {
	ConfigName string // 参数名称
	ConfigKey  string // 参数键名
	ConfigType string // 系统内置（Y是 N否）
}
type ConfigListOutput struct {
	List  []*ConfigListItem // 列表
	Total int               // 数据总数
}

// ConfigAddInput 新增参数输入参数
type ConfigAddInput struct {
	ConfigName  string // 参数名称
	ConfigKey   string // 参数键名
	ConfigValue string // 参数键值
	ConfigType  string // 系统内置（Y是 N否）
	Remark      string // 备注
	CreateBy    string // 创建者
}

// ConfigEditInput 修改参数输入参数
type ConfigEditInput struct {
	ConfigId    int64  // 参数主键
	ConfigName  string // 参数名称
	ConfigKey   string // 参数键名
	ConfigValue string // 参数键值
	ConfigType  string // 系统内置（Y是 N否）
	Remark      string // 备注
	UpdateBy    string // 更新者
}
