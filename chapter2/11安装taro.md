

# 鸿蒙Taro实战：01-搭建开发环境

## 配置鸿蒙环境

### 下载安装 DevEco

使用最新的IDE就好，目前是5.0.5Release版本。

## 创建鸿蒙项目

打开 DevEco，点击 右上角`Create Project`， 在 `Application` 处选择 `Empty Ablity`, 点击 `Next`, 进入配置页，根据需求调整内容，这里使用默认配置，

1. Project name: `tarooh`,
2. Bundle name: `com.nutpi.taro`,
3. Save location 选择需要创建的目录，这里使用 tarooh 目录 （~/test/tarooh)
4. Compatible SDK, 选择 **5.0.0**
5. Module name: entry

注意，上面当前 Taro 支持的 SDK 版本为 4.0.0

点击 `Finish` 完成项目创建。

## 安装 Taro 4.1

```bash
npm install -g @tarojs/cli
```



安装成功后检查 `taro` 是否生效

```
jianguo@localhost test % taro --version                           
👽 Taro v4.1.0

4.1.0
```



![image-20250516205707017](/Users/jianguo/Library/Application Support/typora-user-images/image-20250516205707017.png)



## 初始化项目

```bash
taro init taro-ohos
```

按照提示输入，这里使用以下配置

注意：当前仅支持使用 Vite 编译鸿蒙应用，所以在后面配置的时候要注意。

```bash
? 请输入项目介绍 taro ohos
? 请选择框架 React
? 是否需要使用 TypeScript ？ Yes
? 请选择 CSS 预处理器（Sass/Less/Stylus） Sass
? 请选择包管理工具 yarn
? 请选择编译工具 Vite
? 请选择模板源 Gitee（最快）
✔ 拉取远程模板仓库成功！
? 请选择模板 默认模板
```



等待项目创建成功，直到输出以下提示：

```bash
Done in 44.95s.
✔ 安装项目依赖成功
创建项目 taro-ohos 成功！
请进入项目目录 taro-ohos 开始工作吧！😝
```

注意：当前仅支持使用 Vite 编译鸿蒙应用





