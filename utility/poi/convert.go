package poi

import (
	"context"
	"github.com/gogf/gf/v2/os/gtime"
	"github.com/gogf/gf/v2/text/gstr"
	"github.com/gogf/gf/v2/util/gconv"
	sysService "github.com/kennylixi/gadmin/internal/modules/system/service"
	"time"
)

// 解析日期
//	@param value 参数值
//	@param dateFormat 日期格式
//	@return 解析后值
func convertByDate(value interface{}, dateFormat string) string {
	if value == nil {
		return ""
	}
	if v, ok := value.(*gtime.Time); ok {
		return v.Format(dateFormat)
	}
	if v, ok := value.(gtime.Time); ok {
		return v.Format(dateFormat)
	}
	if t, ok := value.(time.Time); ok {
		return gtime.New(t).Format(dateFormat)
	}
	if t, ok := value.(*time.Time); ok {
		return gtime.New(t).Format(dateFormat)
	}
	if num := gconv.Int64(value); num > 0 {
		return gtime.NewFromTimeStamp(num).Format(dateFormat)
	}
	return gconv.String(value)
}

// 解析导出值 0=男,1=女,2=未知
//	@param value 参数值
//	@param converterExp 翻译注解
//	@param separator 分隔符
//	@return 解析后值
func convertByExp(value string, converterExp, separator string) string {
	valueItems := gstr.Split(value, separator)
	strs := make([]string, 0, len(valueItems))
	convertSource := gstr.Split(converterExp, ",")
	for _, s := range convertSource {
		items := gstr.Split(s, "=")
		if gstr.InArray(valueItems, items[0]) {
			strs = append(strs, items[1])
		} else {
			if items[0] == value {
				return items[1]
			}
		}
	}
	return gstr.Join(strs, separator)
}

// 反向解析值 男=0,女=1,未知=2
//	@param value 参数值
//	@param converterExp 翻译注解
//	@param separator 分隔符
//	@return 解析后值
func reverseByExp(value string, converterExp, separator string) string {
	valueItems := gstr.Split(value, separator)
	strs := make([]string, 0, len(valueItems))
	convertSource := gstr.Split(converterExp, ",")
	for _, s := range convertSource {
		items := gstr.Split(s, "=")
		if gstr.InArray(valueItems, items[1]) {
			strs = append(strs, items[0])
		} else {
			if items[1] == value {
				return items[0]
			}
		}
	}
	return gstr.Join(strs, separator)
}

// 解析字典值
//	@param dictValue 字典值
//	@param dictType 字典类型
//	@param separator 分隔符
//	@return 字典标签
func convertDictByExp(ctx context.Context, dictValue, dictType, separator string) string {
	return sysService.DictCache().GetDictLabel(ctx, dictType, dictValue, separator)
}

// 反向解析值字典值
//	@param dictLabel 字典标签
//	@param dictType 字典类型
//	@param separator 分隔符
//	@return 字典标签
func reverseDictByExp(ctx context.Context, dictLabel, dictType, separator string) string {
	return sysService.DictCache().GetDictValue(ctx, dictType, dictLabel, separator)
}
