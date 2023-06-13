package gen_table

import (
	"context"
	"fmt"
	"github.com/gogf/gf/v2/database/gdb"
	"github.com/gogf/gf/v2/encoding/gjson"
	"github.com/gogf/gf/v2/errors/gerror"
	"github.com/gogf/gf/v2/frame/g"
	"github.com/gogf/gf/v2/os/gfile"
	"github.com/gogf/gf/v2/os/gview"
	"github.com/gogf/gf/v2/text/gstr"
	"github.com/gogf/gf/v2/util/gconv"
	"github.com/gogf/gf/v2/util/grand"
	"github.com/kennylixi/gadmin/internal/consts/gen_consts"
	"github.com/kennylixi/gadmin/internal/modules/system/dao"
	"github.com/kennylixi/gadmin/internal/modules/system/model"
	"github.com/kennylixi/gadmin/internal/modules/system/model/entity"
	sysService "github.com/kennylixi/gadmin/internal/modules/system/service"
	"github.com/kennylixi/gadmin/utility/utils"
	"strings"
)

// GenTable 生产表管理服务
type sGenTable struct{}

func init() {
	sysService.RegisterGenTable(New())
}

func New() *sGenTable {
	return &sGenTable{}
}

var genCfg *genConfig

// 代码生成配置结构
type genConfig struct {
	Author         string //作者
	PackageName    string //生成包路径
	AutoRemovePre  bool   //自动去除表前缀，默认是false
	TablePrefix    string //表前缀(类名不会包含表前缀)
	TempDir        string //临时目录
	VueProjectPath string //前端项目绝对路径
}

// InitGenConfig 初始化配置
func (s *sGenTable) InitGenConfig(ctx context.Context) error {
	cfg, err := g.Config("gen").Get(ctx, "gen")
	if err != nil {
		return gerror.Wrap(err, "初始化代码生成模块配置错误")
	}
	genCfg = &genConfig{}
	if err = cfg.Scan(&genCfg); err != nil {
		return gerror.Wrap(err, "映射T代码生成模块配置错误")
	}
	return nil
}

// SelectGenTableById 查询业务信息
//	@param id 业务ID
//	@return 业务信息
func (s *sGenTable) SelectGenTableById(ctx context.Context, id int64) (genTable *model.GenTableItem, err error) {
	genTable, err = dao.GenTable.SelectGenTableById(ctx, id)
	if err != nil {
		err = gerror.Wrap(err, "获取业务信息失败")
		return
	}

	options := gjson.New(genTable.Table.Options)
	options.Scan(genTable)
	return
}

// SelectGenTableByName 查询表名称业务信息
//	@param tableName 表名称
//	@return 业务信息
func (s *sGenTable) SelectGenTableByName(ctx context.Context, tableName string) (genTable *model.GenTableItem, err error) {
	genTable, err = dao.GenTable.SelectGenTableByName(ctx, tableName)
	if err != nil {
		err = gerror.Wrap(err, "获取业务信息失败")
		return
	}

	options := gjson.New(genTable.Table.Options)
	options.Scan(genTable)
	return
}

// SelectGenTableList 查询业务列表
//	@param genTable 业务信息
//	@return 业务集合
func (s *sGenTable) SelectGenTableList(ctx context.Context, in *model.GenTableListInput) (out *model.GenTableListOutput, err error) {
	list, total, err := dao.GenTable.SelectGenTableList(ctx, &entity.GenTable{
		TableName:    in.TableName,
		TableComment: in.TableComment,
		CreateBy:     in.CreateBy,
	})
	if err != nil {
		return
	}
	out = &model.GenTableListOutput{
		List:  list,
		Total: total,
	}
	return
}

// SelectDbTableList 查询据库列表
//	@param genTable 业务信息
//	@return 数据库表集合
func (s *sGenTable) SelectDbTableList(ctx context.Context, in *model.GenTableDataListInput) (*model.GenTableDbTableOutput, error) {
	return dao.GenTable.SelectDbTableList(ctx, &entity.GenTable{
		TableName:    in.TableName,
		TableComment: in.TableComment,
	})
}

// SelectDbTableListByNames 查询据库列表
//	@param tableNames 表名称组
//	@return 数据库表集合
func (s *sGenTable) SelectDbTableListByNames(ctx context.Context, tableNames []string) ([]*entity.GenTable, error) {
	return dao.GenTable.SelectDbTableListByNames(ctx, tableNames)
}

// SelectGenTableAll 查询所有表信息
//	@return 表信息集合
func (s *sGenTable) SelectGenTableAll(ctx context.Context) ([]*model.GenTableItem, error) {
	return dao.GenTable.SelectGenTableAll(ctx)
}

