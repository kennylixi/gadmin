// ============================================================================
// This is auto-generated by gen tool only once. Fill this file as you wish.
// 渠道管理Logic层
// @author kennylixi
// @date 2023-03-27 08:32:42
// ============================================================================

package service

import (
	"context"
	"fmt"
	"github.com/gogf/gf/v2/encoding/gjson"
	"github.com/gogf/gf/v2/errors/gerror"
	"github.com/gogf/gf/v2/text/gstr"
	commonService "github.com/kennylixi/gadmin/internal/modules/common/service"
	"github.com/kennylixi/gadmin/internal/modules/system/dao"
	"github.com/kennylixi/gadmin/internal/modules/system/model"
	"github.com/kennylixi/gadmin/internal/modules/system/model/do"
	"github.com/kennylixi/gadmin/internal/modules/system/model/entity"
	"github.com/kennylixi/gadmin/internal/modules/system/service"
	"github.com/kennylixi/go-push"
	"sync"
)

// PushChannel 渠道管理管理服务
type sPushChannel struct {
}

func init() {
	service.RegisterPushChannel(New())
}

func New() *sPushChannel {
	return &sPushChannel{}
}

// 推送驱动存储器
var pushAdapterMap map[int64]push.Adapter
var pushAdapterMapRwm sync.RWMutex

// GetAdapter 获取指定渠道消息推送
func (s *sPushChannel) GetAdapter(ctx context.Context, channelId int64) (adapter push.Adapter, err error) {
	pushAdapterMapRwm.RLock()
	defer pushAdapterMapRwm.RUnlock()

	adapter, ok := pushAdapterMap[channelId]
	if !ok {
		err = gerror.Newf("推送驱动[%d]不存在")
	}
	return
}

// LoadAdapters 加载推送驱动
func (s *sPushChannel) LoadAdapters(ctx context.Context) error {
	pushAdapterMapRwm.Lock()
	defer pushAdapterMapRwm.Unlock()

	pushAdapterMap = make(map[int64]push.Adapter)
	channels, err := s.All(ctx)
	if err != nil {
		return err
	}
	for _, channelItem := range channels {
		if cfg := gstr.Trim(channelItem.Config); cfg != "" {
			cfgJson, err := gjson.DecodeToJson(cfg)
			if err != nil {
				return err
			}
			adapter, err := push.New(ctx, channelItem.TypeCode, cfgJson.Map())
			if err != nil {
				return gerror.Wrapf(err, "实例化推送驱动失败:%s[%d]", channelItem.Name, channelItem.Id)
			}
			pushAdapterMap[channelItem.Id] = adapter
		}
	}
	return nil
}

// SelectById 查询渠道管理信息
func (s *sPushChannel) SelectById(ctx context.Context, id int64) (channel *entity.PushChannel, err error) {
	err = dao.PushChannel.Ctx(ctx).Fields(&entity.PushChannel{}).Scan(&channel, dao.PushChannel.Columns().Id, id)
	if err != nil {
		return nil, err
	}
	if channel == nil {
		return nil, gerror.New("数据不存在")
	}

	return channel, nil
}

// GetTemplateParamsById 根据渠道ID获取参数模板
func (s *sPushChannel) GetTemplateParamsById(ctx context.Context, id int64) (params string, err error) {
	pushType := (*entity.PushType)(nil)
	err = dao.PushType.Ctx(ctx).As("t").
		RightJoin(dao.PushChannel.Table(), "c", fmt.Sprintf("t.%s=c.%s", dao.PushType.Columns().Id, dao.PushChannel.Columns().TypeId)).
		FieldsPrefix("t", &entity.PushType{}).
		WherePrefix("c", dao.PushChannel.Columns().Id, id).
		Scan(&pushType)
	if err != nil {
		return
	}
	if pushType != nil {
		params = pushType.TemplateParams
	}

	return
}

// SelectSimpleList 查询渠道管理列表
func (s *sPushChannel) SelectSimpleList(ctx context.Context, in *model.PushChannelSimpleListInput) (out model.PushChannelSimpleListOutput, err error) {
	m := dao.PushChannel.Ctx(ctx).As("c").
		LeftJoin(dao.PushType.Table(), "t", fmt.Sprintf("c.%s = t.%s", dao.PushChannel.Columns().TypeId, dao.PushType.Columns().Id))
	if name := gstr.Trim(in.Name); len(name) > 0 {
		m = m.WherePrefixLike("c", dao.PushChannel.Columns().Name, "%"+name+"%")
	}
	if status := gstr.Trim(in.Status); len(status) > 0 {
		m = m.WherePrefix("c", dao.PushChannel.Columns().Status, status)
	}
	if in.TypeId != 0 {
		m = m.Where("find_in_set(?, t.ancestors)", in.TypeId).
			WhereOrPrefix("c", dao.PushChannel.Columns().TypeId, in.TypeId)
	}

	err = m.Fields(
		fmt.Sprintf("c.%s as id,c.%s as name,t.%s as typeName",
			dao.PushChannel.Columns().Id,
			dao.PushChannel.Columns().Name,
			dao.PushType.Columns().Name),
	).Scan(&out)
	return
}

