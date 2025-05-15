 [Flutter Engine](https://gitee.com/openharmony-sig/flutter_engine)

本仓库是基于flutter官方engine仓库拓展，可构建支持在OpenHarmony设备上运行的flutter engine程序。

本文主要带大家编译engine





## 环境介绍

- Mac M1,Ventura 13.4.1
- DevEco Studio NEXT Developer Beta1
- HarmonyOS next Developer Beta1(5.0.0(12))
- java version "11.0.18" 2023-01-17 LTS
- Python 3.11.6 ([www.python.org/downloads/r…](https://link.juejin.cn?target=https%3A%2F%2Fwww.python.org%2Fdownloads%2Frelease%2Fpython-3116%2F))
- 手机：Mate 60 (HarmonyOS NEXT Developer Beta1)

## 1、基本软件安装配置

```arduino
brew reinstall python@3.11
brew install pkg-config
brew install ninja
```

## 2、配置node环境变量

```bash

export NODE_HOME=/opt/homebrew/Cellar/node/21.7.1
export PATH=$NODE_HOME/bin:$PATH
```

## 3、配置gclient环境变量

```bash
git clone https://chromium.googlesource.com/chromium/tools/depot_tools.git
```

然后添加

```
export PATH=/path/to/depot_tools:$PATH
```





## 4、创建仓库配置文件

配置文件：创建空文件夹engine，engine内新建.gclient文件，编辑文件：

```
solutions = [
  {
    "managed": False,
    "name": "src/flutter",
    "url": "git@gitee.com:openharmony-sig/flutter_engine.git",
    "custom_deps": {},
    "deps_file": "DEPS",
    "safesync_url": "",
  },
]

```

## 5、同步代码

在engine目录，执行`gclient sync`；这里会同步engine源码、官方packages仓，还有执行ohos_setup任务； 大概有20G的东西。



## 6、配置鸿蒙SDK环境变量

```ruby
# HarmonyOS SDK，解压开发套件包中 sdk/xxSDK.zip 之后的目录
export HOS_SDK_HOME=/home/<user>/ohos/sdk

# 解压开发套件包中 commandline/commandline-tools-xxxx.zip 之后 bin 子目录
export PATH=$PATH:/home/<user>/ohos/command-line-tools/bin
```



## 7、编译引擎

在engine目录，执行`./ohos`，即可开始构建支持ohos设备的flutter engine。

## 8.更新代码

在engine目录，执行`./ohos -b master`



到此我们整个引擎编译完成。



## 参考

https://juejin.cn/post/7369519814640123919