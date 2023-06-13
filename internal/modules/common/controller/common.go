package controller

import (
	"context"
	"github.com/gogf/gf/v2/errors/gerror"
	"github.com/gogf/gf/v2/frame/g"
	"github.com/kennylixi/gadmin/internal/modules/common/api/v1/admin"
	"github.com/kennylixi/gadmin/internal/modules/system/model"
	sysService "github.com/kennylixi/gadmin/internal/modules/system/service"
	"github.com/kennylixi/go-filesys"
	"io"
)

var Common = cCommon{}

// cCommon 通用
type cCommon struct{}

// FileDownload 通用下载请求
func (p *cCommon) FileDownload(ctx context.Context, req *admin.FileDownloadReq) (res *admin.FileDownloadRes, err error) {
	allowed, err := sysService.File().CheckAllowDownload(ctx, req.FileName)
	if err != nil {
		return
	}
	if !allowed {
		err = gerror.Newf("文件名称(%s)非法，不允许下载。 ", req.FileName)
		return
	}

	body, err := filesys.Download(ctx, req.FileName)
	// 关闭文件流
	defer func() {
		if body != nil {
			_ = body.Close()
		}
	}()
	if err != nil {
		return nil, err
	}

	sysService.File().SetAttachmentResponseHeader(ctx, req.FileName)

	if err != nil {
		return nil, err
	}

	r := g.RequestFromCtx(ctx)
	// 写入文件流
	_, err = io.Copy(r.Response.Writer, body)
	if err != nil {
		g.Log().Error(ctx, "io.Copy 文件失败", err)
		return nil, gerror.New("下载文件失败")
	}
	r.Response.Buffer()

	return
}

// UploadFile 通用上传请求（单个）
func (p *cCommon) UploadFile(ctx context.Context, req *admin.UploadFileReq) (res *admin.UploadFileRes, err error) {
	allowedExt, err := sysService.File().GetUploadAllowedExt(ctx)
	if err != nil {
		return nil, gerror.Wrap(err, "系统错误")
	}
	out, err := sysService.File().Upload(ctx, &model.FileUploadInput{
		File:             req.File,
		AllowedExtension: allowedExt,
	})
	if err != nil {
		return nil, err
	}
	res = &admin.UploadFileRes{
		Url:         out.Url,
		FileName:    out.FileName,
		NewFileName: out.NewFileName,
		Name:        out.Name,
	}
	return
}

// UploadFiles 通用上传请求（多个）
func (p *cCommon) UploadFiles(ctx context.Context, req *admin.UploadFilesReq) (res *admin.UploadFilesRes, err error) {
	fileCount := len(req.File)
	urls := make([]string, 0, fileCount)
	fileNames := make([]string, 0, fileCount)
	newFileNames := make([]string, 0, fileCount)
	names := make([]string, 0, fileCount)

	allowedExt, err := sysService.File().GetUploadAllowedExt(ctx)
	if err != nil {
		return nil, gerror.Wrap(err, "系统错误")
	}
	for _, file := range req.File {
		out, err := sysService.File().Upload(ctx, &model.FileUploadInput{
			File:             file,
			AllowedExtension: allowedExt,
		})
		if err != nil {
			return nil, err
		}
		urls = append(urls, out.Url)
		fileNames = append(fileNames, out.FileName)
		newFileNames = append(newFileNames, out.NewFileName)
		names = append(names, out.Name)
	}
	res = &admin.UploadFilesRes{
		Urls:         urls,
		FileNames:    fileNames,
		NewFileNames: newFileNames,
		Names:        names,
	}
	return
}

// ResourceDownload 本地资源通用下载
func (p *cCommon) ResourceDownload(ctx context.Context, req *admin.ResourceDownloadReq) (res *admin.ResourceDownloadRes, err error) {
	if allowed, err := sysService.File().CheckAllowDownload(ctx, req.Resource); err != nil {
		return nil, err
	} else if !allowed {
		return nil, gerror.Newf("文件名称(%s)非法，不允许下载。 ", req.Resource)
	}

	body, err := filesys.Download(ctx, req.Resource)
	// 关闭文件流
	defer func() {
		if body != nil {
			_ = body.Close()
		}
	}()
	if err != nil {
		return nil, err
	}

	sysService.File().SetAttachmentResponseHeader(ctx, req.Resource)

	r := g.RequestFromCtx(ctx)
	// 写入文件流
	_, err = io.Copy(r.Response.Writer, body)
	if err != nil {
		g.Log().Error(ctx, "io.Copy 文件失败", err)
		return nil, gerror.New("下载文件失败")
	}
	r.Response.Buffer()
	return
}
