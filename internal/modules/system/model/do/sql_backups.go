// =================================================================================
// Code generated by GoFrame CLI tool. DO NOT EDIT.
// =================================================================================

package do

import (
	"github.com/gogf/gf/v2/frame/g"
	"github.com/gogf/gf/v2/os/gtime"
)

// SqlBackups is the golang structure of table sys_sql_backups for DAO operations like Where/Data.
type SqlBackups struct {
	g.Meta    `orm:"table:sys_sql_backups, do:true"`
	BackupsId interface{} // 备份ID
	FileName  interface{} // 文件名称
	Password  interface{} // 加密密码
	FileSize  interface{} // 文件大小
	CreatedAt *gtime.Time // 备份时间
}
