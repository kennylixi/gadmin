package main

import (
	_ "github.com/gogf/gf/contrib/drivers/mysql/v2"
	_ "github.com/gogf/gf/contrib/nosql/redis/v2"
	_ "github.com/kennylixi/gadmin/internal/modules"
	_ "github.com/kennylixi/gadmin/internal/packed"

	"github.com/gogf/gf/v2/os/gctx"

	"github.com/kennylixi/gadmin/internal/cmd"
)

func main() {
	cmd.Main.Run(gctx.New())
}
