package gen_table_column

import (
	"context"
	"github.com/kennylixi/gadmin/internal/modules/system/dao"
	"github.com/kennylixi/gadmin/internal/modules/system/model/entity"
	sysService "github.com/kennylixi/gadmin/internal/modules/system/service"
)

// GenTableColumn 生成表字段管理服务
type sGenTableColumn struct{}

func init() {
	sysService.RegisterGenTableColumn(New())
}

func New() *sGenTableColumn {
	return &sGenTableColumn{}
}

// SelectGenTableColumnListByTableId 查询业务字段列表
//	@param tableId 业务字段编号
//	@return 业务字段集合
func (s *sGenTableColumn) SelectGenTableColumnListByTableId(ctx context.Context, tableId int64) ([]*entity.GenTableColumn, error) {
	return dao.GenTableColumn.SelectGenTableColumnListByTableId(ctx, tableId)
}

// InsertGenTableColumn 新增业务字段
//	@param genTableColumn 业务字段信息
//	@return 结果
func (s *sGenTableColumn) InsertGenTableColumn(ctx context.Context, genTableColumn *entity.GenTableColumn) (int64, error) {
	return dao.GenTableColumn.InsertGenTableColumn(ctx, genTableColumn)
}

// UpdateGenTableColumn 修改业务字段
//	@param genTableColumn 业务字段信息
//	@return 结果
func (s *sGenTableColumn) UpdateGenTableColumn(ctx context.Context, genTableColumn *entity.GenTableColumn) (int64, error) {
	return dao.GenTableColumn.UpdateGenTableColumn(ctx, genTableColumn)
}

// DeleteGenTableColumnByIds 删除业务字段对象
//	@param ids 需要删除的数据ID
//	@return 结果
func (s *sGenTableColumn) DeleteGenTableColumnByIds(ctx context.Context, ids []int64) (int64, error) {
	return dao.GenTableColumn.DeleteGenTableColumnByIds(ctx, ids)
}
