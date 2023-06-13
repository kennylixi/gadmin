package error_code

import (
	"github.com/gogf/gf/v2/errors/gcode"
	"github.com/gogf/gf/v2/errors/gerror"
)

var (
	ErrNotFound = gerror.NewCode(gcode.New(100, "数据不存在", nil))
)
