package module

import (
	"context"
	"github.com/gogf/gf/v2/net/ghttp"
)

type IModule interface {
	// InitCfg 初始化配置
	InitCfg(ctx context.Context) (err error)
	// InitTask 注册任务
	InitTask(ctx context.Context) (err error)
	// InitAdminRouter 初始化管理后台路由
	InitAdminRouter(ctx context.Context, group *ghttp.RouterGroup) (err error)
	// InitApiRouter 初始化前台API路由
	InitApiRouter(ctx context.Context, group *ghttp.RouterGroup) (err error)
	// InitWebRouter 初始化Web路由
	InitWebRouter(ctx context.Context, group *ghttp.RouterGroup) (err error)
	// GetModuleInfo 获取模块信息
	GetModuleInfo() *Module
}

// Module 模块定义
type Module struct {
	Name        string `json:"label"`       // 名称
	Pkg         string `json:"pkg"`         // 包名
	Group       int    `json:"group"`       // 分组
	Logo        string `json:"logo"`        // logo （base64的图片字符串）
	Brief       string `json:"brief"`       // 简介
	Description string `json:"description"` // 详细描述
	Author      string `json:"author"`      // 作者
	Version     string `json:"version"`     // 版本号
	RootPath    string `json:"rootPath"`    // 根路径
}

// InitCfg 初始化配置
func (m *Module) InitCfg(ctx context.Context) (err error) {
	return
}

// InitTask 注册任务
func (m *Module) InitTask(ctx context.Context) (err error) {
	return
}

// InitAdminRouter 初始化管理后台路由
func (m *Module) InitAdminRouter(ctx context.Context, group *ghttp.RouterGroup) (err error) {
	return
}

// InitApiRouter 初始化前台API路由
func (m *Module) InitApiRouter(ctx context.Context, group *ghttp.RouterGroup) (err error) {
	return
}

// InitWebRouter 初始化Web路由
func (m *Module) InitWebRouter(ctx context.Context, group *ghttp.RouterGroup) (err error) {
	return
}

// GetModuleInfo 获取模块信息
func (m *Module) GetModuleInfo() *Module {
	return m
}
