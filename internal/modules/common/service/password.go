// ================================================================================
// Code generated by GoFrame CLI tool. DO NOT EDIT.
// You can delete these comments if you wish manually maintain this interface file.
// ================================================================================

package service

import (
	"context"
)

type (
	IPassword interface {
		Init(ctx context.Context) error
		HashPassword(ctx context.Context, password string) (string, error)
		CheckPasswordHash(password, hash string) bool
		Validate(ctx context.Context, pwdKey, password, hash string) error
		ClearLoginRecordCache(ctx context.Context, pwdKey string) error
	}
)

var (
	localPassword IPassword
)

func Password() IPassword {
	if localPassword == nil {
		panic("implement not found for interface IPassword, forgot register?")
	}
	return localPassword
}

func RegisterPassword(i IPassword) {
	localPassword = i
}