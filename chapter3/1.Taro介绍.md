# 鸿蒙版Taro渐进式入门教程

## Taro 介绍

Taro 是由京东发起并维护的开放式跨端跨框架解决方案，支持以 Web 的开发范式来实现小程序、H5、原生 APP 的跨端统一开发，从 18 年开源至今，在 GitHub 已累计获得 36,000+ Stars。

## 环境准备

目前 Taro 仅提供一种开发方式：安装 Taro 命令行工具（Taro CLI）进行开发。

Taro CLI 依赖于 Node.js 环境，所以在你的机器上必须安装 Node.js 环境。安装 Node.js 环境有很多种方法，如果你完全不了解 Node.js 可以访问 [Node.js 官网](https://nodejs.org/en/) 下载一个可执行程序进行安装。请确保已具备较新的 node 环境（>=16.20.0）。

当你的机器已经存在了 Node.js 环境，可以通过在终端输入命令 `npm i -g @tarojs/cli` 安装 Taro CLI。安装完毕之后，在终端输入命令 `taro`，如果出现类似内容就说明安装成功了：

```
jianguo@nutpi fvmdemo % taro --version 
👽 Taro v4.1.1

4.1.1
```

### 编辑器

推荐使用 [VSCode](https://code.visualstudio.com/) 

当你使用 VSCode 时，推荐安装 [ESLint 插件](https://marketplace.visualstudio.com/items?itemName=dbaeumer.vscode-eslint)，如果你使用 TypeScript，别忘了配置 `eslint.probe` 参数。如果使用 Vue，推荐安装 [Vetur](https://marketplace.visualstudio.com/items?itemName=octref.vetur) 插件。安装了上述插件之后使用 Taro 都实现自动补全和代码实时检查（linting）的功能。

### 终端

#### macOS/Linux

在 *nix 系统中终端模拟器使用什么工具（Terminal/iTerm2/Konsole/Hyper/etc..）并不重要，但运行 Taro CLI 的 shell 我们推荐使用 `bash` 或 `zsh`。

#### Windows

在 Windows 中我们推荐使用内置的 `cmd` 或 `PowerShell`。如果有条件推荐安装 [WSL](https://docs.microsoft.com/zh-cn/windows/wsl/install-win10) 并使用 Linux 分发版的终端运行 Taro CLI。由于 Taro 的开发团队和 CI 都只运行或测试 *nix 系统，部分 Windows 极端情况或许没能考虑到，导致出现 Bug。

## 基础教程

安装好 Taro CLI 之后可以通过 `taro init` 命令创建一个全新的项目，你可以根据你的项目需求填写各个选项，一个最小版本的 Taro 项目会包括以下文件：

```
├── babel.config.js             # Babel 配置
├── .eslintrc.js                # ESLint 配置
├── config                      # 编译配置目录
│   ├── dev.js                  # 开发模式配置
│   ├── index.js                # 默认配置
│   └── prod.js                 # 生产模式配置
├── package.json                # Node.js manifest
├── dist                        # 打包目录
├── project.config.json         # 小程序项目配置
├── src # 源码目录
│   ├── app.config.js           # 全局配置
│   ├── app.css                 # 全局 CSS
│   ├── app.js                  # 入口组件
│   ├── index.html              # H5 入口 HTML
│   └── pages                   # 页面组件
│       └── index
│           ├── index.config.js # 页面配置
│           ├── index.css       # 页面 CSS
│           └── index.jsx       # 页面组件，如果是 Vue 项目，此文件为 index.vue
```

我们以后将会讲解每一个文件的作用，但现在，我们先把注意力聚焦在 `src` 文件夹，也就是源码目录：

### 入口组件

每一个 Taro 项目都有一个入口组件和一个入口配置，我们可以在入口组件中设置全局状态/全局生命周期，一个最小化的入口组件会是这样：

src/app.js

```react
import React, { Component } from 'react'
import './app.css'

class App extends Component {
  render() {
    // this.props.children 是将要会渲染的页面
    return this.props.children
  }
}

// 每一个入口组件都必须导出一个 React 组件
export default App
```

每一个入口组件（例如 `app.js`）总是伴随一个全局配置文件（例如 `app.config.js`），我们可以在全局配置文件中设置页面组件的路径、全局窗口、路由等信息，一个最简单的全局配置如下：

src/app.config.js

```
export default {
  pages: ['pages/index/index'],
}
```

注意我们必须保证配置文件是在 Node.js 环境中是可以执行的，不能使用一些在 H5 环境或小程序环境才能运行的包或者代码，否则编译将会失败

### 页面组件

页面组件是每一项路由将会渲染的页面，Taro 的页面默认放在 `src/pages` 中，每一个 Taro 项目至少有一个页面组件。在我们生成的项目中有一个页面组件：`src/pages/index/index`，细心的朋友可以发现，这个路径恰巧对应的就是我们[全局配置](https://docs.taro.zone/docs/app-config)的 `pages` 字段当中的值。一个简单的页面组件如下

src/pages/index/index.jsx

```react
import { View } from '@tarojs/components'
class Index extends Component {
  state = {
    msg: 'Hello World!',
  }

  onReady() {
    console.log('onReady')
  }

  render() {
    return <View>{this.state.msg}</View>
  }
}

export default Index
```

1. `onReady` 生命周期函数。这是来源于微信小程序规范的生命周期，表示组件首次渲染完毕，准备好与视图交互。Taro 在运行时将大部分小程序规范页面生命周期注入到了页面组件中，同时 React 或 Vue 自带的生命周期也是完全可以正常使用的。
2. `View` 组件。这是来源于 `@tarojs/components` 的跨平台组件。相对于我们熟悉的 `div`、`span` 元素而言，在 Taro 中我们要全部使用这样的跨平台组件进行开发。

和入口组件一样，每一个页面组件（例如 `index.vue`）也会有一个页面配置（例如 `index.config.js`），我们可以在页面配置文件中设置页面的导航栏、背景颜色等参数，一个最简单的页面配置如下：

src/pages/index/index.config.js

```
export default {
  navigationBarTitleText: '首页',
}
```

Taro 的页面钩子函数和页面配置规范是基于微信小程序而制定的，并对全平台进行统一。 你可以通过访问 [React 页面组件](https://docs.taro.zone/docs/react-page) 了解全部页面钩子函数和页面配置规范。

### 自定义组件

如果你看到这里，那不得不恭喜你，你已经理解了 Taro 中最复杂的概念：入口组件和页面组件，并了解了它们是如何（通过配置文件）交互的。接下来的内容，

我们先把首页写好，首页的逻辑很简单：把论坛最新的帖子展示出来。

src/pages/index/index.jsx



```react
import Taro from '@tarojs/taro'
import React from 'react'
import { View } from '@tarojs/components'
import { ThreadList } from '../../components/thread_list'
import api from '../../utils/api'

import './index.css'

class Index extends React.Component {
  config = {
    navigationBarTitleText: '首页',
  }

  state = {
    loading: true,
    threads: [],
  }

  async componentDidMount() {
    try {
      const res = await Taro.request({
        url: api.getLatestTopic(),
      })
      this.setState({
        threads: res.data,
        loading: false,
      })
    } catch (error) {
      Taro.showToast({
        title: '载入远程数据错误',
      })
    }
  }

  render() {
    const { loading, threads } = this.state
    return (
      <View className="index">
        <ThreadList threads={threads} loading={loading} />
      </View>
    )
  }
}

export default Index
```

可能你会注意到在一个 Taro 应用中发送请求是 `Taro.request()` 完成的。 和页面配置、全局配置一样，Taro 的 API 规范也是基于微信小程序而制定的，并对全平台进行统一。 你可以通过在 [API 文档](https://docs.taro.zone/docs/apis/about/desc) 找到所有 API。

在我们的首页组件里，还引用了一个 `ThreadList` 组件，我们现在来实现它：

src/components/thread_list.jsx

```react
import React from 'react'
import { View, Text } from '@tarojs/components'
import { Thread } from './thread'
import { Loading } from './loading'

import './thread.css'

class ThreadList extends React.Component {
  static defaultProps = {
    threads: [],
    loading: true,
  }

  render() {
    const { loading, threads } = this.props

    if (loading) {
      return <Loading />
    }

    const element = threads.map((thread, index) => {
      return (
        <Thread
          key={thread.id}
          node={thread.node}
          title={thread.title}
          last_modified={thread.last_modified}
          replies={thread.replies}
          tid={thread.id}
          member={thread.member}
        />
      )
    })

    return <View className="thread-list">{element}</View>
  }
}

export { ThreadList }
```





## 参考

https://docs.taro.zone/docs/guide#%E5%A4%9A%E7%AB%AF%E5%BC%80%E5%8F%91