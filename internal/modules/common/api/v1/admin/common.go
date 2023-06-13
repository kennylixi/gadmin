package admin

import (
	"github.com/gogf/gf/v2/frame/g"
	"github.com/gogf/gf/v2/net/ghttp"
)

type FileDownloadReq struct {
	g.Meta   `path:"/download" tags:"公共接口" method:"get" summary:"通用下载请求"`
	FileName string // 文件名称
	Delete   bool   // 是否删除
}
type FileDownloadRes struct {
}

type UploadFileReq struct {
	g.Meta `path:"/upload" tags:"公共接口" method:"post" mime:"multipart/form-data" summary:"通用上传请求（单个）"`
	File   *ghttp.UploadFile `type:"file" v:"required#请上传文件"`
}
type UploadFileRes struct {
	Url         string `json:"url"`         // 访问地址
	FileName    string `json:"fileName"`    // 文件名
	NewFileName string `json:"newFileName"` // 新文件名
	Name        string `json:"name"`        // 原文件名
}

type UploadFilesReq struct {
	g.Meta `path:"/uploads" tags:"公共接口" method:"post" summary:"通用上传请求（多个）"`
	File   ghttp.UploadFiles `type:"file" v:"required#请上传文件"`
}
type UploadFilesRes struct {
	Urls         []string `json:"urls"`         // 访问地址
	FileNames    []string `json:"fileNames"`    // 文件名
	NewFileNames []string `json:"newFileNames"` // 新文件名
	Names        []string `json:"names"`        // 原文件名
}

type ResourceDownloadReq struct {
	g.Meta   `path:"/download/resource" tags:"公共接口" method:"get" summary:"本地资源通用下载"`
	Resource string
}
type ResourceDownloadRes struct {
}
