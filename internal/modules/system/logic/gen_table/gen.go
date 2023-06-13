package gen_table

import (
	"context"
	"fmt"
	"github.com/gogf/gf/v2/container/gset"
	"github.com/gogf/gf/v2/encoding/gjson"
	"github.com/gogf/gf/v2/errors/gerror"
	"github.com/gogf/gf/v2/frame/g"
	"github.com/gogf/gf/v2/os/gfile"
	"github.com/gogf/gf/v2/os/gtime"
	"github.com/gogf/gf/v2/text/gstr"
	"github.com/gogf/gf/v2/util/gconv"
	"github.com/kennylixi/gadmin/internal/consts/gen_consts"
	"github.com/kennylixi/gadmin/internal/modules/system/model"
	"github.com/kennylixi/gadmin/internal/modules/system/model/entity"
	"github.com/kennylixi/gadmin/utility/utils"
	"golang.org/x/tools/imports"
	"strings"
)

// 获取代码生成临时目录
func getTempDir() string {
	return genCfg.TempDir
}

// 获取前端项目绝对路径
func getVueProjectPath() string {
	return genCfg.VueProjectPath
}

// 初始化表信息
func initTable(genTable *entity.GenTable, operName string) {
	startIndex := strings.Index(genTable.TableName, "_")
	businessName := gstr.SubStr(genTable.TableName, startIndex+1)
	// 表前缀作模块名称
	moduleName := gstr.SubStr(genTable.TableName, 0, startIndex)

	genTable.PackageName = genCfg.PackageName
	genTable.ModuleName = getModuleName(moduleName)
	genTable.BusinessName = gstr.CaseCamelLower(businessName)
	genTable.ClassName = convertClassName(genTable.TableName)
	genTable.FunctionName = strings.ReplaceAll(genTable.TableComment, "(?:表)", "")
	genTable.FunctionAuthor = genCfg.Author
	genTable.CreateBy = operName
	if len(genTable.GenType) == 0 {
		genTable.GenType = "0"
	}
	if len(genTable.GenPath) == 0 {
		genTable.GenPath = "/"
	}
	if len(genTable.TplCategory) == 0 {
		genTable.TplCategory = gen_consts.TplCurd
	}
}

