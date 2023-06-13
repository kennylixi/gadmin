package poi

// FormatHandler 数据格式处理方法定义
//	@param value 单元格数据值
//	@param args excel注解args参数组
//	@return 处理后的值
type FormatHandler func(value interface{}, args []string) (result string, err error)

// OpType 导入导出类型
type OpType int

const (
	OpTypeAll    OpType = iota // 导入导出
	OpTypeExport               // 导出
	OpTypeImport               // 导入
)

// ColumnType 数据类型
type ColumnType int

const (
	ColumnTypeNumeric ColumnType = iota // 数字
	ColumnTypeString                    // 字符串
	ColumnTypeImage                     // 图片
)

// HAlign 水平对齐方式
type HAlign string

const (
	HAlignLeft             = "left"             // 向左（缩进）
	HAlignCenter           = "center"           // 居中
	HAlignRight            = "right"            // 靠右（缩进）
	HAlignFill             = "fill"             // 填充
	HAlignJustify          = "justify"          // 两端对齐
	HAlignCenterContinuous = "centerContinuous" // 跨列居中
	HAlignDistributed      = "distributed"      // 分散对齐（缩进）
)

// VAlign 垂直对齐方式
type VAlign string

const (
	VAlignTop         = "top"         // 顶端对齐
	VAlignCenter      = "center"      // 居中
	VAlignJustify     = "justify"     // 两端对齐
	VAlignDistributed = "distributed" // 分散对齐
)

// BorderType 边框类型
type BorderType string

const (
	BorderTypeLeft         = "left"         // 左侧边框
	BorderTypeTop          = "top"          // 顶部边框
	BorderTypeRight        = "right"        // 右侧边框
	BorderTypeBottom       = "bottom"       // 底部边框
	BorderTypeDiagonalDown = "diagonalDown" // 对角线向下
	BorderTypeDiagonalUp   = "diagonalUp"   // 对角线向上
)
