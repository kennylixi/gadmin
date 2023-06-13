package model

// TreeSelect 树形结构
type TreeSelect struct {
	Id       int64         `json:"id"`                 //节点ID
	Label    string        `json:"label"`              //节点名称
	Children []*TreeSelect `json:"children,omitempty"` //子节点
}
