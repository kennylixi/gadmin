package hook

import (
	sysService "github.com/kennylixi/gadmin/internal/modules/system/service"
)

type sHook struct {
}

func init() {
	sysService.RegisterHook(New())
}

func New() *sHook {
	return &sHook{}
}
