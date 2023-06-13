# 1、asynq 的 cli 工具

### 安装
go get -u github.com/hibiken/asynq/tools/asynq

### 分析任务详情
asynq stats

### 每3秒运行一次`asynq stats` watch工具需要自己安装
watch -n 3 asynq stats

# 2、web 工具

### 安装
go get -u github.com/hibiken/asynq/tools/asynqmon安装无效，直接下载二进制文件，放到go bin文件夹中：
https://github.com/hibiken/asynqmon/releases
### 使用
asynqmon --port=3000 --redis-addr=localhost:6379
### 指定数据库号
asynqmon --port=3000 --redis-addr=x.x.x.x:6379 --redis-db=6

http://127.0.0.1:3000/