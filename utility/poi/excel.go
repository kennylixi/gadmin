package poi

import (
	"context"
	"fmt"
	"github.com/gogf/gf/v2/errors/gerror"
	"github.com/gogf/gf/v2/frame/g"
	"github.com/gogf/gf/v2/os/gfile"
	"github.com/gogf/gf/v2/text/gstr"
	"github.com/gogf/gf/v2/util/gconv"
	"github.com/gogf/gf/v2/util/gutil"
	"github.com/kennylixi/gadmin/internal/consts/mime_type"
	"github.com/kennylixi/gadmin/internal/modules/system/model"
	sysService "github.com/kennylixi/gadmin/internal/modules/system/service"
	"github.com/xuri/excelize/v2"
	"io"
	"math"
	"strings"
)

const (
	FormulaStr = "=-+@"
)

type Excel struct {
	ctx                context.Context
	sheetName          string                    // 工作表名称
	currSheetName      string                    // 当前工作表名称
	opType             OpType                    // 导出类型（EXPORT:导出数据；IMPORT：导入模板）
	wb                 *excelize.File            // 工作薄对象
	styles             map[string]excelize.Style // 样式列表
	styleIds           map[string]int            // 样式ID
	list               []map[string]interface{}  // 导入导出数据列表
	originalMetaList   []*Meta                   // 原始注解列表
	metaList           []*Meta                   // 注解列表
	rownum             int                       // 当前行号
	startDataRowNum    int                       // 记录数据开始行
	maxDataRowNum      int                       // 最大数据行
	title              string                    // 标题（导出）
	maxHeight          int                       // 最大高度
	statisticColIndexs []int                     // 统计列索引
	exportTemplate     bool                      // 是否导出模板
}

// NewExcel 实例化Excel
//	@param metaClaz 对象 (*User)(nil)
func NewExcel(ctx context.Context, metaClaz interface{}) (e *Excel, err error) {
	if metaClaz == nil {
		err = gerror.New("请传入meta对象")
		return
	}

	metaList, err := parserMeta(metaClaz)
	if err != nil {
		return
	}

	e = &Excel{
		ctx:              ctx,
		originalMetaList: metaList,
	}
	return e, nil
}

// 用于导出初始化
func (e *Excel) initExcel(list []map[string]interface{}, sheetName, title string, opType OpType) (err error) {
	e.sheetName = sheetName
	e.title = title
	e.opType = opType
	e.statisticColIndexs = make([]int, 0, len(e.originalMetaList))

	e.list = list
	if e.list == nil {
		e.exportTemplate = true
		e.list = make([]map[string]interface{}, 0)
	}

	// 筛选字段
	e.metaList = make([]*Meta, 0, len(e.originalMetaList))
	startColumn := 1
	for _, meta := range e.originalMetaList {
		if e.exportTemplate {
			// 导出导入模板
			if meta.OpType == OpTypeAll || meta.OpType == OpTypeImport {
				e.metaList = append(e.metaList, meta)
			}
		} else {
			// 根据操作类型过滤
			if meta.OpType == OpTypeAll || meta.OpType == e.opType {
				e.metaList = append(e.metaList, meta)

				// 计算最大行高
				if meta.Height > e.maxHeight {
					e.maxHeight = meta.Height
				}

				// 统计列索引
				if meta.IsStatistics {
					// 如果是统计列默认设置为数字类型
					meta.CellType = ColumnTypeNumeric
					e.statisticColIndexs = append(e.statisticColIndexs, startColumn)
				}
				startColumn++
			}
		}
	}

	// 创建工作簿
	e.wb = excelize.NewFile()
	err = e.wb.SetSheetName(e.wb.GetSheetName(0), sheetName)
	if err != nil {
		return
	}

	// 设置第一页为活动页
	e.wb.SetActiveSheet(0)
	e.currSheetName = e.wb.GetSheetName(0)

	// 创建样式
	if err = e.createStyles(); err != nil {
		return
	}

	return
}

