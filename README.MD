Project Makefile Commands: 
- `make cli`: Install or Update to the latest GoFrame CLI tool.
- `make dao`: Generate go files for `Entity/DAO/DO` according to the configuration file from `hack` folder.
- `make service`: Parse `logic` folder to generate interface go files into `service` folder.
- `make image TAG=xxx`: Run `docker build` to build image according `manifest/docker`.
- `make image.push TAG=xxx`: Run `docker build` and `docker push` to build and push image according `manifest/docker`.
- `make deploy TAG=xxx`: Run `kustomize build` to build and deploy deployment to kubernetes server group according `manifest/deploy`.

### 生成service
./gf gen service -s internal/modules/模块名/logic -d internal/modules/模块名/service

./gf gen service -s internal/modules/mp/logic -d internal/modules/mp/service

### 生成dao
./gf gen dao -p ./internal/modules/模块名