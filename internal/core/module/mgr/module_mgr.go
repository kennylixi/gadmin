package mgr

import (
	"github.com/gogf/gf/v2/errors/gerror"
	"github.com/kennylixi/gadmin/internal/core/module"
	"sync"
)

var (
	modules = make(map[string]module.IModule)
	m       sync.RWMutex
)

// RegisterModule 注册模块
func RegisterModule(im module.IModule) error {
	m.Lock()
	defer m.Unlock()

	info := im.GetModuleInfo()
	if _, ok := modules[info.Pkg]; ok {
		return gerror.Newf("已经存在相同包名的模块[%s]", info.Pkg)
	}
	modules[info.Pkg] = im
	return nil
}

// GetModules 获取所有模块
func GetModules() []module.IModule {
	m.RLock()
	defer m.RUnlock()

	moduleList := make([]module.IModule, 0, len(modules))
	for _, iModule := range modules {
		moduleList = append(moduleList, iModule)
	}
	return moduleList
}
