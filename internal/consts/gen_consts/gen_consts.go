package gen_consts

import "github.com/gogf/gf/v2/frame/g"

// 代码生成通用常量

const (
	TplCurd         = "crud"           //单表（增删改查）
	TplTree         = "tree"           //树表（增删改查）
	TplSub          = "sub"            //主子表（增删改查）
	TreeCode        = "treeCode"       //树编码字段
	TreeParentCode  = "treeParentCode" //树父编码字段
	TreeName        = "treeName"       //树名称字段
	ParentMenuId    = "parentMenuId"   //上级菜单ID字段
	ParentMenuName  = "parentMenuName" //上级菜单名称字段
	HtmlInput       = "input"          //文本框
	HtmlTextarea    = "textarea"       //文本域
	HtmlSelect      = "select"         //下拉框
	HtmlRadio       = "radio"          //单选框
	HtmlCheckbox    = "checkbox"       //复选框
	HtmlDatetime    = "datetime"       //日期控件
	HtmlImageUpload = "imageUpload"    //图片上传控件
	HtmlFileUpload  = "fileUpload"     //文件上传控件
	HtmlEditor      = "editor"         //富文本控件

	TypeString = "string"      //字符串类型
	TypeUint   = "uint"        //整型
	TypeInt    = "int"         //整型
	TypeUint64 = "uint64"      //长整型
	TypeInt64  = "int64"       //长整型
	TypeFloat  = "float64"     //浮点型
	TypeTime   = "*gtime.Time" //时间类型
	TypeJson   = "*gjson.Json" //JSON类型
	QueryLike  = "LIKE"        //模糊查询
	Require    = "1"           //需要
	Pk         = "1"           //主键

	Unsigned = "unsigned" //无符号
)

var (
	ColumntypeStr         = g.ArrayStr{"char", "varchar", "nvarchar", "varchar2"}                                                                     //数据库字符串类型
	ColumntypeText        = g.ArrayStr{"tinytext", "text", "mediumtext", "longtext"}                                                                  //数据库文本类型
	ColumntypeTime        = g.ArrayStr{"datetime", "time", "date", "timestamp"}                                                                       //数据库时间类型
	ColumntypeJson        = g.ArrayStr{"json", "jsonb"}                                                                                               //数据库json类型
	ColumntypeNumber      = g.ArrayStr{"tinyint", "smallint", "mediumint", "int", "number", "integer", "bit", "bigint", "float", "double", "decimal"} //数据库数字类型
	ColumntypeNumberInt   = g.ArrayStr{"tinyint", "smallint", "mediumint", "int", "number", "integer", "bit"}                                         //数据库数字类型
	ColumntypeNumberFloat = g.ArrayStr{"float", "double", "decimal"}                                                                                  //数据库数字(小数)类型
	ColumntypeNumberInt64 = g.ArrayStr{"bigint"}                                                                                                      //数据库数字类型
	ColumnnameNotInsert   = g.ArrayStr{"create_by", "created_at", "deleted_at", "update_by", "updated_at"}                                            //页面不需要插入字段
	ColumnnameNotEdit     = g.ArrayStr{"id", "create_by", "created_at", "deleted_at", "update_by", "updated_at"}                                      //页面不需要编辑字段
	ColumnnameNotList     = g.ArrayStr{"id", "create_by", "created_at", "deleted_at", "update_by", "updated_at"}                                      //页面不需要显示的列表字段
	ColumnnameNotQuery    = g.ArrayStr{"id", "create_by", "created_at", "deleted_at", "update_by", "updated_at", "remark"}                            //页面不需要查询字段
	BaseEntity            = g.ArrayStr{"createBy", "createdAt", "updateBy", "updatedAt", "remark"}                                                    //Entity基类字段
	TreeEntity            = g.ArrayStr{"parentName", "parentId", "orderNum", "ancestors", "children"}                                                 //Tree基类字段
)
