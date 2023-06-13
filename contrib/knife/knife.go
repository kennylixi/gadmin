package knife

import (
	"context"
	"fmt"
	"github.com/gogf/gf/v2/frame/g"
	"github.com/gogf/gf/v2/net/ghttp"
	"github.com/gogf/gf/v2/net/goai"
	"github.com/gogf/gf/v2/os/gctx"
	"github.com/gogf/gf/v2/text/gstr"
	"github.com/gogf/gf/v2/util/gconv"
)

const (
	apiDocName           = `{ApiDocName}`
	apiDocURL            = `{ApiDocURL}`
	servicesJsonTemplate = `[
    {
        "name": "{ApiDocName}",
        "url": "{ApiDocURL}",
        "swaggerVersion": "2.0",
        "location": "{ApiDocURL}"
    },
]
`
)

// Knife is the struct for swagger feature management.
type Knife struct {
	goai.Info
}

const (
	docPath     = "/knife4j"
	name        = "knife4j"
	author      = "371212848@qq.com"
	version     = "v1.0.0"
	description = "knife4j for GoFrame GoFrame project."
)

// Name returns the name of the plugin.
func (kf *Knife) Name() string {
	return name
}

// Author returns the author of the plugin.
func (kf *Knife) Author() string {
	return author
}

// Version returns the version of the plugin.
func (kf *Knife) Version() string {
	return version
}

// Description returns the description of the plugin.
func (kf *Knife) Description() string {
	return description
}

// Install installs the swagger to server as a plugin.
// It implements the interface ghttp.Plugin.
func (kf *Knife) Install(s *ghttp.Server) error {
	ctx := gctx.New()

	// Retrieve the configuration map and assign it to swagger object.
	m := g.Cfg().MustGet(ctx, "knife4j").Map()
	if m != nil {
		if err := gconv.Struct(m, kf); err != nil {
			s.Logger().Fatal(ctx, err)
		}
	}

	openapi := s.GetOpenApi()
	openapi.Config.CommonResponse = ghttp.DefaultHandlerResponse{}
	openapi.Config.CommonResponseDataField = `Data`
	openapi.Info = kf.Info

	s.AddStaticPath(docPath, "resource/knife4j")
	s.BindHandler(docPath+"/services.json", func(r *ghttp.Request) {
		openapiPath := g.Cfg().MustGet(gctx.New(), "server.openapiPath", "/api.json").String()

		oai := s.GetOpenApi()
		r.Response.WriteJsonExit(gstr.ReplaceByMap(servicesJsonTemplate, map[string]string{
			apiDocName: oai.Info.Title,
			apiDocURL:  openapiPath,
		}))
	})
	s.BindHandler(docPath, func(r *ghttp.Request) {
		r.Response.WriteTpl("knife4j/doc.html")
	})
	s.Logger().Infof(
		ctx,
		`knife4j ui is serving at address: %s%s`,
		kf.getListenAddress(ctx),
		docPath,
	)
	return nil
}

func (kf Knife) Remove() error {
	return nil
}

func (kf *Knife) getListenAddress(ctx context.Context) string {
	var (
		array = gstr.SplitAndTrim(g.Cfg().MustGet(ctx, "server.address").String(), ":")
		host  = `127.0.0.1`
		port  = 0
	)
	if len(array) > 1 {
		host = array[0]
		port = gconv.Int(array[1])
	} else {
		port = gconv.Int(array[0])
	}
	return fmt.Sprintf(`http://%s:%d`, host, port)
}