// 初始化列属性字段
func initColumnField(column *entity.GenTableColumn, table *entity.GenTable) {
	columnType := column.ColumnType
	dataType := getDbType(columnType)
	columnName := column.ColumnName
	column.TableId = table.TableId
	column.CreateBy = table.CreateBy
	// 注释格式化
	if column.ColumnComment != "" {
		column.ColumnComment = formatComment(column.ColumnComment)
	}
	// 设置GO字段名
	column.GoField = gstr.CaseCamel(columnName)
	// 设置默认类型
	column.GoType = gen_consts.TypeString

	if gstr.InArray(gen_consts.ColumntypeStr, dataType) || gstr.InArray(gen_consts.ColumntypeText, dataType) {
		// 字符串长度超过500设置为文本域
		columnLength := getColumnLength(columnType)
		htmlType := gen_consts.HtmlInput
		if columnLength >= 500 || gstr.InArray(gen_consts.ColumntypeText, dataType) {
			htmlType = gen_consts.HtmlTextarea
		}
		column.HtmlType = htmlType
	} else if gstr.InArray(gen_consts.ColumntypeTime, dataType) {
		column.GoType = gen_consts.TypeTime
		column.HtmlType = gen_consts.HtmlDatetime
	} else if gstr.InArray(gen_consts.ColumntypeNumberFloat, dataType) {
		column.HtmlType = gen_consts.HtmlInput
		column.GoType = gen_consts.TypeFloat
	} else if gstr.InArray(gen_consts.ColumntypeNumberInt, dataType) {
		column.HtmlType = gen_consts.HtmlInput
		if gstr.ContainsI(columnType, gen_consts.Unsigned) {
			column.GoType = gen_consts.TypeUint
		} else {
			column.GoType = gen_consts.TypeInt
		}
	} else if gstr.InArray(gen_consts.ColumntypeNumberInt64, dataType) {
		column.HtmlType = gen_consts.HtmlInput
		if gstr.ContainsI(columnType, gen_consts.Unsigned) {
			column.GoType = gen_consts.TypeUint64
		} else {
			column.GoType = gen_consts.TypeInt64
		}
	} else if gstr.InArray(gen_consts.ColumntypeJson, dataType) {
		column.HtmlType = gen_consts.HtmlInput
		column.GoType = gen_consts.TypeJson
	}

	// 插入字段
	if !gstr.InArray(gen_consts.ColumnnameNotInsert, columnName) && column.IsPk != gen_consts.Pk {
		column.IsInsert = gen_consts.Require
	}
	// 编辑字段
	if !gstr.InArray(gen_consts.ColumnnameNotEdit, columnName) && column.IsPk != gen_consts.Pk {
		column.IsEdit = gen_consts.Require
	}
	// 列表字段
	if !gstr.InArray(gen_consts.ColumnnameNotList, columnName) && column.IsPk != gen_consts.Pk {
		column.IsList = gen_consts.Require
	}
	// 查询字段
	if !gstr.InArray(gen_consts.ColumnnameNotQuery, columnName) && column.IsPk != gen_consts.Pk {
		column.IsQuery = gen_consts.Require
	}

	lowerColumnName := gstr.ToLower(columnName)

	// 查询字段类型
	if gstr.HasSuffix(lowerColumnName, "name") {
		column.QueryType = gen_consts.QueryLike
	}
	// 状态字段设置单选框
	if gstr.HasSuffix(lowerColumnName, "status") {
		column.HtmlType = gen_consts.HtmlRadio
	} else if gstr.HasSuffix(lowerColumnName, "type") || gstr.HasSuffix(lowerColumnName, "sex") {
		// 类型&性别字段设置下拉框
		column.HtmlType = gen_consts.HtmlSelect
	} else if gstr.HasSuffix(lowerColumnName, "image") {
		// 图片字段设置图片上传控件
		column.HtmlType = gen_consts.HtmlImageUpload
	} else if gstr.HasSuffix(lowerColumnName, "file") {
		// 文件字段设置文件上传控件
		column.HtmlType = gen_consts.HtmlFileUpload
	} else if gstr.HasSuffix(lowerColumnName, "content") {
		// 内容字段设置富文本控件
		column.HtmlType = gen_consts.HtmlEditor
	}
}

// 获取模块名
//	@param packageName 包名
//	@return 模块名
func getModuleName(packageName string) string {
	lastIndex := strings.LastIndex(packageName, ".")
	nameLength := len(packageName)
	moduleName := gstr.SubStr(packageName, lastIndex+1, nameLength)
	return moduleName
}

// 表名转换成go类名
//	@param tableName 表名称
//	@return 类名
func convertClassName(tableName string) string {
	autoRemovePre := genCfg.AutoRemovePre
	tablePrefix := genCfg.TablePrefix
	if autoRemovePre && tablePrefix != "" {
		searchList := strings.Split(tablePrefix, ",")
		for _, searchString := range searchList {
			if strings.Index(tableName, searchString) == 0 {
				tableName = strings.Replace(tableName, searchString, "", 1)
				break
			}
		}
	}
	return gstr.CaseCamel(tableName)
}

// 获取数据库类型字段
//	@param columnType 列类型
//	@return 截取后的列类型
func getDbType(columnType string) string {
	index := strings.Index(columnType, "(")
	if index > 0 {
		return gstr.SubStr(columnType, 0, index)
	} else {
		return columnType
	}
}

// 获取字段长度
//	@param columnType 列类型
//	@return 截取后的列类型
func getColumnLength(columnType string) int {
	startIndex := strings.Index(columnType, "(")
	endIndex := strings.Index(columnType, ")")
	if startIndex > 0 && endIndex > 0 {
		length := gstr.SubStr(columnType, startIndex+1, endIndex-1)
		return gconv.Int(length)
	} else {
		return 0
	}
}