// UpdateGenTable 修改业务
//	@param genTable 业务信息
//	@return 结果
func (s *sGenTable) UpdateGenTable(ctx context.Context, in *model.GenTableUpdateInput) error {
	genTable := (*entity.GenTable)(nil)
	if err := g.NewVar(in.Table).Struct(&genTable); err != nil {
		return err
	}

	if len(in.Params) > 0 {
		options, err := gjson.Encode(in.Params)
		if err != nil {
			return gerror.Wrap(err, "修改失败")
		}
		genTable.Options = gconv.String(options)
	}

	err := dao.GenTable.Transaction(ctx, func(ctx context.Context, tx gdb.TX) error {
		row, err := dao.GenTable.UpdateGenTable(ctx, genTable, tx)
		if err != nil {
			return err
		}
		if row > 0 {
			for _, column := range in.Columns {
				_, err := dao.GenTableColumn.UpdateGenTableColumn(ctx, column, tx)
				if err != nil {
					return err
				}
			}
		}
		return nil
	})
	if err != nil {
		return gerror.Wrap(err, "修改失败")
	}
	return nil
}

// DeleteGenTableByIds 删除业务对象
//	@param tableIds 需要删除的数据ID
//	@return 结果
func (s *sGenTable) DeleteGenTableByIds(ctx context.Context, tableIds []int64) error {
	err := dao.GenTable.Transaction(ctx, func(ctx context.Context, tx gdb.TX) error {
		_, err := dao.GenTable.DeleteGenTableByIds(ctx, tableIds, tx)
		if err != nil {
			return err
		}
		_, err = dao.GenTableColumn.DeleteGenTableColumnByIds(ctx, tableIds, tx)
		if err != nil {
			return err
		}
		return nil
	})
	if err != nil {
		return gerror.Wrap(err, "删除失败")
	}
	return nil
}

// ImportGenTable 导入表结构
//	@param tableList 导入表列表
func (s *sGenTable) ImportGenTable(ctx context.Context, tableList []*entity.GenTable, operName string) error {
	err := dao.GenTable.Transaction(ctx, func(ctx context.Context, tx gdb.TX) error {
		for _, table := range tableList {
			tableName := table.TableName
			initTable(table, operName)
			row, err := dao.GenTable.InsertGenTable(ctx, table, tx)
			if err != nil {
				return err
			}
			if row > 0 {
				// 保存列信息
				genTableColumns, err := dao.GenTableColumn.SelectDbTableColumnsByName(ctx, tableName)
				if err != nil {
					return nil
				}
				for _, column := range genTableColumns {
					initColumnField(column, table)
					_, err = dao.GenTableColumn.InsertGenTableColumn(ctx, column, tx)
					if err != nil {
						return nil
					}
				}
			}
		}
		return nil
	})
	if err != nil {
		return gerror.Wrap(err, "导入失败")
	}
	return nil
}

// SynchDb 同步数据库
//	@param tableName 表名称
func (s *sGenTable) SynchDb(ctx context.Context, tableName string) error {
	err := dao.GenTable.Transaction(ctx, func(ctx context.Context, tx gdb.TX) error {
		table, err := s.SelectGenTableByName(ctx, tableName)
		if err != nil {
			return err
		}
		tableColumns, err := dao.GenTableColumn.SelectGenTableColumnListByTableId(ctx, table.Table.TableId)
		if err != nil {
			return err
		}
		tableColumnNames := make([]string, 0, len(tableColumns))
		for _, column := range tableColumns {
			tableColumnNames = append(tableColumnNames, column.ColumnName)
		}

		dbTableColumns, err := dao.GenTableColumn.SelectDbTableColumnsByName(ctx, tableName)
		if err != nil {
			return err
		}
		if dbTableColumns == nil || len(dbTableColumns) <= 0 {
			return gerror.New("同步数据失败，原表结构不存在")
		}
		// 新增字段
		dbTableColumnNames := make([]string, 0, len(dbTableColumns))
		for _, column := range dbTableColumns {
			dbTableColumnNames = append(dbTableColumnNames, column.ColumnName)
		}

		for _, column := range dbTableColumns {
			if !gstr.InArray(tableColumnNames, column.ColumnName) {
				initColumnField(column, table.Table)
				_, err = dao.GenTableColumn.InsertGenTableColumn(ctx, column, tx)
				if err != nil {
					return err
				}
			}
		}
		// 删除字段
		delColumnIds := make([]int64, 0, len(tableColumns))
		for _, column := range tableColumns {
			if !gstr.InArray(dbTableColumnNames, column.ColumnName) {
				delColumnIds = append(delColumnIds, column.ColumnId)
			}
		}

		if len(delColumnIds) > 0 {
			_, err = dao.GenTableColumn.DeleteGenTableColumnsByIds(ctx, delColumnIds, tx)
			if err != nil {
				return err
			}
		}
		return nil
	})
	if err != nil {
		return gerror.Wrap(err, "同步数据失败")
	}
	return nil
}

