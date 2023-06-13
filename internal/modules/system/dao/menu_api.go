// =================================================================================
// This is auto-generated by GoFrame CLI tool only once. Fill this file as you wish.
// =================================================================================

package dao

import "github.com/kennylixi/gadmin/internal/modules/system/dao/internal"

// internalMenuApiDao is internal type for wrapping internal DAO implements.
type internalMenuApiDao = *internal.MenuApiDao

// menuApiDao is the data access object for table sys_menu_api.
// You can define custom methods on it to extend its functionality as you wish.
type menuApiDao struct {
	internalMenuApiDao
}

var (
	// MenuApi is globally public accessible object for table sys_menu_api operations.
	MenuApi = menuApiDao{
		internal.NewMenuApiDao(),
	}
)

// Fill with you ideas below.