package admin

import (
	"github.com/gogf/gf/v2/frame/g"
	"github.com/kennylixi/gadmin/internal/modules/system/model"
	"github.com/shirou/gopsutil/disk"
)

type MonitorReq struct {
	g.Meta `path:"/server" method:"get" summary:"获取监控信息" tags:"服务监控"`
}
type MonitorRes struct {
	Cpu      model.MonitorCpuInfo `json:"cpu"`
	Mem      model.MonitorMemInfo `json:"mem"`
	Go       model.MonitorGoInfo  `json:"go"`
	Sys      model.MonitorSysInfo `json:"sys"`
	SysFiles []disk.UsageStat     `json:"sysFiles"`
}