// ValidateEdit 修改保存参数校验
//	@param genTable 业务信息
func (s *sGenTable) ValidateEdit(in *model.GenTableUpdateInput) (err error) {
	if gen_consts.TplTree == in.Table.TplCategory {
		err = gconv.Struct(in.Params, &in)
		if in.TreeCode == "" {
			err = gerror.New("树编码字段不能为空")
		} else if in.TreeParentCode == "" {
			err = gerror.New("树父编码字段不能为空")
		} else if in.TreeName == "" {
			gerror.New("树名称字段不能为空")
		} else if in.Table.TplCategory == gen_consts.TplSub {
			if in.Table.SubTableName == "" {
				gerror.New("关联子表的表名不能为空")
			} else if in.Table.SubTableFkName == "" {
				gerror.New("子表关联的外键名不能为空")
			}
		}
	}
	return
}

// PreviewCode 预览代码
//	@param tableId 表编号
//	@return 预览数据列表
func (s *sGenTable) PreviewCode(ctx context.Context, tableId int64) (dataMap map[string]string, err error) {
	// 查询表信息
	var table *model.GenTableItem
	table, err = s.SelectGenTableById(ctx, tableId)
	if err != nil {
		err = gerror.Wrap(err, "预览代码失败")
		return
	}
	dataMap, err = s.getGenCodeContent(ctx, table)
	if err != nil {
		err = gerror.Wrap(err, "预览代码失败")
		return
	}
	return
}

// 根据表生成代码
//	@param table 表信息
//	@return 预览数据列表
func (s *sGenTable) getGenCodeContent(ctx context.Context, table *model.GenTableItem) (dataMap map[string]string, err error) {
	// 设置主子表信息
	s.setSubTable(ctx, table)
	// 设置主键列信息
	s.setPkColumn(table)

	view := s.getViewEngine(getViewData(table))
	dataMap = make(map[string]string)
	// 获取模板列表
	templates := getTemplateList(table.Table.TplCategory)
	var content string
	for _, template := range templates {
		content, err = view.Parse(ctx, template)
		if err != nil {
			return
		}
		dataMap[template] = content
	}
	return
}

// DownloadCode 生成代码（下载方式）
//	@param tableName 表名称
//	@return 生成的文件路径
func (s *sGenTable) DownloadCode(ctx context.Context, tableNames []string) (genDir string, err error) {
	genDir = fmt.Sprintf("%s/%s", getTempDir(), grand.S(10))
	var table *model.GenTableItem
	var codeMap map[string]string
	for _, tableName := range tableNames {
		table, err = s.SelectGenTableByName(ctx, tableName)
		if err != nil {
			g.Log().Error(ctx, err)
			return
		}
		codeMap, err = s.getGenCodeContent(ctx, table)
		if err != nil {
			g.Log().Error(ctx, err)
			return
		}
		for template, content := range codeMap {
			path := fmt.Sprintf("%s/%s", genDir, s.getGenPath(table, template, false))
			if err = gfile.PutContents(path, content); err != nil {
				g.Log().Error(ctx, err)
				return
			}
		}
	}
	return
}

// GeneratorCode 生成代码（自定义路径）
//	@param tableName 表名称
func (s *sGenTable) GeneratorCode(ctx context.Context, tableName string) (err error) {
	// 查询表信息
	var table *model.GenTableItem
	table, err = s.SelectGenTableByName(ctx, tableName)
	if err != nil {
		err = gerror.Wrap(err, "生成代码失败")
		return
	}

	dataMap, err := s.getGenCodeContent(ctx, table)
	if err != nil {
		err = gerror.Wrap(err, "生成代码失败")
		return
	}

	for template, content := range dataMap {
		genPath := s.getGenPath(table, template, true)
		if err = gfile.PutContents(genPath, content); err != nil {
			err = gerror.Wrap(err, "生成代码失败")
			return
		}
		if err = goFmt(ctx, genPath); err != nil {
			return
		}
	}
	return
}

