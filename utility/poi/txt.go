package poi

import (
	"bufio"
	"bytes"
	"context"
	"github.com/gogf/gf/v2/errors/gerror"
	"github.com/gogf/gf/v2/frame/g"
	"github.com/gogf/gf/v2/text/gstr"
	"github.com/gogf/gf/v2/util/gconv"
	"io"
	"strings"
)

const (
	cTxtSeparator = ", " // Txt分隔符
)

type Txt struct {
	ctx      context.Context
	metaList []*Meta // 注解列表
}

// NewTxt 实例化Txt
//	@param metaClaz 对象 (*User)(nil)
func NewTxt(ctx context.Context, metaClaz interface{}) (e *Txt, err error) {
	if metaClaz == nil {
		err = gerror.New("请传入meta对象")
		return
	}

	metaList, err := parserMeta(metaClaz)
	if err != nil {
		return
	}

	e = &Txt{
		ctx:      ctx,
		metaList: metaList,
	}
	return e, nil
}

// ExportTxt 导出数据到txt文件
func (txt *Txt) ExportTxt(list []map[string]interface{}) (err error) {
	r := g.RequestFromCtx(txt.ctx)
	r.Response.Header().Set("Content-Type", "text/plain; charset=UTF-8")

	metaList := make([]*Meta, 0, len(txt.metaList))
	for _, meta := range txt.metaList {
		if meta.OpType == OpTypeAll || meta.OpType == OpTypeExport {
			metaList = append(metaList, meta)
		}
	}
	colsNum := len(metaList)

	var w strings.Builder
	// 写入头
	for i, meta := range metaList {
		w.WriteString(meta.Name)
		if i < colsNum-1 {
			w.WriteString(cTxtSeparator)
		}
	}
	w.WriteString("\r")

	// 写入数据
	for _, row := range list {
		for i, meta := range metaList {
			data, ok := row[meta.FieldName]
			if !ok && meta.DefaultValue != "" {
				data = meta.DefaultValue
			}
			w.WriteString(gconv.String(data))
			if i < colsNum-1 {
				w.WriteString(cTxtSeparator)
			}
		}
		w.WriteString("\r")
	}
	r.Response.Write(w.String())

	return
}

// ExportTemplate 导出导入模板
func (txt *Txt) ExportTemplate() (err error) {
	r := g.RequestFromCtx(txt.ctx)
	r.Response.Header().Set("Content-Type", "text/plain; charset=UTF-8")

	metaList := make([]*Meta, 0, len(txt.metaList))
	for _, meta := range txt.metaList {
		if meta.OpType == OpTypeAll || meta.OpType == OpTypeImport {
			metaList = append(metaList, meta)
		}
	}
	colsNum := len(metaList)

	var w strings.Builder
	// 写入头
	for i, meta := range metaList {
		w.WriteString(meta.Name)
		if i < colsNum-1 {
			w.WriteString(cTxtSeparator)
		}
	}
	w.WriteString("\r")

	r.Response.Write(w.String())
	return
}

// ImportTxt 导入txt
func (txt *Txt) ImportTxt(r io.ReadCloser) (result []map[string]interface{}, err error) {
	defer func() {
		if r != nil {
			r.Close()
		}
	}()

	metaList := make([]*Meta, 0, len(txt.metaList))
	for _, meta := range txt.metaList {
		if meta.OpType == OpTypeAll || meta.OpType == OpTypeImport {
			metaList = append(metaList, meta)
		}
	}

	colsNum := len(metaList)
	lineCount := 0
	result = make([]map[string]interface{}, 0)

	reader := bufio.NewReader(r)
	for {
		line, err := reader.ReadString('\r')
		if err == io.EOF {
			break
		}
		if err != nil {
			return nil, err
		}
		line = gstr.Trim(line, "\n")
		cols := gstr.SplitAndTrim(line, cTxtSeparator)
		if colsNum != len(cols) {
			goto ERROR
		}

		row := make(map[string]interface{})
		for i, meta := range metaList {
			if meta.Name != cols[i] {
				goto ERROR
			}
			// 解析数据
			row[meta.Name] = cols[i]
		}

		if lineCount != 0 {
			result = append(result, row)
		}
		lineCount++
	}

	return

ERROR:
	if lineCount == 0 {
		err = gerror.New("表头格式错误")
		return
	} else {
		err = gerror.Newf("第[%d]行数据格式错误", lineCount+1)
		return
	}
}

// dropCR drops a terminal \r from the data.
func dropCR(data []byte) []byte {
	if len(data) > 0 && data[len(data)-1] == '\r' {
		return data[0 : len(data)-1]
	}
	return data
}

func scanCRLF(data []byte, atEOF bool) (advance int, token []byte, err error) {
	if atEOF && len(data) == 0 {
		return 0, nil, nil
	}
	if i := bytes.Index(data, []byte{'\r', '\n'}); i >= 0 {
		// We have a full newline-terminated line.
		return i + 2, dropCR(data[0:i]), nil
	}
	// If we're at EOF, we have a final, non-terminated line. Return it.
	if atEOF {
		return len(data), dropCR(data), nil
	}
	// Request more data.
	return 0, nil, nil
}
