package user_consts

// 用户常量信息

const (
	SysUser           = "SYS_USER"   //平台内系统用户的唯一标志
	Normal            = "0"          //正常状
	EXCEPTION         = "1"          //异常状态
	UserDisable       = "1"          //用户封禁状态
	RoleDisable       = "1"          //角色封禁状态
	DeptNormal        = "0"          //部门正常状态
	DeptDisable       = "1"          //部门停用状态
	DictNormal        = "0"          //字典正常状态
	Yes               = "Y"          //是否为系统默认（是）
	YesFrame          = "0"          //是否菜单外链（是）
	NoFrame           = "1"          //是否菜单外链（否）
	TypeDir           = "M"          //菜单类型（目录）
	TypeMenu          = "C"          //菜单类型（菜单）
	TypeButton        = "F"          //菜单类型（按钮）
	Layout            = "Layout"     //Layout组件标识
	ParentView        = "ParentView" //ParentView组件标识
	InnerLink         = "InnerLink"  //InnerLink组件标识
	Unique            = "0"          //校验返回结果码
	NotUnique         = "1"          //校验返回结果码
	UsernameMinLength = 2            //用户名长度限制
	UsernameMaxLength = 20           //用户名长度限制
	PasswordMinLength = 5            //密码长度限制
	PasswordMaxLength = 20           //密码长度限制
)