// ExportExcel 对list数据源将其里面的数据导入到excel表单
//	@param list 导出数据集合
//	@param sheetName 工作表的名称
//	@param title 标题
func (e *Excel) ExportExcel(list []map[string]interface{}, sheetName, title string) (err error) {
	err = e.initExcel(list, sheetName, title, OpTypeExport)
	if err != nil {
		return err
	}
	defer e.wb.Close()

	r := g.RequestFromCtx(e.ctx)
	r.Response.Header().Set("Content-Type", "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet; charset=UTF-8")
	if err = e.writeSheet(); err != nil {
		return
	}

	if err = e.wb.Write(r.Response.Writer); err != nil {
		return
	}
	return
}

// ExportTemplate 导出模板
//	@param sheetName 工作表的名称
func (e *Excel) ExportTemplate(sheetName string) error {
	return e.ExportExcel(nil, sheetName, "")
}

// ImportExcel 导入Excel数据
func (e *Excel) ImportExcel(sheetName string, r io.ReadCloser) ([]map[string]interface{}, error) {
	defer r.Close()

	var err error
	e.wb, err = excelize.OpenReader(r)
	if err != nil {
		return nil, err
	}
	defer e.wb.Close()

	// 如果没有指定sheet则默认第0页
	if sheetName == "" {
		sheetName = e.wb.GetSheetName(0)
	}
	rows, err := e.wb.GetRows(sheetName)
	if err != nil {
		return nil, err
	}
	if g.IsEmpty(rows) {
		return nil, nil
	}

	e.sheetName = sheetName
	e.opType = OpTypeImport

	// 筛选字段
	e.metaList = make([]*Meta, 0, len(e.originalMetaList))
	for _, meta := range e.originalMetaList {
		// 根据操作类型过滤
		if meta.OpType == OpTypeAll || meta.OpType == e.opType {
			e.metaList = append(e.metaList, meta)
		}
	}

	// 效验模板头部
	headRow := rows[0]
	if len(headRow) != len(e.metaList) {
		err = gerror.New("导入Excel格式错误")
		return nil, err
	}
	for i, meta := range e.metaList {
		if meta.Name != headRow[i] {
			err = gerror.New("导入Excel格式错误")
			return nil, err
		}
	}

	list := make([]map[string]interface{}, 0, len(rows))
	for i := 1; i < len(rows); i++ {
		rowMap := map[string]interface{}{}
		for cIndex, cValue := range rows[i] {
			meta := e.metaList[cIndex]
			if meta.ReadConverterExp != "" {
				cValue = reverseByExp(gconv.String(cValue), meta.ReadConverterExp, meta.Separator)
			} else if meta.DictType != "" {
				cValue = reverseDictByExp(e.ctx, gconv.String(cValue), meta.DictType, meta.Separator)
			} else if meta.FormatHandler != nil {
				cValue, err = meta.FormatHandler(cValue, meta.Args)
				if err != nil {
					return nil, err
				}
			} else if meta.CellType == ColumnTypeImage {
				colName, err := excelize.ColumnNumberToName(cIndex)
				if err != nil {
					return nil, err
				}
				cellName := fmt.Sprintf("%s%d", colName, i)
				picPath, picByte, err := e.wb.GetPicture(e.currSheetName, cellName)
				if err != nil {
					return nil, err
				}
				file, err := sysService.File().SaveByBytes(e.ctx, &model.FileSaveByBytesInput{
					FileBytes:        picByte,
					Ext:              gfile.ExtName(picPath),
					AllowedExtension: mime_type.ImageExtension,
				})
				if err != nil {
					return nil, err
				}
				cValue = file.FileName
			}
			rowMap[meta.FieldName] = cValue
		}
		list = append(list, rowMap)
	}

	return list, nil
}

