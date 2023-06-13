package http_status

// 返回状态码

const (
	Success         = 200 //操作成功
	Created         = 201 //对象创建成功
	Accepted        = 202 //请求已经被接受
	NoContent       = 204 //操作已经执行成功，但是没有返回数据
	MovedPerm       = 301 //资源已被移除
	SeeOther        = 303 //重定向
	NotModified     = 304 //资源没有被修改
	BadRequest      = 400 //参数列表错误（缺少，格式不匹配）
	Unauthorized    = 401 //未授权
	Forbidden       = 403 //访问受限，授权过期
	NotFound        = 404 //资源，服务未找到
	BadMethod       = 405 //不允许的http方法
	Conflict        = 409 //资源冲突，或者资源被锁
	UnsupportedType = 415 //不支持的数据，媒体类型
	Error           = 500 //系统内部错误
	NotImplemented  = 501 //接口未实现
)
