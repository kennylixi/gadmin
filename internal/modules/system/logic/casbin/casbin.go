package casbin

import (
	"context"
	"github.com/casbin/casbin/v2"
	"github.com/casbin/casbin/v2/model"
	"github.com/casbin/casbin/v2/persist"
	"github.com/gogf/gf/v2/frame/g"
	"github.com/gogf/gf/v2/util/gconv"
	casbinAdapter "github.com/kennylixi/gadmin/internal/core/casbin"
	commonModel "github.com/kennylixi/gadmin/internal/modules/common/model"
	sysService "github.com/kennylixi/gadmin/internal/modules/system/service"
	"sync"
)

const (
	expireTime = 60 * 60
	modelCfg   = `[request_definition]
r = sub, obj, act

[policy_definition]
p = sub, obj, act

[role_definition]
g = _, _

[policy_effect]
e = some(where (p.eft == allow))

[matchers]
# 支持通配符匹配路由和请求方式
m = g(r.sub, p.sub) && keyMatch(r.obj, p.obj) && regexMatch(r.act, p.act) || isAdmin(r.sub)`
)

var (
	enforce *casbin.SyncedCachedEnforcer
	once    sync.Once
)

// sCasbin 接口管理管理服务
type sCasbin struct{}

func init() {
	sysService.RegisterCasbin(New())
}

func New() *sCasbin {
	return &sCasbin{}
}

// Casbin 初始化casbin
func (s *sCasbin) Casbin(ctx context.Context) *casbin.SyncedCachedEnforcer {
	var err error
	once.Do(func() {
		var a persist.Adapter
		a, err = casbinAdapter.NewAdapterByDB(g.DB(), "sys_casbin", true)
		if err != nil {
			return
		}
		var m model.Model
		m, err = model.NewModelFromString(modelCfg)
		if err != nil {
			return
		}
		enforce, err = casbin.NewSyncedCachedEnforcer(m, a)
		if err != nil {
			return
		}
		// 添加判断超级管理员方法
		enforce.AddFunction("isAdmin", func(arguments ...interface{}) (interface{}, error) {
			user, err := sysService.User().SelectUserByUserName(ctx, gconv.String(arguments[0]))
			if err != nil {
				return nil, err
			}
			return commonModel.IsAdmin(user.UserId), nil
		})
		enforce.SetExpireTime(expireTime)
		err = enforce.LoadPolicy()
	})
	if err != nil {
		g.Log().Fatalf(ctx, "初始化Casbin失败! err = %#v", err)
	}
	return enforce
}
