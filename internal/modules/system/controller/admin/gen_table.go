package admin

import (
	"context"
	"github.com/gogf/gf/v2/encoding/gcompress"
	"github.com/gogf/gf/v2/frame/g"
	"github.com/gogf/gf/v2/os/gfile"
	"github.com/gogf/gf/v2/text/gstr"
	"github.com/gogf/gf/v2/util/gconv"
	commonService "github.com/kennylixi/gadmin/internal/modules/common/service"
	"github.com/kennylixi/gadmin/internal/modules/system/api/v1/admin"
	"github.com/kennylixi/gadmin/internal/modules/system/model"
	"github.com/kennylixi/gadmin/internal/modules/system/service"
)

var GenTable = cGenTable{}

type cGenTable struct{}

// List 查询代码生成列表
func (c *cGenTable) List(ctx context.Context, req *admin.GenTableListReq) (res *admin.GenTableListRes, err error) {
	out, err := service.GenTable().SelectGenTableList(ctx, &model.GenTableListInput{
		TableName:    req.TableName,
		TableComment: req.TableComment,
		CreateBy:     req.CreateBy,
	})
	if err != nil {
		return
	}
	res = &admin.GenTableListRes{
		List:  out.List,
		Total: out.Total,
	}
	return
}

// GetInfo 获取业务信息
func (c *cGenTable) GetInfo(ctx context.Context, req *admin.GenTableGetInfoReq) (res *admin.GenTableGetInfoRes, err error) {
	tableId := req.TableId
	table, err := service.GenTable().SelectGenTableById(ctx, tableId)
	if err != nil {
		return
	}
	tables, err := service.GenTable().SelectGenTableAll(ctx)
	if err != nil {
		return
	}
	list, err := service.GenTableColumn().SelectGenTableColumnListByTableId(ctx, tableId)
	if err != nil {
		return
	}

	res = &admin.GenTableGetInfoRes{
		Info:   table,
		List:   list,
		Tables: tables,
	}
	return
}

// ListDbTable 查询数据库列表
func (c *cGenTable) ListDbTable(ctx context.Context, req *admin.GenTableDataListReq) (res *admin.GenTableDbTableRes, err error) {
	out, err := service.GenTable().SelectDbTableList(ctx, &model.GenTableDataListInput{
		TableName:    req.TableName,
		TableComment: req.TableComment,
	})
	if err != nil {
		return
	}
	res = &admin.GenTableDbTableRes{
		List:  out.List,
		Page:  out.Page,
		Size:  out.Size,
		Total: out.Total,
	}
	return
}

// Update 查询数据表字段列表
func (c *cGenTable) Update(ctx context.Context, req *admin.GenTableUpdateReq) (res *admin.GenTableUpdateRes, err error) {
	in := &model.GenTableUpdateInput{
		GenTableItem: req.GenTableItem,
		Params:       req.Params,
	}
	err = service.GenTable().ValidateEdit(in)
	if err != nil {
		return
	}
	err = service.GenTable().UpdateGenTable(ctx, in)
	if err != nil {
		return
	}
	return
}

// Delete 删除代码生成
func (c *cGenTable) Delete(ctx context.Context, req *admin.GenTableDeleteReq) (res *admin.GenTableDeleteRes, err error) {
	err = service.GenTable().DeleteGenTableByIds(ctx, req.TableIds)
	return
}

// ImportTable 导入表结构（保存）
func (c *cGenTable) ImportTable(ctx context.Context, req *admin.GenTableImportTableReq) (res *admin.GenTableImportTableRes, err error) {
	tableList, err := service.GenTable().SelectDbTableListByNames(ctx, req.TableNames)
	if err != nil {
		return
	}
	operName := commonService.BizCtx().GetUserName(ctx)
	if err = service.GenTable().ImportGenTable(ctx, tableList, operName); err != nil {
		return
	}
	return
}

// Preview 预览代码
func (c *cGenTable) Preview(ctx context.Context, req *admin.GenTablePreviewReq) (res admin.GenTablePreviewRes, err error) {
	res, err = service.GenTable().PreviewCode(ctx, req.TableId)
	return
}

// GenCode 生成代码（自定义路径）
func (c *cGenTable) GenCode(ctx context.Context, req *admin.GenTableGenCodeReq) (res *admin.GenTableGenCodeRes, err error) {
	err = service.GenTable().GeneratorCode(ctx, req.TableName)
	return
}

// SynchDb 生成代码（自定义路径）
func (c *cGenTable) SynchDb(ctx context.Context, req *admin.GenTableSynchDbReq) (res *admin.GenTableSynchDbRes, err error) {
	err = service.GenTable().SynchDb(ctx, req.TableName)
	return
}

// BatchGenCode 批量生成代码
func (c *cGenTable) BatchGenCode(ctx context.Context, req *admin.GenTableBatchGenCodeReq) (res *admin.GenTableBatchGenCodeRes, err error) {
	r := g.RequestFromCtx(ctx)
	genDir, err := service.GenTable().DownloadCode(r.Context(), gstr.Split(req.Tables, ","))
	if err != nil {
		return
	}

	//打包
	err = gcompress.ZipPathWriter(genDir, r.Response.Writer)
	if err != nil {
		return
	}
	//删除生成的文件
	gfile.Remove(genDir)
	//设置下载文件名
	r.Response.Header().Set("Access-Control-Allow-Origin", "*")
	r.Response.Header().Set("Access-Control-Expose-Headers", "Content-Disposition")
	r.Response.Header().Set("Content-Disposition", "attachment; filename=\"github.com/kennylixi/gadmin.zip\"")
	r.Response.Header().Set("Content-Length", gconv.String(r.Response.BufferLength()))
	r.Response.Header().Set("Content-Type", "application/octet-stream; charset=UTF-8")
	r.Response.Flush()
	return
}