// 创建样式
func (e *Excel) createStyles() (err error) {
	e.styles = map[string]excelize.Style{}
	e.styles["title"] = excelize.Style{
		Fill: excelize.Fill{
			Type:    "pattern",
			Pattern: 1,
			Color:   []string{"#808080"},
		},
		Font: &excelize.Font{
			Bold:   true,
			Family: "Arial",
			Size:   16,
			Color:  "#FFFFFF",
		},
		Alignment: &excelize.Alignment{
			Horizontal: HAlignCenter,
			Vertical:   VAlignCenter,
		},
	}

	e.styles["header"] = excelize.Style{
		Fill: excelize.Fill{
			Type:    "pattern",
			Pattern: 1,
			Color:   []string{"#808080"},
		},
		Font: &excelize.Font{
			Bold:   true,
			Family: "Arial",
			Size:   10,
			Color:  "#FFFFFF",
		},
		Alignment: &excelize.Alignment{
			Horizontal: HAlignCenter,
			Vertical:   VAlignCenter,
		},
	}

	e.styles["data"] = excelize.Style{
		Border: []excelize.Border{
			{Type: BorderTypeTop, Color: "#808080", Style: 1},
			{Type: BorderTypeLeft, Color: "#808080", Style: 1},
			{Type: BorderTypeRight, Color: "#808080", Style: 1},
			{Type: BorderTypeBottom, Color: "#808080", Style: 1},
		},
		Font: &excelize.Font{
			Family: "Arial",
			Size:   10,
		},
		Alignment: &excelize.Alignment{
			Horizontal: HAlignCenter,
			Vertical:   VAlignCenter,
		},
	}

	e.styles["total"] = excelize.Style{
		Font: &excelize.Font{
			Family: "Arial",
			Size:   10,
		},
		Alignment: &excelize.Alignment{
			Horizontal: HAlignCenter,
			Vertical:   VAlignCenter,
		},
	}

	e.createMetaHeaderStyles(e.styles)
	e.createMetaDataStyles(e.styles)

	// 创建样式ID
	e.styleIds = map[string]int{}
	var styleId int
	for key, style := range e.styles {
		styleId, err = e.wb.NewStyle(&style)
		if err != nil {
			return
		}
		e.styleIds[key] = styleId
	}
	return
}

// 创建meta自定义头部样式
func (e *Excel) createMetaHeaderStyles(styles map[string]excelize.Style) {
	for _, meta := range e.metaList {
		key := fmt.Sprintf("header_%s_%s", meta.HeaderColor, meta.HeaderBackgroundColor)
		if _, ok := styles[key]; !ok {
			style := gutil.Copy(styles["header"]).(excelize.Style)
			style.Fill.Color = []string{meta.HeaderBackgroundColor, meta.HeaderBackgroundColor}
			style.Font.Color = meta.HeaderColor
			styles[key] = style
		}
	}
}

// 创建meta自定义数据样式
func (e *Excel) createMetaDataStyles(styles map[string]excelize.Style) {
	for _, meta := range e.metaList {
		key := fmt.Sprintf("data_%s_%s_%s", meta.Align, meta.Color, meta.BackgroundColor)
		if _, ok := styles[key]; !ok {
			style := gutil.Copy(styles["data"]).(excelize.Style)
			style.Alignment.Horizontal = string(meta.Align)
			style.Fill.Color = []string{meta.BackgroundColor, meta.BackgroundColor}
			style.Font.Color = meta.Color
			styles[key] = style
		}
	}
}

// 创建第一行标题
func (e *Excel) createTitle() (err error) {
	if e.title == "" {
		return
	}

	var hCell, vCell string
	titleLastCol := len(e.metaList) - 1
	hCell, err = excelize.ColumnNumberToName(titleLastCol)
	if err != nil {
		return
	}
	vCell, err = excelize.ColumnNumberToName(0)
	if err != nil {
		return
	}
	if err = e.wb.MergeCell(e.sheetName, hCell, vCell); err != nil {
		return
	}
	if err = e.wb.SetCellStyle(e.sheetName, hCell, vCell, e.styleIds["title"]); err != nil {
		return
	}
	if err = e.wb.SetCellValue(e.sheetName, vCell, e.title); err != nil {
		return
	}
	e.rownum++
	return
}

