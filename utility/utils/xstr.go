package utils

import (
	"fmt"
)

// Capitalize 字符首字母大写
func Capitalize(str string) string {
	var upperStr string
	vv := []rune(str)
	for i := 0; i < len(vv); i++ {
		if i == 0 {
			if vv[i] >= 97 && vv[i] <= 122 {
				vv[i] -= 32 // string的码表相差32位
				upperStr += string(vv[i])
			} else {
				fmt.Println("Not begins with lowercase letter,")
				return str
			}
		} else {
			upperStr += string(vv[i])
		}
	}
	return upperStr
}

// UnCapitalize 字符首字母小写
func UnCapitalize(str string) string {
	var lowerStr string
	vv := []rune(str)
	for i := 0; i < len(vv); i++ {
		if i == 0 {
			if vv[i] >= 65 && vv[i] <= 90 {
				vv[i] += 32 // string的码表相差32位
				lowerStr += string(vv[i])
			} else {
				fmt.Println("Not begins with uppercase letter,")
				return str
			}
		} else {
			lowerStr += string(vv[i])
		}
	}
	return lowerStr
}