![image-20250516212812944](https://nutpi-e41b.obs.cn-north-4.myhuaweicloud.com/image-20250516212812944.png)



### 安装鸿蒙插件

```
 cd taro-ohos 
```

然后

```bash

# 使用 npm 安装
$ npm i @tarojs/plugin-platform-harmony-cpp
# 使用 pnpm 安装
$ pnpm i @tarojs/plugin-platform-harmony-cpp
```

### 修改编译配置

找到 `config/index.ts` 文件, 在 plugin 处添加 `@tarojs/plugin-platform-harmony-cpp`, 在 `rn` 下方添加 harmony 配置：

```bash
import os from 'os'
import path from 'path'

const config = {
  // ...
  plugin: ['@tarojs/plugin-platform-harmony-cpp'],
  harmony: {
    // 当前仅支持使用 Vite 编译鸿蒙应用
    compiler: 'vite',
    // Note: 鸿蒙工程路径，可以参考 [鸿蒙应用创建导读](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides-V2/start-with-ets-stage-0000001477980905-V2) 创建
    projectPath: path.join(os.homedir(), '../tarooh'),
    // Taro 项目编译到对应鸿蒙模块名，默认为 entry
    hapName: 'entry',
  },
  // ...
}
```

注意这里要把 projectPath 设置成 Deveco 创建的鸿蒙项目目录

## 编译鸿蒙应用

```bash
# 编译鸿蒙应用
$ taro build --type harmony_cpp
# 编译鸿蒙原生组件
$ taro build native-components --type harmony_cpp
```

如果需要编译鸿蒙应用，同时使用编译鸿蒙原生组件，可以在页面配置中添加 `entryOption: false` 表示该页面是组件，同时可以用过 `componentName` 指定组件导出名。

```diff
export default {
  navigationBarTitleText: 'Hello World',
+  componentName: 'MyComponent',
+  entryOption: false,
}
```

Taro 会将编译好的文件输出至鸿蒙项目目录.

## 运行鸿蒙

### 配置应用签名

打开 `File` -> `Project Structure...`, 点击 `Siging Configs`, `Sign In`, 登陆华为账号，点击右下角 `Apply`, `OK`, 完成签名

### 运行

在 DevEcho 中，点击运行按钮，

### 效果

## FAQ

### 不存在编译平台 ${platform}

运行 Taro 时报错 `throw new Error(`不存在编译平台 ${platform}`)`，config/index.ts文件中没有添加 `@tarojs/plugin-platform-harmony-cpp`

###  EPERM: operation not permitted

遇到如图所示的问题如何解决

```js
jianguo@localhost test % sudo npm install -g @tarojs/cli
Password:
npm ERR! code EPERM
npm ERR! syscall mkdir
npm ERR! path /Applications/DevEco-Studio.app/Contents/tools/node/lib/node_modules/@tarojs
npm ERR! errno -1
npm ERR! Error: EPERM: operation not permitted, mkdir '/Applications/DevEco-Studio.app/Contents/tools/node/lib/node_modules/@tarojs'
npm ERR!  [Error: EPERM: operation not permitted, mkdir '/Applications/DevEco-Studio.app/Contents/tools/node/lib/node_modules/@tarojs'] {
npm ERR!   errno: -1,
npm ERR!   code: 'EPERM',
npm ERR!   syscall: 'mkdir',
npm ERR!   path: '/Applications/DevEco-Studio.app/Contents/tools/node/lib/node_modules/@tarojs'
npm ERR! }
npm ERR! 
npm ERR! The operation was rejected by your operating system.
npm ERR! It is likely you do not have the permissions to access this file as the current user
npm ERR! 
npm ERR! If you believe this might be a permissions issue, please double-check the
npm ERR! permissions of the file and its containing directories, or try running
npm ERR! the command again as root/Administrator.


```





![image-20250516205607385](https://nutpi-e41b.obs.cn-north-4.myhuaweicloud.com/image-20250516205607385.png)

执行下面的命令就可以。



```bash
mkdir -p ~/.npm-global/lib/node_modules
npm config set prefix '~/.npm-global'

npm install -g @tarojs/cli
```

![image-20250516205707017](https://nutpi-e41b.obs.cn-north-4.myhuaweicloud.com/image-20250516205707017.png)

## 参考资料

- [鸿蒙 & OpenHarmony](https://docs.taro.zone/docs/next/harmony/)

- [Taro 项目仓库](https://github.com/NervJS/taro)
- [Taro 官方文档](https://docs.taro.zone/docs)
- [Taro UI 项目仓库](https://github.com/NervJS/taro-ui)
- [Taro UI 官方文档](https://taro-ui.jd.com/)



## Taro 仓库概览

以下列表介绍了 Taro 由哪些 NPM 包所组成，以及每个包的功能

| 路径                     | 描述                                              |
| ------------------------ | ------------------------------------------------- |
| `@tarojs/cli`            | CLI 工具                                          |
| `@tarojs/service`        | 插件化内核                                        |
| `@tarojs/taro-loader`    | Webpack loaders                                   |
| `@tarojs/helper`         | 工具库，主要供 CLI、编译时使用                    |
| `@tarojs/runner-utils`   | 工具库，主要供小程序、H5 的编译工具使用           |
| `@tarojs/shared`         | 工具库，主要供运行时使用                          |
| `@tarojs/taro`           | 暴露各端所需要的 Taro 对象                        |
| `@tarojs/api`            | 和各端相关的 Taro API                             |
| `babel-preset-taro`      | Babel preset                                      |
| `eslint-config-taro`     | ESLint 规则                                       |
| `postcss-pxtransform`    | PostCSS 插件，转换 `px` 为各端的自适应尺寸单位    |
| `postcss-html-transform` | PostCSS 插件，用于 HTML、小程序标签的类名相互转换 |

## 坚果派

坚果派社区由坚果、小波、狼哥等人创建，团队拥有数位华为HDE及1000+HarmonyOS开发者，以及若干其他领域的三十余位万粉博主/UP主运营。

专注于分享的技术包括HarmonyOS/OpenHarmony、仓颉、ArkUI-X、元服务、AI、BlueOS操作系统等。团队成员主要聚集在北京，上海，南京，深圳，广州，苏州、长沙、宁夏等地，目前已为华为、vivo、腾讯、亚马逊以及三方技术社区提供各类开发咨询服务100+。累计粉丝100+w，孵化开发者10w+，高校20+、企业10+。自研应用40款，三方库80个，鸿蒙原生应用课程500+。持续助力鸿蒙仓颉等生态繁荣发展。欢迎大家加入。



