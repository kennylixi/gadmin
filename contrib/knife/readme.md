### knife4j前端编译
#### 下载地址 https://doc.xiaominfo.com/
#### knife4j-vue编译
1. vue.config.js 
   修改publicPath为knife4j
   增加transpileDependencies: ['/mermaid/']
2. balel.config.js
   libraryName增加mermaid
   ['import', { 'libraryName': 'mermaid', 'libraryDirectory': 'es', 'style': 'css' }], // `style: true` 会加载 less 文件
3. BasicLayout.vue
   created()方法中开启this.initKnife4jFront(); 修改url: "./knife4j/services.json",