package mime_type

// 媒体类型定义
const (
	ImagePng  = "image/png"
	ImageJpg  = "image/jpg"
	ImageJpeg = "image/jpeg"
	ImageBmp  = "image/bmp"
	ImageGif  = "image/gif"
)

var (
	ImageExtension = []string{"bmp", "gif", "jpg", "jpeg", "png"}
	FlashExtension = []string{"swf", "flv"}
	MediaExtension = []string{"swf", "flv", "mp3", "wav", "wma", "wmv", "mid", "avi", "mpg",
		"asf", "rm", "rmvb"}
	VideoExtension = []string{"mp4", "avi", "rmvb"}
)
