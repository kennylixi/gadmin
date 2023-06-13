package invite_code

import (
	"github.com/gogf/gf/v2/util/gconv"
	"math"
	"strings"
)

// 最短设备码
const CodeMinLength = 6

// 字符串反转
func reverse(str string) string {
	var result []byte
	for i := len(str) - 1; i >= 0; i-- {
		result = append(result, str[i])
	}
	return string(result)
}

// 新方法
var sourceString = "agE5niFsCxDyGc3HpQdA4BNjPJz2RwSTUmVe67uMbWfX8r9KhLYZt"
var addString = "0"

// EncodeCode 得到字符串
func EncodeCode(userId int) string {
	num := userId
	code := ""
	for num > 0 {
		mod := num % len(sourceString)
		num = (num - mod) / len(sourceString)
		code = string(sourceString[mod]) + code
	}
	if len(code) < CodeMinLength {
		code = strPad(code, CodeMinLength)
	}

	return encodeCode(code)
}

// 字符串填补
func strPad(code string, length int) string {
	if len(code) < length {
		code = addString + code
		code = strPad(code, length)
	}
	return code
}

// 生成的code加密
func encodeCode(code string) string {
	// 截取最后一位字符串
	length := len(code)
	lastChar := code[length-1:]

	// 最后一位字符串在源字符串出现的位置
	step := strings.Index(sourceString, lastChar) - (length - 3)
	codeByte := []byte(code)
	for i := 0; i < length-1; i++ {
		local := 0
		b := strings.Index(sourceString, string(codeByte[i]))
		if b == -1 {
			b = 0
		}
		if step%2 != 0 {
			local = b + step - i
		} else {
			local = b + step + i
		}

		if local < 0 {
			local = len(sourceString) + local
		}

		if local >= len(sourceString) {
			local = local - len(sourceString)
		}
		codeByte[i] = sourceString[local]
	}
	return string(codeByte)
}

// DecodeCode 根据邀请码得到字符串
func DecodeCode(code string) int {
	// 截取最后一位字符串
	length := len(code)
	lastChar := code[length-1:]

	// 最后一位字符串在源字符串出现的位置
	step := strings.Index(sourceString, lastChar) - (length - 3)
	codeByte := []byte(code)
	for i := 0; i < length-1; i++ {
		local := 0
		b := strings.Index(sourceString, string(codeByte[i]))
		if b == -1 {
			b = 0
		}
		if step%2 != 0 {
			local = b - step + i
		} else {
			local = b - step - i
		}

		if local < 0 {
			local = len(sourceString) + local
		}

		if local >= len(sourceString) {
			local = local - len(sourceString)
		}
		codeByte[i] = sourceString[local]
	}
	code = string(codeByte)
	// 进制转换为10进制
	if strings.Index(code, "0") != -1 {
		code = code[strings.Index(code, "0")+1:]
	}
	l := len(code)
	// 反转
	code = reverse(code)
	num := 0
	for i := 0; i < l; i++ {
		num += strings.Index(sourceString, string(code[i])) * gconv.Int(math.Pow(gconv.Float64(len(sourceString)), gconv.Float64(i)))
	}
	return num
}
