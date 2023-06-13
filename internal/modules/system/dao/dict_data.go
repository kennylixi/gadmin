// =================================================================================
// This is auto-generated by GoFrame CLI tool only once. Fill this file as you wish.
// =================================================================================

package dao

import (
	"github.com/kennylixi/gadmin/internal/modules/system/dao/internal"
)

// internalDictDataDao is internal type for wrapping internal DAO implements.
type internalDictDataDao = *internal.DictDataDao

// dictDataDao is the data access object for table sys_dict_data.
// You can define custom methods on it to extend its functionality as you wish.
type dictDataDao struct {
	internalDictDataDao
}

var (
	// DictData is globally public accessible object for table sys_dict_data operations.
	DictData = dictDataDao{
		internal.NewDictDataDao(),
	}
)

// Fill with you ideas below.
