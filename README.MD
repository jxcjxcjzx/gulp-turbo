## gulp-Turbo v2.0.14
> 译:涡轮增压器， 前端工作流，为前端开发联调加速。

### 前端工作流 功能说明
> 1. 快速构建前端项目
> 1. 提供易于开发、调试的开发联调环境，支持预编译语言（jade,stylus,coffee）
> 1. 提供基于requirejs的实时打包服务。
> 1. 提供http server, 支持mock接口数据功能。
> 1. 提供json文件自动校验
> 1. 提供80端口代理、转发功能（可用于多项目联调）
> 1. 提供透明代理（即：线下不存在的资源，直接抓取线上）
> 1. 便捷的移动端调试（默认开启htpp代理服务，端口8989,可以代替fiddler或charles.）
> 1. 支持https

#### 安装（依赖node.js，npm）

```shell
  #全局gulp包
  npm i gulp -g

  #本地gulp包
  npm i gulp --save

  #安装gulp-turbo
  npm i gulp-turbo --save

```
## 创建项目

> 可以使用[yomen生成器](https://www.npmjs.com/package/generator-turbo)，或者按照以下步骤创建项目。

#### 1. 初始化npm项目、安装依赖
```
npm init

```
#### 2. 创建gulpfile.js

```javascript

  var gulp   = require('gulp')
    , turbo  = require('gulp-turbo')
    ;

```

#### 3.配置项目(创建project-conf.json)
> 注意:json文件里面不能有注释

```
{
  //路由路径:比如将项目访问根目录127.0.0.1改为虚拟路径http://127.0.0.1/tech-bs
  "routerPath": "/tech-bs",

  //项目文件夹根目录名称
  "approot": "app",

  //默认开发模式
  "distMode": "dev",

  //静态资源域名(需要将此域名绑定本服务器hosts)。项目中的静态资源都是以带有域名的绝对路径引用的,将会用到这个配置。
  "domain": "//xxx.bbb.com",

  //是否启用透明代理
  "isLucencyProxy": true,

  //自动刷新浏览器。用于调试 true是开启，将会在页面注入一个js用来做实时通讯。
  "forceLivereload": true,
  
  //是否去除资源文件名重命名为hash后缀的处理，默认是带有hash后缀的。例如：demo-fab59d1421.js
  "isRemoveHash": false,
  
  //默认端口
  "httpPort": 80,

  //反向代理，用于共享 httpPort 端口
  "serverProxies": [{

    //如果用户访问这个路径，如 http://127.0.0.1/tech-bs/abc, 相当与访问 target设置的http路径,但还是走httpPort端口
    "source": "/tech-bs/abc",
    "target": "http://127.0.0.1:8080/tech-bs/abc",
    "options": {
      //请求头
      "headers": {
        "ABC_HEADER": "abc"
      }
    }
  }, {
    "source": "/tech-bs/aaa",
    "target": "http://127.0.0.1:8081/tech-bs/aaa"
  }],

  // 代理服务器端口。 通常用于调试移动端，抓包，替换请求. 类似fiddler或者charlse
  "proxyPort": 8989,

  //代理规则(支持正则，可以设置多个规则)
  "proxyRule": [{

    // 替换规则
    "pattern": "xxx.b.com/skyfire/ssu/editBefore1",

    // 用于响应的文件
    "responder": "/Users/kings/didi/prod/fe-scaffold-v1/app/dev/html/page1.html"
  }]
}
```
#### 4.运行
> 注意:
> 1. mac监听1024以下端口通常需要 sudo gulp
> 2. 访问路径为 http://127.0.0.1/ +routerPath  例：http://127.0.0.1/tech-bs
> 3. 启动服务后，将持续监听src下的目录文件变化，自动编译。
> 4. gulp启动服务后，命令窗口不能关闭。想要实现关闭命令行服务继续运行，可以执行  nohup gulp &

```shell

  #创建文件夹
  gulp init

  #启动服务
  gulp

```

## 运行example


```shell
    git clone git@github.com:ian000/gulp-turbo.git
    cd gulp-turbo
    npm i
    cd example
    npm i
    gulp (注意:mac监听1024以下端口通常需要 sudo gulp)

```

####  快速构建前端项目目录

```shell

gulp init

```
#### 提供易于开发、调试的开发联调环境（支持预编译语言jade,stylus,coffee）  

运行默认环境 dev

```shell

gulp

```

#### 提供基于requirejs的实时打包服务。

运行编译环境 dist, 用于上线

```shell

gulp dist

```

#### 提供http server, 支持mock接口数据功能。

```text

按照后端接口，在mock目录下按层级创建json文件.详细请参考现存的mock数据路径。

```

#### 提供80端口代理、转发功能

```json

 在package.json文件中设置转发规则。
 e.g :

 "serverProxies":[
              {
                "source": "/tech-bs/abc",
                "target": "http://127.0.0.1:8080/tech-bs/abc",
                "options": {
                  "headers": {
                    "ABC_HEADER": "abc"
                    }
                  }
              },
              {
                "source": "/tech-bs/aaa",
                "target": "http://127.0.0.1:8081/tech-bs/aaa"
              }
            ]
  当访问 http://127.0.0.1/tech-bs/abc 时，会命中第一条代理规则，转发到 8080端口对应的路径。
  这对于并行开发多个项目很有用。

```

#### 提供透明代理（即：线下不存在的资源，直接抓取线上）

#### 便捷的移动端调试（默认开启htpp代理服务，端口8989,可以代替fiddler或charles.）

``` 
// 代理服务器端口。 通常用于调试移动端，抓包，替换请求. 类似fiddler或者charlse
  "proxyPort": 8989,

  //代理规则(支持正则，可以设置多个规则)
  "proxyRule": [{

    // 替换规则
    "pattern": "xxx.b.com/skyfire/ssu/editBefore1",

    // 用于响应的文件
    "responder": "/Users/kings/didi/prod/fe-scaffold-v1/app/dev/html/page1.html"
  }]

``` 

#### 支持https

在https项目里面，静态资源服务就需要支持https。

在turbo里支持https服务很简单。只需要在project-conf.json里面将 https属性设置为ture，重启服务即可。

注意：https默认端口为 443, 由于本地没有https证书，第一次运行，需要在浏览器下点选“信任证书”。如果没有提示，请在浏览器打开静态资源请求，届时会弹出警告，选择信任即可。

#### 问题列表

  1. [- 使用turbo，前后端如何联调页面?](https://github.com/ian000/gulp-turbo/wiki/%E4%BD%BF%E7%94%A8turbo%EF%BC%8C%E5%89%8D%E5%90%8E%E7%AB%AF%E5%A6%82%E4%BD%95%E8%81%94%E8%B0%83%E9%A1%B5%E9%9D%A2)
  1. [- 如何设置浏览器代理?](https://github.com/ian000/gulp-turbo/wiki/%E5%A6%82%E4%BD%95%E8%AE%BE%E7%BD%AE%E6%B5%8F%E8%A7%88%E5%99%A8%E4%BB%A3%E7%90%86)
  1. [- 手动安装chrome代理插件：SwitchyOmega](http://jingyan.baidu.com/article/11c17a2c121c0ff446e39d16.html)


#### change log
    [05.18] - 解决本地静态server在IE9以上访问时css文件未被识别而忽略渲染，导致页面样式出不来的bug
    [05.12] - 解决之前loder模式的bug，更新README文档
    [04.25] - 编译jade模板(包含html、js)时注入wwwroot参数, dev模式下解除了与domain的耦合
    [04.19] - 修改线上透明代理逻辑，不再需要vhost配置，增加一个是否开启透明代理的开关配置isLucencyProxy
    [03.26] - 添加css autoprefixer
    [03.09] - 调整loder，针对loder逻辑透明化处理，并重新整合静态资源。此次调整新建为2.x.x分支，不兼容之前版本(<2.0.0)。
    [02.19] - js资源文件名添加MD5后缀形式，对应调整loder，每次dist时添加clean操作，会清除dist和dev目录
    [02.18] - 支持https
    [01.27] - 修复watch中存在的bug，任务出现错误流中断时，任务不会结束且不能再次触发的问题
    [01.15] - 优化dist执行过去，添加文件缓存，再次执行dist时，未变更文件将直接从文件缓存中提取，加快dist执行时间
    [01.12] - 添加静态资源管理css、image部分支持
    [01.08] - 修复透明代理
    [01.04] - 减掉$CONFIG需要指定entryPath的配置，修改页面loder伴生文件的引用，入口文件将由页面引用的loder伴生文件名决定。
            - 去掉dist模式时的livereload
    
    [2015~]
    [12.29] - 新增静态资源加载器（js部分）
            - 新增entry文件夹，支持子目录
            - 抽离了require配置文件
    [12.11] - 优化dist模式，js压缩时添加md5变更匹配
            - 新加tasks任务，展示可用任务信息；gulp默认default任务改为dev
            - 解决dist模式下watch不能实时压缩的问题；引入coffee-script，使用时需要再coffee register
    [12.10] - 优化gulpfile,减少依赖，使用更方便，直接引入便可
    [12.03] -【里程碑】将脚手架包装成npm组件
            - 加入json文件校验
            - 为解决gulpfile.coffe以后的维护问题，拆分gulpfile.coffe到gulp文件夹
            - 压缩css、js时，添加处理文件的log信息输出
    [12.02] - 在gulp dist之前不需要先执行gulp dev了
    [11.16] - svnChanges任务修改，过滤掉文件夹和删除的变更记录
    [11.12] - 提供80端口代理、转发功能
            - 新增svnChanges任务，获取svn log中的change list, 以便用于填写上线单
    [11.10] - 在dist模式下，增加sourcemaps支持
    [11.09] - 抽离配置文件到package.json中
    [11.06] - 新增图片文件夹
            - 支持透明代理
            - 支持代理
    [11.05] - 修复dist模式
    [11.04] - 新增page_$config.json
            - 自动配置页面内的wwwroot

#### TODOS
  1. 将资源合并，构建组件化机制。

#### Contributors
<img src="https://avatars3.githubusercontent.com/u/3196171?v=3&s=40">  [赵新](https://github.com/ian000)  
<img src="https://avatars1.githubusercontent.com/u/6636353?v=3&s=40">  [王江伟](https://github.com/RK-WJW)
