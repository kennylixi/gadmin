// =================================================================================
// This is auto-generated by GoFrame CLI tool only once. Fill this file as you wish.
// =================================================================================

package dao

import (
	"github.com/kennylixi/gadmin/internal/modules/system/dao/internal"
)

// internalDistrictDao is internal type for wrapping internal DAO implements.
type internalDistrictDao = *internal.DistrictDao

// districtDao is the data access object for table sys_district.
// You can define custom methods on it to extend its functionality as you wish.
type districtDao struct {
	internalDistrictDao
}

var (
	// District is globally public accessible object for table sys_district operations.
	District = districtDao{
		internal.NewDistrictDao(),
	}
)

// Fill with you ideas below.
