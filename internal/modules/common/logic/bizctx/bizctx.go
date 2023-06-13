package bizctx

import (
	"context"
	"github.com/gogf/gf/v2/database/gdb"
	"github.com/gogf/gf/v2/frame/g"
	"github.com/gogf/gf/v2/net/ghttp"
	"github.com/kennylixi/gadmin/internal/consts"
	"github.com/kennylixi/gadmin/internal/modules/common/model"
	commonService "github.com/kennylixi/gadmin/internal/modules/common/service"
)

type sBizCtx struct{}

func init() {
	commonService.RegisterBizCtx(New())
}

func New() *sBizCtx {
	return &sBizCtx{}
}

// Init 初始化上下文对象指针到上下文对象中，以便后续的请求流程中可以修改。
func (s *sBizCtx) Init(r *ghttp.Request, customCtx *model.Context) {
	r.SetCtxVar(consts.ContextKey, customCtx)
}

// Get 获得上下文变量，如果没有设置，那么返回nil
func (s *sBizCtx) Get(ctx context.Context) *model.Context {
	value := ctx.Value(consts.ContextKey)
	if value == nil {
		return nil
	}
	if localCtx, ok := value.(*model.Context); ok {
		return localCtx
	}
	return nil
}

// GetUser 将上下文信息设置到上下文请求中，注意是完整覆盖
func (s *sBizCtx) GetUser(ctx context.Context) *model.ContextUser {
	return s.Get(ctx).User
}

// SetUser 将上下文信息设置到上下文请求中，注意是完整覆盖
func (s *sBizCtx) SetUser(ctx context.Context, ctxUser *model.ContextUser) {
	s.Get(ctx).User = ctxUser
}

// GetUserId 获取用户ID
func (s *sBizCtx) GetUserId(ctx context.Context) int64 {
	return s.Get(ctx).User.UserId
}

// GetDeptId 获取部门ID
func (s *sBizCtx) GetDeptId(ctx context.Context) int64 {
	return s.Get(ctx).User.DeptId
}

// GetUserName 获取用户名
func (s *sBizCtx) GetUserName(ctx context.Context) string {
	if s.Get(ctx) != nil && s.Get(ctx).User != nil {
		return s.Get(ctx).User.UserName
	}
	return ""
}

// SetData 将上下文信息设置到上下文请求中，注意是完整覆盖
func (s *sBizCtx) SetData(ctx context.Context, data g.Map) {
	s.Get(ctx).Data = data
}

// SetScopeData 设置数据权限
func (s *sBizCtx) SetScopeData(ctx context.Context, scopeData string) {
	s.Get(ctx).ScopeData = scopeData
}

// ScopeData 数据权限
func (s *sBizCtx) ScopeData(ctx context.Context, model *gdb.Model) *gdb.Model {
	mctx := s.Get(ctx)
	if mctx != nil && len(mctx.ScopeData) > 0 {
		model = model.Where(mctx.ScopeData)
	}
	return model
}

// SetNoPage 设置不翻页
func (s *sBizCtx) SetNoPage(ctx context.Context) {
	mctx := s.Get(ctx)
	if mctx != nil && mctx.SearchParams != nil {
		mctx.SearchParams.PageSize = 0
	}
}

// Page 分页
func (s *sBizCtx) Page(ctx context.Context, model *gdb.Model) *gdb.Model {
	mctx := s.Get(ctx)
	if mctx != nil && mctx.SearchParams != nil && mctx.SearchParams.PageSize > 0 {
		model = mctx.SearchParams.Page(model)
	}
	return model
}

// OrderBy 排序
func (s *sBizCtx) OrderBy(ctx context.Context, model *gdb.Model, tablePrefix ...string) *gdb.Model {
	mctx := s.Get(ctx)
	if mctx != nil && mctx.SearchParams != nil {
		model = mctx.SearchParams.OrderBy(model, tablePrefix...)
	}
	return model
}

// WhereBeginTime 拼装时间sql语句
// @param columName 	字段名，sql字段名
// @param model			Model
// @param tablePrefix	表前缀
func (s *sBizCtx) WhereBeginTime(ctx context.Context, columName string, model *gdb.Model, tablePrefix ...string) *gdb.Model {
	mctx := s.Get(ctx)
	if mctx != nil && mctx.SearchParams != nil {
		model = mctx.SearchParams.WhereBeginTime(columName, model, tablePrefix...)
	}
	return model
}

// WhereEndTime 拼装时间sql语句
// @param columName 	字段名，sql字段名
// @param model			Model
// @param tablePrefix	表前缀
func (s *sBizCtx) WhereEndTime(ctx context.Context, columName string, model *gdb.Model, tablePrefix ...string) *gdb.Model {
	mctx := s.Get(ctx)
	if mctx != nil && mctx.SearchParams != nil {
		model = mctx.SearchParams.WhereEndTime(columName, model, tablePrefix...)
	}
	return model
}

// GetSearchParams 获取搜索参数
func (s *sBizCtx) GetSearchParams(ctx context.Context) *model.SearchParams {
	mctx := s.Get(ctx)
	if mctx != nil {
		return mctx.SearchParams
	}
	return nil
}