// 获取模板信息
//	@return 模板列表
func getTemplateList(tplCategory string) (templates []string) {
	templates = append(templates, "vm/go/api.go.vm")
	templates = append(templates, "vm/go/dao.go.vm")
	templates = append(templates, "vm/go/dao_internal.go.vm")
	templates = append(templates, "vm/go/controller.go.vm")
	templates = append(templates, "vm/go/model.go.vm")
	templates = append(templates, "vm/go/entity.go.vm")
	templates = append(templates, "vm/go/do.go.vm")
	templates = append(templates, "vm/go/logic.go.vm")
	templates = append(templates, "vm/go/service.go.vm")
	templates = append(templates, "vm/js/api.js.vm")
	templates = append(templates, "vm/sql/sql.vm")

	switch tplCategory {
	case gen_consts.TplCurd:
		templates = append(templates, "vm/vue/index.vue.vm")
	case gen_consts.TplTree:
		templates = append(templates, "vm/vue/index-tree.vue.vm")
	case gen_consts.TplSub:
		templates = append(templates, "vm/vue/index.vue.vm")
	}
	return
}

// 获取文件名
//	@param template	模板名
//	@param genTable	表数据
//	@param isGen	是否直接生成代码
//	@return 文件名
func getFileName(template string, genTable *model.GenTableItem, isGen bool) (fileName string) {
	// 模块名
	moduleName := genTable.Table.ModuleName
	// 大写类名
	//className := gstr.ToLower(gstr.CaseDelimited(genTable.Table.ClassName, '_'))
	// 业务名称
	businessName := genTable.Table.BusinessName

	goFileName := gstr.CaseSnake(genTable.Table.ClassName)
	vuePath := "vue/"
	if isGen {
		vuePath = ""
	}

	if gstr.Contains(template, "model.go.vm") {
		fileName = fmt.Sprintf("internal/modules/%s/model/%s.go", moduleName, goFileName)
	} else if gstr.Contains(template, "do.go.vm") {
		fileName = fmt.Sprintf("internal/modules/%s/model/do/%s.go", moduleName, goFileName)
	} else if gstr.Contains(template, "entity.go.vm") {
		fileName = fmt.Sprintf("internal/modules/%s/model/entity/%s.go", moduleName, goFileName)
	} else if gstr.Contains(template, "dao.go.vm") {
		fileName = fmt.Sprintf("internal/modules/%s/dao/%s.go", moduleName, goFileName)
	} else if gstr.Contains(template, "dao_internal.go.vm") {
		fileName = fmt.Sprintf("internal/modules/%s/dao/internal/%s.go", moduleName, goFileName)
	} else if gstr.Contains(template, "service.go.vm") {
		fileName = fmt.Sprintf("internal/modules/%s/service/%s.go", moduleName, goFileName)
	} else if gstr.Contains(template, "api.go.vm") {
		fileName = fmt.Sprintf("internal/modules/%s/api/v1/admin/%s.go", moduleName, goFileName)
	} else if gstr.Contains(template, "logic.go.vm") {
		fileName = fmt.Sprintf("internal/modules/%s/logic/%s/%s.go", moduleName, goFileName, goFileName)
	} else if gstr.Contains(template, "controller.go.vm") {
		fileName = fmt.Sprintf("internal/modules/%s/controller/admin/%s.go", moduleName, goFileName)
	} else if gstr.Contains(template, "sql.vm") {
		fileName = "sql/" + businessName + "Menu.sql"
	} else if gstr.Contains(template, "api.js.vm") {
		fileName = fmt.Sprintf("%sapi/%s/%s.js", vuePath, moduleName, businessName)
	} else if gstr.Contains(template, "index.vue.vm") {
		fileName = fmt.Sprintf("%sviews/%s/%s/index.vue", vuePath, moduleName, businessName)
	} else if gstr.Contains(template, "index-tree.vue.vm") {
		fileName = fmt.Sprintf("%sviews/%s/%s/index.vue", vuePath, moduleName, businessName)
	}
	return
}

