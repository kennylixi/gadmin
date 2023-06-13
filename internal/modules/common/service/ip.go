// ================================================================================
// Code generated by GoFrame CLI tool. DO NOT EDIT.
// You can delete these comments if you wish manually maintain this interface file.
// ================================================================================

package service

import (
	"context"
)

type (
	IIp interface {
		GetIpAddress(ctx context.Context, ip string) string
		GetLocalIP(ctx context.Context) string
	}
)

var (
	localIp IIp
)

func Ip() IIp {
	if localIp == nil {
		panic("implement not found for interface IIp, forgot register?")
	}
	return localIp
}

func RegisterIp(i IIp) {
	localIp = i
}
