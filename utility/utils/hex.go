package utils

import (
	"bytes"
	"encoding/hex"
	"fmt"
	"strconv"
	"strings"
)

func ToHex(value interface{}, bSize int) string {
	hexStr := ""
	switch v := value.(type) {
	case string:
		hexStr = hex.EncodeToString(bytes.NewBufferString(value.(string)).Bytes())
	case int:
		hexStr = strconv.FormatUint(uint64(value.(int)), 16)
	default:
		panic(fmt.Sprintf("类型错误:%v", v))
	}

	c := bSize*2 - len(hexStr)
	if c > 0 {
		for i := 0; i < c; i++ {
			hexStr = "0" + hexStr
		}
	}
	if c < 0 {
		hexStr = strings.Join(strings.Split(hexStr, "")[-c:], "")
	}
	return hexStr
}