// 设置模板变量信息
func getViewData(tableItem *model.GenTableItem) g.Map {
	data := make(g.Map)
	genTable := tableItem.Table
	options := gjson.New(genTable.Options)
	moduleName := genTable.ModuleName
	businessName := genTable.BusinessName
	packageName := genTable.PackageName
	tplCategory := genTable.TplCategory
	functionName := genTable.FunctionName

	data["tplCategory"] = tplCategory
	data["tableName"] = genTable.TableName
	data["functionName"] = functionName
	data["ClassName"] = genTable.ClassName
	data["className"] = utils.UnCapitalize(genTable.ClassName)
	data["moduleName"] = genTable.ModuleName
	data["BusinessName"] = gstr.CaseCamel(genTable.BusinessName)
	data["businessName"] = genTable.BusinessName
	data["packageName"] = packageName
	data["author"] = genTable.FunctionAuthor
	data["datetime"] = gtime.Datetime()
	data["pkColumn"] = tableItem.PkColumn
	data["importList"] = make([]string, 0) //getImportList(genTable)
	data["permissionPrefix"] = fmt.Sprintf("%s:%s", moduleName, businessName)
	data["columns"] = tableItem.Columns
	data["table"] = genTable
	data["parentMenuId"] = tableItem.ParentMenuId
	data["dicts"] = getDicts(tableItem)
	if gen_consts.TplTree == tplCategory {
		treeName := options.Get(gen_consts.TreeName).String()
		data["treeCode"] = gstr.CaseCamelLower(options.Get(gen_consts.TreeCode).String())
		data["treeParentCode"] = gstr.CaseCamelLower(options.Get(gen_consts.TreeParentCode).String())
		data["treeName"] = gstr.CaseCamelLower(treeName)
		data["expandColumn"] = getExpandColumn(treeName, tableItem.Columns)
		data["tree_parent_code"] = options.Get(gen_consts.TreeParentCode).String()
		data["tree_name"] = treeName
	}
	data["isSub"] = gen_consts.TplSub == tplCategory
	if gen_consts.TplSub == tplCategory {
		subTableItem := tableItem.SubTable
		subTable := subTableItem.Table
		subTableName := genTable.SubTableName
		subTableFkName := genTable.SubTableFkName
		subClassName := subTable.ClassName
		subTableFkClassName := gstr.CaseCamel(subTableFkName)

		data["subTable"] = subTable
		data["subTableName"] = subTableName
		data["subTableFkName"] = subTableFkName
		data["subTableFkClassName"] = subTableFkClassName
		data["subTableFkclassName"] = utils.UnCapitalize(subTableFkClassName)
		data["subClassName"] = subClassName
		data["subclassName"] = utils.UnCapitalize(subClassName)
		data["subImportList"] = make([]string, 0) //getImportList(subTable)
		data["subColumns"] = subTableItem.Columns
	}
	return data
}

// 根据列类型获取字典组
func getDicts(tableItem *model.GenTableItem) string {
	dicts := gset.Set{}
	addDicts(&dicts, tableItem.Columns)
	if tableItem.SubTable != nil {
		addDicts(&dicts, tableItem.SubTable.Columns)
	}
	return dicts.Join(",")
}

// 添加字典列表
func addDicts(dicts *gset.Set, columns []*entity.GenTableColumn) {
	for _, column := range columns {
		if column.DictType != "" && (column.HtmlType == gen_consts.HtmlSelect || column.HtmlType == gen_consts.HtmlRadio || column.HtmlType == gen_consts.HtmlCheckbox) {
			dicts.Add(fmt.Sprintf("'%s'", column.DictType))
		}
	}
}

// 获取需要在哪一列上面显示展开按钮
//	@param treeName 树节点字段名
//	@param columns  字段列表
//	@return 展开按钮列序号
func getExpandColumn(treeName string, columns []*entity.GenTableColumn) (num int) {
	for _, column := range columns {
		if column.IsList == "1" {
			num++
		}
		if column.ColumnName == treeName {
			break
		}
	}
	return
}

// goFmt formats the source file and adds or removes import statements as necessary.
func goFmt(ctx context.Context, path string) (err error) {
	replaceFunc := func(path, content string) string {
		res, err := imports.Process(path, []byte(content), nil)
		if err != nil {
			g.Log().Errorf(ctx, `error format "%s" go files: %v`, path, err)
			return content
		}
		return string(res)
	}

	if gfile.IsFile(path) {
		// File format.
		if gfile.ExtName(path) != "go" {
			return
		}
		err = gfile.ReplaceFileFunc(replaceFunc, path)
	} else {
		// Folder format.
		err = gfile.ReplaceDirFunc(replaceFunc, path, "*.go", true)
	}
	if err != nil {
		g.Log().Errorf(ctx, `error format "%s" go files: %v`, path, err)
		err = gerror.Wrap(err, "格式化代码错误")
	}
	return
}