// 获取代码生成地址
//	@param table 业务表信息
//	@param template 模板文件路径
//	@param isGen 是否直接生成代码到指定目录
//	@return 生成地址
func (s *sGenTable) getGenPath(table *model.GenTableItem, template string, isGen bool) (path string) {
	var goPath, vuePath string

	if isGen {
		genPath := table.Table.GenPath
		if genPath == "/" {
			goPath = fmt.Sprintf("%s/", gfile.Pwd())
			vuePath = fmt.Sprintf("%s/src/", getVueProjectPath())
		} else {
			goPath = genPath + gfile.Separator
			vuePath = fmt.Sprintf("%s/vue/src/", genPath)
		}
	}

	fileName := getFileName(template, table, isGen)
	if gstr.HasSuffix(fileName, "go") {
		path = goPath + fileName
	} else if gstr.HasSuffix(fileName, "vue") {
		path = vuePath + fileName
	} else if gstr.HasSuffix(fileName, "js") {
		path = vuePath + fileName
	} else if gstr.HasSuffix(fileName, "sql") {
		path = goPath + "sql" + gfile.Separator + fileName
	}
	return
}

// 设置主键列信息
//	@param table 业务表信息
func (s *sGenTable) setPkColumn(table *model.GenTableItem) {
	for _, column := range table.Columns {
		if column.IsPk == gen_consts.Pk {
			table.PkColumn = column
			break
		}
	}
	if table.PkColumn == nil {
		table.PkColumn = table.Columns[0]
	}
	if gen_consts.TplSub == table.Table.TplCategory {
		for _, column := range table.SubTable.Columns {
			if column.IsPk == gen_consts.Pk {
				table.SubTable.PkColumn = column
				break
			}
		}
		if table.SubTable.PkColumn == nil {
			table.SubTable.PkColumn = table.SubTable.Columns[0]
		}
	}
}

// 设置主子表信息
//	@param table 业务表信息
func (s *sGenTable) setSubTable(ctx context.Context, table *model.GenTableItem) (err error) {
	subTableName := table.Table.SubTableName
	if len(subTableName) > 0 {
		table.SubTable, err = s.SelectGenTableByName(ctx, subTableName)
		if err != nil {
			err = gerror.Wrap(err, "设置主子表信息失败")
		}
	}
	return
}

// 获取模板引擎
func (s *sGenTable) getViewEngine(data g.Map) *gview.View {
	view := gview.New()
	view.BindFuncMap(g.Map{
		"add": func(a, b int) int {
			return a + b
		},
		"reduce": func(a, b int) int {
			return a - b
		},
		// 字段的注释截取0到第一个"（"之间的字符串，注意是中文"（"
		"comment": func(comment string) string {
			index := strings.Index(comment, "（")
			if index != -1 {
				comment = gstr.SubStr(comment, 0, index)
			}
			return comment
		},
		"capitalize": func(str string) string {
			return utils.Capitalize(str)
		},
		"uncapitalize": func(str string) string {
			return utils.UnCapitalize(str)
		},
		"hasHtmlType": func(columns []*entity.GenTableColumn, htmlType string) bool {
			for _, column := range columns {
				if column.IsInsert == "1" && column.IsPk != "1" && column.HtmlType == htmlType {
					return true
				}
			}
			return false
		},
		"hasHtmlAndQueryType": func(columns []*entity.GenTableColumn, htmlType string, queryType string) bool {
			for _, column := range columns {
				if column.HtmlType == htmlType && column.QueryType == queryType {
					return true
				}
			}
			return false
		},
		"isNumberType": func(vType string) bool {
			return vType == "uint" || vType == "uint8" || vType == "uint16" || vType == "uint32" || vType == "uint64" ||
				vType == "int" || vType == "int8" || vType == "int16" || vType == "int32" || vType == "int64" ||
				vType == "float32" || vType == "float64"
		},
		"doType": func(vType string) string {
			// 基础类型转换成 interface{}.
			if !gstr.HasPrefix(vType, "*") && !gstr.HasPrefix(vType, "[]") && !gstr.HasPrefix(vType, "map") {
				return "interface{}"
			}
			return vType
		},
	})
	view.SetConfigWithMap(g.Map{
		"Paths":      []string{"template"},
		"Delimiters": []string{"${", "}"},
		"Data":       data,
	})
	return view
}

// formatComment formats the comment string to fit the golang code without any lines.
func formatComment(comment string) string {
	comment = gstr.ReplaceByArray(comment, g.SliceStr{
		"\n", " ",
		"\r", " ",
	})
	comment = gstr.Replace(comment, `\n`, " ")
	comment = gstr.Trim(comment)
	return comment
}
