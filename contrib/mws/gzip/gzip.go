package gzip

import (
	"compress/gzip"
	"github.com/gogf/gf/v2/encoding/gcompress"
	"github.com/gogf/gf/v2/net/ghttp"
	"net/http"
	"path/filepath"
	"strings"
)

const (
	headerAcceptEncoding  = "Accept-Encoding"
	headerContentEncoding = "Content-Encoding"
	headerContentType     = "Content-Type"
	headerVary            = "Vary"
	headerContentLength   = "Content-Length"
)

const (
	BestCompression    = gzip.BestCompression
	BestSpeed          = gzip.BestSpeed
	DefaultCompression = gzip.DefaultCompression
	NoCompression      = gzip.NoCompression
)

func Gzip(level int) func(r *ghttp.Request) {
	return func(r *ghttp.Request) {
		r.Middleware.Next()

		if !shouldCompress(r.Request) {
			return
		}
		resp := r.Response.Buffer()
		if len(resp) > 0 {
			resp, _ := gcompress.Gzip(resp, level)
			r.Response.Header().Set(headerContentEncoding, "gzip")
			r.Response.Header().Set(headerVary, headerAcceptEncoding)
			r.Response.SetBuffer(resp)
			defer func() {
				r.Header.Del(headerContentLength)
			}()
		}

	}
}

func shouldCompress(req *http.Request) bool {
	if !strings.Contains(req.Header.Get(headerAcceptEncoding), "gzip") {
		return false
	}
	extension := filepath.Ext(req.URL.Path)
	if len(extension) < 4 { // fast path
		return true
	}

	switch extension {
	case ".png", ".gif", ".jpeg", ".jpg":
		return false
	default:
		return true
	}
}
