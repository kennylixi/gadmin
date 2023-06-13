package dict_cache

import (
	"context"
	"github.com/gogf/gf/v2/frame/g"
	"github.com/gogf/gf/v2/text/gstr"
	"github.com/kennylixi/gadmin/internal/consts/cache_consts"
	"github.com/kennylixi/gadmin/internal/consts/user_consts"
	"github.com/kennylixi/gadmin/internal/modules/system/model/entity"
	"github.com/kennylixi/gadmin/internal/modules/system/service"
	"strings"
)

type sDictCache struct {
}

func init() {
	service.RegisterDictCache(New())
}

func New() *sDictCache {
	return &sDictCache{}
}

// LoadingDictCache 加载字典缓存数据
func (s *sDictCache) LoadingDictCache(ctx context.Context) error {
	list, err := service.DictData().All(ctx, user_consts.Normal)
	if err != nil {
		return err
	}
	var dictType string
	var dictDatas []*entity.DictData
	for _, data := range list {
		if data.DictType != dictType {
			if dictDatas != nil && len(dictDatas) > 0 {
				s.SetCache(ctx, dictType, dictDatas)
			}
			dictDatas = make([]*entity.DictData, 0, 5)
			dictType = data.DictType
		}
		dictDatas = append(dictDatas, data)
	}
	return nil
}

// ClearCache 清除缓存
func (s *sDictCache) ClearCache(ctx context.Context) error {
	return s.DelCache(ctx, "*")
}

// ResetCache 重置缓存
func (s *sDictCache) ResetCache(ctx context.Context) error {
	s.ClearCache(ctx)
	s.LoadingDictCache(ctx)
	return nil
}

// GetCacheKey 获取缓存key
func (s *sDictCache) GetCacheKey(ctx context.Context, dictType string) string {
	return cache_consts.SysDictKey + dictType
}

// DelCache 删除缓存
func (s *sDictCache) DelCache(ctx context.Context, dictType string) error {
	_, err := g.Redis().Del(ctx, s.GetCacheKey(ctx, dictType))
	return err
}

// SetCache 设置缓存
func (s *sDictCache) SetCache(ctx context.Context, dictType string, dictDatas []*entity.DictData) error {
	_, err := g.Redis().Set(ctx, s.GetCacheKey(ctx, dictType), dictDatas)
	return err
}

// GetCache 获取缓存
func (s *sDictCache) GetCache(ctx context.Context, dictType string) (dictDatas []*entity.DictData) {
	results, err := g.Redis().Get(ctx, s.GetCacheKey(ctx, dictType))
	if err != nil {
		g.Log().Error(ctx, err)
		return nil
	}
	err = results.Scan(&dictDatas)
	if err != nil {
		g.Log().Error(ctx, err)
		return nil
	}
	return dictDatas
}

// GetDictLabel 根据字典类型和字典值获取字典标签
//	@param dictType 字典类型
//	@param dictValue 字典值
//	@param separator 分隔符
//	@return 字典值
func (s *sDictCache) GetDictLabel(ctx context.Context, dictType, dictValue, separator string) string {
	datas := s.GetCache(ctx, dictType)
	// 获取所有Value
	dictValues := make(map[string]bool)
	if gstr.Contains(dictValue, separator) {
		for _, val := range gstr.Split(dictValue, separator) {
			dictValues[val] = true
		}
	} else {
		dictValues[dictValue] = true
	}

	var vals strings.Builder
	for _, data := range datas {
		if _, ok := dictValues[data.DictValue]; ok {
			vals.WriteString(data.DictLabel)
			vals.WriteString(separator)
		}
	}
	return gstr.TrimRight(vals.String(), separator)
}

// GetDictValue 根据字典类型和字典标签获取字典值
//	@param dictType 字典类型
//	@param dictLabel 字典标签
//	@param separator 分隔符
//	@return 字典值
func (s *sDictCache) GetDictValue(ctx context.Context, dictType, dictLabel, separator string) string {
	datas := s.GetCache(ctx, dictType)
	// 获取所有Label
	dictLabels := make(map[string]bool)
	if gstr.Contains(dictLabel, separator) {
		for _, lbl := range gstr.Split(dictLabel, separator) {
			dictLabels[lbl] = true
		}
	} else {
		dictLabels[dictLabel] = true
	}

	var vals strings.Builder
	for _, data := range datas {
		if _, ok := dictLabels[data.DictLabel]; ok {
			vals.WriteString(data.DictValue)
			vals.WriteString(separator)
		}
	}
	return gstr.TrimRight(vals.String(), separator)
}