// 写入数据到Sheet
func (e *Excel) writeSheet() (err error) {
	// 计算一页最大数据行（最大行 - title行 - 头行 -统计行）
	maxSheetDataRow := excelize.MaxColumns - 1
	if e.title != "" {
		maxSheetDataRow = maxSheetDataRow - 1
	}
	if !g.IsEmpty(e.statisticColIndexs) {
		maxSheetDataRow = maxSheetDataRow - 1
	}

	// 计算一个多个个Sheet
	sheetNo := math.Max(1, math.Ceil(float64(len(e.list)/maxSheetDataRow)))
	sheetIndex := 0
	// 最大列
	maxColName, err := excelize.ColumnNumberToName(len(e.metaList))
	if err != nil {
		return
	}
	for index := 0; index < int(sheetNo); index++ {
		e.rownum = 1
		// 创建sheet
		if index > 0 {
			if sheetIndex, err = e.wb.NewSheet(fmt.Sprintf("%s%d", e.sheetName, index)); err != nil {
				return
			}
		}
		if err = e.createTitle(); err != nil {
			return
		}

		e.wb.SetActiveSheet(sheetIndex)
		e.currSheetName = e.wb.GetSheetName(sheetIndex)

		// 计算一页最大行
		e.maxDataRowNum = maxSheetDataRow
		if !e.exportTemplate {
			e.maxDataRowNum = int(math.Min(float64((index+1)*maxSheetDataRow), float64(len(e.list))))
		}

		// 记录数据开始行(加上表头行)
		e.startDataRowNum = e.rownum + 1

		// 表头
		{
			column := 1
			for _, meta := range e.metaList {
				if err = e.createHeadCell(meta, e.rownum, column); err != nil {
					return
				}
				column += 1
			}
			if err = e.wb.SetRowHeight(e.currSheetName, e.rownum, 16); err != nil {
				return
			}
			// 冻结表头
			if err = e.wb.SetPanes(e.sheetName, &excelize.Panes{
				Freeze:      true,
				Split:       false,
				XSplit:      0,
				YSplit:      e.rownum,
				TopLeftCell: fmt.Sprintf("A%d", e.rownum),
				ActivePane:  "bottomLeft",
			}); err != nil {
				return
			}
			e.rownum += 1
		}

		// 导出操作填充数据(导出模板无需填充数据)
		if e.opType == OpTypeExport && !e.exportTemplate {
			// 填充数据
			for i := 0; i < e.maxDataRowNum; i++ {
				// 设置行高
				if err = e.wb.SetRowHeight(e.currSheetName, e.rownum, float64(e.maxHeight)); err != nil {
					return
				}
				// 获取行数据
				rowData := e.list[i]
				column := 1
				for _, meta := range e.metaList {
					if err = e.addCell(meta, rowData[meta.FieldName], e.rownum, column); err != nil {
						return
					}
					column += 1
				}
				e.rownum += 1
			}

			// 设置表格
			if err = e.wb.AddTable(e.sheetName, fmt.Sprintf("A1:%s%d", maxColName, e.rownum), nil); err != nil {
				return
			}

			e.addStatisticsRow()
		}
	}
	return
}

// 创建表头单元格
func (e *Excel) createHeadCell(meta *Meta, row, column int) (err error) {
	colName, err := excelize.ColumnNumberToName(column)
	if err != nil {
		return
	}
	cellName := fmt.Sprintf("%s%d", colName, row)
	if err = e.wb.SetCellValue(e.currSheetName, cellName, meta.Name); err != nil {
		return
	}
	styleKey := fmt.Sprintf("header_%s_%s", meta.HeaderColor, meta.HeaderBackgroundColor)
	if err = e.wb.SetCellStyle(e.currSheetName, cellName, cellName, e.styleIds[styleKey]); err != nil {
		return
	}
	// 设置宽度
	e.wb.SetColWidth(e.currSheetName, colName, colName, float64(meta.Width))
	if !g.IsEmpty(meta.Combo) {
		// 只能选择不能输入的列内容.
		dataValid := excelize.NewDataValidation(true)
		dataValid.SetSqref(fmt.Sprintf("%s%d:%s%d", colName, row+1, colName, e.maxDataRowNum+1))
		dataValid.SetDropList(gstr.Split(meta.Combo, meta.Separator))
		e.wb.AddDataValidation(e.currSheetName, dataValid)
	}

	return
}

