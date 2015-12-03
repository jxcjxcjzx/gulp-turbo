# Turbo (涡轮增压器)
### 前端脚手架-v1
> 1. 快速构建前端项目
> 1. 提供易于开发、调试的开发联调环境，支持预编译语言（jade,stylus,coffee）
> 1. 提供基于requirejs的实时打包服务。
> 1. 提供http server, 支持mock接口数据功能。
> 1. 提供json文件自动校验
> 1. 提供80端口代理、转发功能
> 1. 提供透明代理（即：线下不存在的资源，直接抓取线上）
> 1. 提供代理服务（即：htpp代理服务，支持抓包和mapping本地文件，可以用来调试移动端）
> 1. 提供获取svn的change list工具, 以便用于填写上线单


#### change log
    [12.03] -【里程碑】将脚手架包装成npm组件
    [12.03] - 加入json文件校验
    [12.03] - 为解决gulpfile.coffe以后的维护问题，拆分gulpfile.coffe到gulp-tasks文件夹
    [12.03] - 压缩css、js时，添加处理文件的log信息输出
    [12.02] - 在gulp dist之前不需要先执行gulp dev了
    [11.16] - svnChanges任务修改，过滤掉文件夹和删除的变更记录
    [11.12] - 提供80端口代理、转发功能
    [11.12] - 新增svnChanges任务，获取svn log中的change list, 以便用于填写上线单
    [11.10] - 在dist模式下，增加sourcemaps支持
    [11.09] - 抽离配置文件到package.json中
    [11.06] - 新增图片文件夹
    [11.06] - 支持透明代理
    [11.06] - 支持代理
    [11.05] - 修复dist模式
    [11.04] - 新增page_$config.json
    [11.04] - 自动配置页面内的wwwroot

#### 安装（依赖node.js，npm）

```
npm i 或者 解压缩 node_modules.zip

```

####  快速构建前端项目

```
 gulp init

```
#### 提供易于开发、调试的开发联调环境（支持预编译语言jade,stylus,coffee）  

运行默认环境 dev

```
 gulp

```

#### 提供基于requirejs的实时打包服务。

运行编译环境 dist, 用于上线

```
 gulp dist


```

#### 提供http server, 支持mock接口数据功能。

```
 按照后端接口，在mock目录下按层级创建json文件.详细请参考现存的mock数据路径。

```

#### 提供80端口代理、转发功能

```
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

#### 问题列表

  [- 前后端如何联调?]()
  [- 如何设置浏览器代理?]()
  [- 手动安装chrome代理插件：SwitchyOmega]()

#### TODOS
  1. 将资源合并，构建组件化机制。
  1. dist文件夹内文件统一添加版本号问题
  1. 服务挂载

#### Contributors

<img src="https://avatars3.githubusercontent.com/u/3196171?v=3&s=460" height="20" width="20">  [赵新](https://github.com/ian000)  
<img src="xxx" height="20" width="20">  [王江伟]()