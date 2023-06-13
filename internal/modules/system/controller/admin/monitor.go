package admin

import (
	"context"
	"fmt"
	"github.com/gogf/gf/v2/frame/g"
	"github.com/gogf/gf/v2/os/gtime"
	"github.com/gogf/gf/v2/util/gconv"
	commonService "github.com/kennylixi/gadmin/internal/modules/common/service"
	"github.com/kennylixi/gadmin/internal/modules/system/api/v1/admin"
	"github.com/kennylixi/gadmin/internal/modules/system/model"
	"github.com/kennylixi/gadmin/utility/xtime"
	"github.com/shirou/gopsutil/cpu"
	"github.com/shirou/gopsutil/disk"
	"github.com/shirou/gopsutil/host"
	"github.com/shirou/gopsutil/mem"
	"os"
	"runtime"
	"strconv"
)

// Monitor 系统监控管理
var Monitor = cMonitor{}

type cMonitor struct{}

var startTime = gtime.Datetime()

func (c *cMonitor) Info(ctx context.Context, req *admin.MonitorReq) (res *admin.MonitorRes, err error) {
	res = &admin.MonitorRes{}
	cpuNum := runtime.NumCPU() //核心数

	var cpuUser float64 = 0 //用户使用率
	var cpuSys float64 = 0  //系统使用率
	var cpuIdle float64 = 0 //空闲率
	times, err := cpu.Times(false)
	if times != nil && len(times) > 0 {
		cpuUser = times[0].User
		cpuSys = times[0].System
		cpuIdle = times[0].Idle
	}

	var memTotal uint64 = 0  //总内存
	var memUsed uint64 = 0   //总内存  := 0 //已用内存
	var memFree uint64 = 0   //剩余内存
	var memUsage float64 = 0 //使用率

	v, err := mem.VirtualMemory()
	if err == nil {
		memTotal = v.Total / 1024 / 1024
		memUsed = v.Used / 1024 / 1024
		memFree = memTotal - memUsed
		memUsage, _ = strconv.ParseFloat(fmt.Sprintf("%.2f", v.UsedPercent), 64)
	}

	var goTotal uint64 = 0  //go分配的总内存数
	var goUsed uint64 = 0   //go使用的内存数
	var goFree uint64 = 0   //go剩余的内存数
	var goUsage float64 = 0 //使用率

	var gomem runtime.MemStats
	runtime.ReadMemStats(&gomem)
	goUsed = gomem.Sys / 1024 / 1024
	goTotal = memFree + goUsed
	goFree = memFree
	goUsage = gconv.Float64(fmt.Sprintf("%.2f", gconv.Float64(goUsed)/gconv.Float64(goTotal)*100))

	sysComputerIp := "" //服务器IP
	sysComputerIp = commonService.Ip().GetLocalIP(ctx)

	sysComputerName := "" //服务器名称
	sysOsName := ""       //操作系统
	sysOsArch := ""       //系统架构

	if sysInfo, err := host.Info(); err == nil {
		sysComputerName = sysInfo.Hostname
		sysOsName = sysInfo.OS
		sysOsArch = sysInfo.KernelArch
	}

	goVersion := runtime.Version() //版本
	goHome := runtime.GOROOT()     //安装路径
	goUserDir := ""                //项目路径
	goRunTime := ""                //运行时长
	if goRunTime, err = xtime.GetHourDiffer(startTime, gtime.Datetime()); err != nil {
		g.Log().Error(ctx, "xtime.GetHourDiffer error.", err)
	}

	if goUserDir, err = os.Getwd(); err != nil {
		g.Log().Error(ctx, "os.Getwd error.", err)
	}

	//服务器磁盘信息
	disklist := make([]disk.UsageStat, 0)
	diskInfo, err := disk.Partitions(true) //所有分区
	if err != nil {
		g.Log().Error(ctx, "disk.Partitions error.", err)
	}
	if diskInfo != nil {
		for _, p := range diskInfo {
			diskDetail, err := disk.Usage(p.Mountpoint)
			if err == nil {
				diskDetail.UsedPercent, _ = strconv.ParseFloat(fmt.Sprintf("%.2f", diskDetail.UsedPercent), 64)
				diskDetail.Total = diskDetail.Total / 1024 / 1024 / 1024
				diskDetail.Used = diskDetail.Used / 1024 / 1024 / 1024
				diskDetail.Free = diskDetail.Free / 1024 / 1024 / 1024
				disklist = append(disklist, *diskDetail)
			}
		}
	}

	memTotalG, _ := strconv.ParseFloat(fmt.Sprintf("%.2f", gconv.Float64(memTotal)/1024), 10)
	memUsedG, _ := strconv.ParseFloat(fmt.Sprintf("%.2f", gconv.Float64(memUsed)/1024), 10)
	memFreeG, _ := strconv.ParseFloat(fmt.Sprintf("%.2f", gconv.Float64(memFree)/1024), 10)
	goTotalG, _ := strconv.ParseFloat(fmt.Sprintf("%.2f", gconv.Float64(goTotal)), 10)
	goUsedG, _ := strconv.ParseFloat(fmt.Sprintf("%.2f", gconv.Float64(goUsed)), 10)
	goFreeG, _ := strconv.ParseFloat(fmt.Sprintf("%.2f", gconv.Float64(goFree)), 10)

	res.Cpu = model.MonitorCpuInfo{
		CpuNum: cpuNum,
		Used:   cpuUser,
		Sys:    cpuSys,
		Free:   cpuIdle,
	}
	res.Mem = model.MonitorMemInfo{
		Total: memTotalG,
		Used:  memUsedG,
		Free:  memFreeG,
		Usage: memUsage,
	}
	res.Go = model.MonitorGoInfo{
		Total:     goTotalG,
		Used:      goUsedG,
		Free:      goFreeG,
		Usage:     goUsage,
		Version:   goVersion,
		StartTime: startTime,
		RunTime:   goRunTime,
		Home:      goHome,
	}
	res.Sys = model.MonitorSysInfo{
		ComputerName: sysComputerName,
		OsName:       sysOsName,
		ComputerIp:   sysComputerIp,
		OsArch:       sysOsArch,
		UserDir:      goUserDir,
	}
	res.SysFiles = disklist
	return
}