// SelectList 查询渠道管理列表
func (s *sPushChannel) SelectList(ctx context.Context, in *model.PushChannelListInput) (out *model.PushChannelListOutput, err error) {
	out = &model.PushChannelListOutput{}
	m := dao.PushChannel.Ctx(ctx).As("c").
		LeftJoin(dao.PushType.Table(), "t", fmt.Sprintf("c.%s = t.%s", dao.PushChannel.Columns().TypeId, dao.PushType.Columns().Id))
	if name := gstr.Trim(in.Name); len(name) > 0 {
		m = m.WherePrefixLike("c", dao.PushChannel.Columns().Name, "%"+name+"%")
	}
	if status := gstr.Trim(in.Status); len(status) > 0 {
		m = m.WherePrefix("c", dao.PushChannel.Columns().Status, status)
	}
	if in.TypeId != 0 {
		m = m.Where("find_in_set(?, t.ancestors)", in.TypeId).
			WhereOrPrefix("c", dao.PushChannel.Columns().TypeId, in.TypeId)
	}

	m = commonService.BizCtx().WhereBeginTime(ctx, dao.PushChannel.Columns().CreatedAt, m, "c")
	m = commonService.BizCtx().WhereEndTime(ctx, dao.PushChannel.Columns().CreatedAt, m, "c")
	out.Total, err = m.Count()
	if err != nil || out.Total == 0 {
		return
	}

	err = commonService.BizCtx().Page(ctx, m).
		Fields(fmt.Sprintf("t.%s as typeName, t.%s as typeStatus, t.%s as typeCode", dao.PushType.Columns().Name, dao.PushType.Columns().Status, dao.PushType.Columns().Code)).
		FieldsPrefix("c", &entity.PushChannel{}).
		Scan(&out.List)
	return
}

// All 获取所有渠道
func (s *sPushChannel) All(ctx context.Context) (list []*model.PushChannelListItem, err error) {
	m := dao.PushChannel.Ctx(ctx).As("c").
		LeftJoin(dao.PushType.Table(), "t", fmt.Sprintf("c.%s = t.%s", dao.PushChannel.Columns().TypeId, dao.PushType.Columns().Id))

	err = commonService.BizCtx().Page(ctx, m).
		Fields(fmt.Sprintf("t.%s as typeName, t.%s as typeStatus, t.%s as typeCode", dao.PushType.Columns().Name, dao.PushType.Columns().Status, dao.PushType.Columns().Code)).
		FieldsPrefix("c", &entity.PushChannel{}).
		Scan(&list)
	return
}

// Insert 新增渠道管理
func (s *sPushChannel) Insert(ctx context.Context, in *model.PushChannelAddInput) (err error) {
	if cfg := gstr.Trim(in.Config); cfg != "" {
		if _, err = gjson.Decode(in.Config); err != nil {
			err = gerror.Wrap(err, "渠道配置Json格式错误")
			return
		}
	}
	pushType, err := service.PushType().GetById(ctx, in.TypeId)
	if err != nil {
		return
	}
	if pushType == nil {
		err = gerror.New("消息类型不存在")
		return
	}
	_, err = dao.PushChannel.Ctx(ctx).InsertAndGetId(&do.PushChannel{
		Name:     in.Name,
		TypeId:   in.TypeId,
		Remark:   in.Remark,
		Status:   in.Status,
		Config:   in.Config,
		CreateBy: in.CreateBy,
	})
	return
}

// Update 修改渠道管理
func (s *sPushChannel) Update(ctx context.Context, in *model.PushChannelEditInput) (err error) {
	if cfg := gstr.Trim(in.Config); cfg != "" {
		if _, err = gjson.Decode(in.Config); err != nil {
			err = gerror.Wrap(err, "渠道配置Json格式错误")
			return
		}
	}
	pushType, err := service.PushType().GetById(ctx, in.TypeId)
	if err != nil {
		return
	}
	if pushType == nil {
		err = gerror.New("消息类型不存在")
		return
	}
	_, err = dao.PushChannel.Ctx(ctx).Update(&do.PushChannel{
		Id:       in.Id,
		Name:     in.Name,
		TypeId:   in.TypeId,
		Remark:   in.Remark,
		Status:   in.Status,
		Config:   in.Config,
		UpdateBy: in.UpdateBy,
	}, dao.PushChannel.Columns().Id, in.Id)
	return
}

// HasByChannelIds 判断渠道类型下面是否有渠道
func (s *sPushChannel) HasByChannelIds(ctx context.Context, typeIds ...int64) (has bool, err error) {
	count, err := dao.PushChannel.Ctx(ctx).WhereIn(dao.PushChannel.Columns().TypeId, typeIds).Count()
	if err != nil {
		err = gerror.Wrap(err, "系统错误")
		return
	}
	has = count > 0
	return
}

// DeleteByIds 批量删除渠道管理
func (s *sPushChannel) DeleteByIds(ctx context.Context, ids []int64) (err error) {
	// 检查是否有对应的渠道模板
	has, err := service.PushTemplate().HasByChannelIds(ctx, ids...)
	if err != nil {
		return
	}
	if has {
		err = gerror.New("请先删除对应渠道模板，再删除渠道")
		return
	}

	_, err = dao.PushChannel.Ctx(ctx).Where(dao.PushChannel.Columns().Id, ids).Delete()
	return
}
