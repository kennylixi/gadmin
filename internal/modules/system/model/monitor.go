package model

type MonitorCpuInfo struct {
	CpuNum int     `json:"cpuNum"`
	Used   float64 `json:"used"`
	Sys    float64 `json:"sys"`
	Free   float64 `json:"free"`
}

type MonitorMemInfo struct {
	Total float64 `json:"total"`
	Used  float64 `json:"used"`
	Free  float64 `json:"free"`
	Usage float64 `json:"usage"`
}

type MonitorGoInfo struct {
	Total     float64 `json:"total"`
	Used      float64 `json:"used"`
	Free      float64 `json:"free"`
	Usage     float64 `json:"usage"`
	Version   string  `json:"version"`
	StartTime string  `json:"startTime"`
	RunTime   string  `json:"runTime"`
	Home      string  `json:"home"`
}

type MonitorSysInfo struct {
	ComputerName string `json:"computerName"`
	OsName       string `json:"osName"`
	ComputerIp   string `json:"computerIp"`
	OsArch       string `json:"osArch"`
	UserDir      string `json:"userDir"`
}