// 添加单元格
func (e *Excel) addCell(meta *Meta, data interface{}, row, column int) (err error) {
	var colName string
	colName, err = excelize.ColumnNumberToName(column)
	if err != nil {
		return
	}
	cellName := fmt.Sprintf("%s%d", colName, row)
	styleId := fmt.Sprintf("data_%s_%s_%s", meta.Align, meta.Color, meta.BackgroundColor)
	if err = e.wb.SetCellStyle(e.currSheetName, cellName, cellName, e.styleIds[styleId]); err != nil {
		return
	}

	// 根据Excel中设置情况决定是否导出,有些情况需要保持为空,希望用户填写这一列.
	if !meta.IsExport {
		return
	}

	if data == nil {
		err = e.wb.SetCellValue(e.currSheetName, cellName, meta.DefaultValue)
		return
	}

	var value interface{}
	if meta.DateFormat != "" {
		value = convertByDate(data, meta.DateFormat)
	} else if meta.ReadConverterExp != "" {
		value = convertByExp(gconv.String(data), meta.ReadConverterExp, meta.Separator)
	} else if meta.DictType != "" {
		value = convertDictByExp(e.ctx, gconv.String(data), meta.DictType, meta.Separator)
	} else if meta.FormatHandler != nil {
		value, err = meta.FormatHandler(data, meta.Args)
	} else if meta.CellType == ColumnTypeString {
		cellValue := gconv.String(data)
		// 对于任何以表达式触发字符 =-+@开头的单元格，直接使用tab字符作为前缀，防止CSV注入。
		if gstr.ContainsAny(cellValue, FormulaStr) && strings.IndexAny(cellValue, FormulaStr) == 0 {
			cellValue = "\t$0" + cellValue[1:] + meta.Suffix
		}
		value = cellValue
	} else if meta.CellType == ColumnTypeNumeric {
		if gstr.Contains(gconv.String(data), ".") {
			value = gconv.Float64(data)
		} else {
			value = gconv.Int64(data)
		}
	} else if meta.CellType == ColumnTypeImage {
		// TODO 如果Excel里面有图片格式需要处理
		//imgPath := sysService.SysFile().GetAbsolutePath(gconv.String(data))
		//err = e.wb.AddPicture(e.currSheetName, cellName, imgPath, &excelize.GraphicOptions{})
		return
	}
	err = e.wb.SetCellValue(e.currSheetName, cellName, value)
	return
}

// 添加统计行
func (e *Excel) addStatisticsRow() (err error) {
	if len(e.statisticColIndexs) > 0 {
		var colName string
		colName, err = excelize.ColumnNumberToName(1)
		if err != nil {
			return
		}
		cellName := fmt.Sprintf("%s%d", colName, e.rownum)
		err = e.wb.SetCellValue(e.currSheetName, cellName, "合计")
		if err != nil {
			return
		}
		err = e.wb.SetCellStyle(e.currSheetName, cellName, cellName, e.styleIds["total"])
		if err != nil {
			return
		}

		for _, value := range e.statisticColIndexs {
			colName, err = excelize.ColumnNumberToName(value)
			if err != nil {
				return
			}
			cellName = fmt.Sprintf("%s%d", colName, e.rownum)
			if err = e.wb.SetCellStyle(e.currSheetName, cellName, cellName, e.styleIds["total"]); err != nil {
				return
			}
			formula := fmt.Sprintf("=SUM(%s%d:%s%d)", colName, e.startDataRowNum, colName, e.rownum-1)
			if err = e.wb.SetCellFormula(e.currSheetName, cellName, formula); err != nil {
				return
			}
		}
	}
	return
}
