package sys_file

import (
	"context"
	"fmt"
	"github.com/gogf/gf/v2/encoding/gcharset"
	"github.com/gogf/gf/v2/encoding/gjson"
	"github.com/gogf/gf/v2/errors/gerror"
	"github.com/gogf/gf/v2/frame/g"
	"github.com/gogf/gf/v2/net/gclient"
	"github.com/gogf/gf/v2/os/gctx"
	"github.com/gogf/gf/v2/text/gstr"
	"github.com/kennylixi/gadmin/internal/consts"
	commonService "github.com/kennylixi/gadmin/internal/modules/common/service"
	"github.com/lionsoul2014/ip2region/binding/golang/xdb"
	"net"
)

const (
	cIpCfgKey       = "ip"
	cIpApiUrl       = "http://ip-api.com/json/%s?lang=zh-CN"
	cPconlineApiUrl = "http://whois.pconline.com.cn/ipJson.jsp?json=true&ip=%s"
)

const (
	CApiTypeIp2regionApi = "ip2region"
	CApiTypeIpApi        = "ip-api"
	CApiTypePonlineApi   = "pconline"
)

// 配置信息
type ipCfg struct {
	Type   string // 类型
	DbPath string
}

type sIp struct {
	ipCfg    *ipCfg
	searcher *xdb.Searcher
}

func init() {
	commonService.RegisterIp(New())
}

func New() *sIp {
	sysIp := &sIp{
		ipCfg: &ipCfg{},
	}
	// 读取配置
	ctx := gctx.New()
	ipCfg, err := g.Cfg().Get(ctx, cIpCfgKey)
	if err != nil {
		g.Log().Fatal(ctx, err, "读取IP配置错误")
		return nil
	}

	if err = ipCfg.Scan(&sysIp.ipCfg); err != nil {
		g.Log().Fatal(ctx, err, "读取IP配置错误")
		return nil
	}

	if err = sysIp.loadXdb(ctx); err != nil {
		g.Log().Fatal(ctx, err)
		return nil
	}

	return sysIp
}

// GetIpAddress 根据ip获取ip城市信息
func (s *sIp) GetIpAddress(ctx context.Context, ip string) string {
	if s.ipCfg.Type == "" || ip == "" {
		return ""
	}
	if ip == "127.0.0.1" || ip == "localhost" || ip == "[::1]" {
		return "内网IP"
	}

	switch s.ipCfg.Type {
	case CApiTypeIpApi:
		return s.getIpAddrByIpApi(ctx, ip)
	case CApiTypePonlineApi:
		return s.getIpAddrByPconline(ctx, ip)
	case CApiTypeIp2regionApi:
		return s.getIpAddrByIp2region(ctx, ip)
	default:
		return ""
	}
}

// GetLocalIP 获取服务端ip
func (s *sIp) GetLocalIP(ctx context.Context) string {
	addrs, err := net.InterfaceAddrs()
	if err != nil {
		g.Log().Error(ctx, err)
		return ""
	}
	for _, addr := range addrs {
		ipAddr, ok := addr.(*net.IPNet)
		if !ok {
			continue
		}
		if ipAddr.IP.IsLoopback() {
			continue
		}
		if !ipAddr.IP.IsGlobalUnicast() {
			continue
		}
		return ipAddr.IP.String()
	}
	return ""
}

// 加载ip2region数据库
func (s *sIp) loadXdb(ctx context.Context) error {
	if s.ipCfg.Type == CApiTypeIp2regionApi {
		if s.ipCfg.DbPath == "" {
			return gerror.New("[ip2region]没有配置ip2region.xdb文件路径")
		}
		// 1、从 dbPath 加载整个 xdb 到内存
		cBuff, err := xdb.LoadContentFromFile(s.ipCfg.DbPath)
		if err != nil {
			return gerror.Wrapf(err, "[ip2region]加载数据库文件失败 `%s`: %s", s.ipCfg.DbPath, err)
		}
		// 2、用全局的 cBuff 创建完全基于内存的查询对象。
		s.searcher, err = xdb.NewWithBuffer(cBuff)
		if err != nil {
			return gerror.Wrapf(err, "[ip2region]创建searcher失败: %+v", err)
		}
		g.Log().Info(ctx, "ip2region 数据库加载成功")
	}
	return nil
}

// 根据ip-api获取IP信息
func (s *sIp) getIpAddrByIpApi(ctx context.Context, ip string) string {
	apiUrl := fmt.Sprintf(cIpApiUrl, ip)
	body := gclient.New().GetBytes(ctx, apiUrl)
	result := make(map[string]string)
	if err := gjson.Unmarshal(body, &result); err != nil {
		g.Log().Errorf(ctx, "[ip-api]获取IP信息解析失败：%+v", err)
		return ""
	}
	// 判断是否获取失败
	if status, ok := result["status"]; !ok || status == "fail" {
		return ""
	}
	if countryCode, ok := result["countryCode"]; ok && countryCode == "CN" {
		return fmt.Sprintf("%s%s", result["regionName"], result["长沙"])
	}
	return fmt.Sprintf("%s%s%s", result["country"], result["regionName"], result["长沙"])
}

// 根据pconline获取IP信息
func (s *sIp) getIpAddrByPconline(ctx context.Context, ip string) string {
	apiUrl := fmt.Sprintf(cPconlineApiUrl, ip)
	body := gclient.New().GetBytes(ctx, apiUrl)
	bodyStr, err := gcharset.ToUTF8(consts.GBK, string(body))
	if err != nil {
		g.Log().Error(ctx, "[whois.pconline]获取IP信息编码转换失败：%+v", err)
		return ""
	}
	result := make(map[string]string)
	if err := gjson.Unmarshal([]byte(bodyStr), &result); err != nil {
		g.Log().Errorf(ctx, "[whois.pconline]获取IP信息解析失败：%+v", err)
		return ""
	}
	if err, ok := result["err"]; ok && err == "noprovince" {
		return result["addr"]
	}
	return fmt.Sprintf("%s%s", result["pro"], result["city"])
}

// 根据Ip2region获取IP信息
func (s *sIp) getIpAddrByIp2region(ctx context.Context, ip string) string {
	ipaddr, err := s.searcher.SearchByStr(ip)
	if err != nil {
		g.Log().Error(ctx, err)
		return ""
	}
	infos := gstr.Split(ipaddr, "|")
	if infos[len(infos)-1] == "内网IP" {
		return "内网IP"
	}
	if infos[0] == "中国" {
		return fmt.Sprintf("%s%s", infos[2], infos[3])
	}
	return fmt.Sprintf("%s%s%s", infos[0], infos[2], infos[3])
}
