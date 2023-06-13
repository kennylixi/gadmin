package poi

import (
	"github.com/gogf/gf/v2/container/gvar"
	"github.com/gogf/gf/v2/text/gstr"
	"reflect"
)

// NewMeta 实例化Meta
func NewMeta() *Meta {
	return &Meta{
		Height:                16,
		Width:                 14,
		IsExport:              true,
		CellType:              ColumnTypeString,
		HeaderBackgroundColor: "#808080",
		HeaderColor:           "#FFFFFF",
		BackgroundColor:       "#FFFFFF",
		Color:                 "#040404",
		Align:                 HAlignCenter,
		Args:                  []string{},
		Separator:             ",",
		OpType:                OpTypeAll,
	}
}

// Meta 定义
type Meta struct {
	Name                  string        // 导出到Excel中的名字.
	DateFormat            string        // 日期格式, 如: yyyy-MM-dd
	DictType              string        // 如果是字典类型，请设置字典的type值 (如: sys_user_sex)
	ReadConverterExp      string        // 读取内容转表达式 (如: 0=男,1=女,2=未知)
	Separator             string        // 分隔符，读取字符串组内容
	Height                int           // 导出时在excel中每个列的高度 单位为字符
	Width                 int           // 导出时在excel中每个列的宽 单位为字符
	Suffix                string        // 文字后缀,如% 90 变成90%
	DefaultValue          string        // 当值为空时,字段的默认值
	Combo                 string        // 设置只能选择不能输入的列内容. (如: 第一项,第二项)
	IsExport              bool          // 是否导出数据,应对需求:有时我们需要导出一份模板,这是标题需要但内容需要用户手工填写.
	FieldName             string        // 属性名称,支持多级获取,以小数点隔开
	IsStatistics          bool          // 是否自动统计数据,在最后追加一行统计数据总和
	CellType              ColumnType    // 导出类型（0数字 1字符串 2图片）
	HeaderBackgroundColor string        // 导出列头背景色
	HeaderColor           string        // 导出列头字体颜色
	BackgroundColor       string        // 导出单元格背景色
	Color                 string        // 导出单元格字体颜色
	Align                 HAlign        // 导出字段对齐方式
	FormatHandler         FormatHandler // 自定义数据处理器
	Args                  []string      // 自定义数据处理器参数
	OpType                OpType        // 字段类型（0：导出导入；1：仅导出；2：仅导入）
}

const (
	cTag       = "meta"      // tag标记
	cField     = ";"         // 字段分隔符
	cValue     = "|"         // 名字和值的分隔符
	cFieldName = "fieldName" // 字段名
)

// 解析meta
func parserMeta(v interface{}) (metaList []*Meta, err error) {
	elem := reflect.TypeOf(v).Elem()
	fieldLen := elem.NumField()
	metaList = make([]*Meta, 0, fieldLen)
	for i := 0; i < fieldLen; i++ {
		field := elem.Field(i)
		tag, ok := field.Tag.Lookup(cTag)
		if !ok {
			continue
		}

		metaMap := make(map[string]interface{})
		metaMap[cFieldName] = gstr.CaseCamelLower(field.Name)
		fields := gstr.Split(tag, cField)
		for _, f := range fields {
			if gstr.Contains(f, cValue) {
				kv := gstr.Split(f, cValue)
				metaMap[kv[0]] = kv[1]
			} else {
				metaMap[f] = true
			}
		}

		meta := NewMeta()
		if err = gvar.New(metaMap).Scan(&meta); err != nil {
			return
		}
		metaList = append(metaList, meta)
	}
	return
}
