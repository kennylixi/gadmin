package xtime

import (
	"fmt"
	"time"
)

// GetHourDiffer 获取相差时间
func GetHourDiffer(startTime, endTime string) (string, error) {
	var day int64
	var hour int64
	var minute int64
	t1, err := time.ParseInLocation("2006-01-02 15:04:05", startTime, time.Local)
	if err != nil {
		return "", err
	}
	t2, err := time.ParseInLocation("2006-01-02 15:04:05", endTime, time.Local)
	if err != nil {
		return "", err
	}
	if t1.Before(t2) {
		diff := t2.Unix() - t1.Unix() //
		minute = (diff % 3600) / 60
		day = diff / (3600 * 24)
		hour = diff % (3600 * 24) / 3600
	}
	return fmt.Sprintf("%d天%d时%d分", day, hour, minute), nil
}
