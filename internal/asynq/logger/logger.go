package logger

import (
	"context"
	"github.com/gogf/gf/v2/os/glog"
	"github.com/hibiken/asynq"
)

var ctx = context.Background()

type Logger struct {
	base *glog.Logger
}

func NewLogger(l *glog.Logger) asynq.Logger {
	return &Logger{base: l}
}

func (l *Logger) Debug(args ...interface{}) {
	l.base.Debug(ctx, args...)
}

func (l *Logger) Info(args ...interface{}) {
	l.base.Info(ctx, args...)
}

func (l *Logger) Warn(args ...interface{}) {
	l.base.Info(ctx, args...)
}

func (l *Logger) Error(args ...interface{}) {
	l.base.Error(ctx, args...)
}

func (l *Logger) Fatal(args ...interface{}) {
	l.base.Fatal(ctx, args...)
}
