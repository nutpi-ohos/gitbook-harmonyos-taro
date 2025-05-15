## Flutter 框架介绍

Flutter是谷歌的高性能、跨端UI框架，可以通过一套代码，支持iOS、Android、Windows/MAC/Linux等多个平台，且能达到原生性能。 Flutter也可以与平台原生代码进行混合开发。在全世界，Flutter正在被越来越多的开发者和组织使用，并且Flutter是完全免费、开源的。

本次我们这部分是基于社区版本3.7所编写，之前在做鸿蒙原生应用开发布道的时候，很多人都对Flutter适配鸿蒙比较感兴趣，这不就来了。

这里大家要了解到的就是Flutter是框架，开发语言是Dart，类似于鸿蒙原生应用开发中，ArkUI是框架，ArkTS是开发语言。



## Flutter架构

Flutter 被设计为一个可扩展的分层系统。它可以被看作是各个独立的组件的系列合集，上层组件各自依赖下层组件。组件无法越权访问更底层的内容，并且框架层中的各个部分都是可选且可替代的。每一块都各司其职，负责自己的模块。

![Architectural diagram](https://luckly007.oss-cn-beijing.aliyuncs.com/uPic/archdiagram.png)

接下来就是环境配置

## 鸿蒙版Flutter环境搭建

flutter_flutter项目，这是我们整个工程的核心，但是很多人都倒在了第一步，其原因，就是——需要使用Dev分支！！！

https://gitee.com/openharmony-sig/flutter_flutter/tree/dev/

### 注意事项

（1）目前支持操作系统Linux、Mac、Windows环境下使用
（2）mac系统在终端输入"uname -m"判断系统架构选择对应的开发组件套
   如果输出结果是 x86_64，则表示你的系统是x86-64架构
   如果输出结果是 arm64，则表示你的系统是arm64架构
（3）IDE使用官方下载地址
   最新套件更加稳定，性能更佳，且鸿蒙Flutter需要依赖最新套件编译 

我们此次也是以mac和windows为例来展开。

### 下载并安装鸿蒙最新开发套件

鸿蒙开发套件官方下载地址：[https://developer.huawei.com/consumer/cn/download/](https://developer.huawei.com/consumer/cn/download/)

###  下载鸿蒙版flutter

项目地址：https://gitee.com/openharmony-sig/flutter_flutter

通过代码工具下载仓库代码并指定dev或master分支，dev不断在更新相比master拥有更多功能

```
 git clone https://gitee.com/openharmony-sig/flutter_flutter.git
 git checkout -b dev origin/dev
```

### 环境变量配置

open  ~/.bash_profile

```


export TOOL_HOME= /Applications/DevEco-Studio2.app/Contents 
export DEVECO_SDK_HOME=$TOOL_HOME/sdk 
export PATH=$TOOL_HOME/tools/ohpm/bin:$PATH 
export PATH=$TOOL_HOME/tools/hvigor/bin:$PATH 
export PATH=$TOOL_HOME/tools/node/bin:$PATH 
export PATH=/Users/jianguo/huawei/flutter_flutter/bin:$PATH
export PUB_HOSTED_URL=https://pub.flutter-io.cn
export FLUTTER_STORAGE_BASE_URL=https://storage.flutter-io.cn

```



然后刷新一下

```
 source ~/.bash_profile
```

这里面注意的就是找到DevEco-Studio的安装目录，因为我是本地有两个安装目录，所以这样配置。

配置完以后，我们就可以运行Flutter doctor -v来检测环境变量是否OK。

![image-20240713183555890](https://luckly007.oss-cn-beijing.aliyuncs.com/uPic/image-20240713183555890.png)

通过上面也可以看到，我们的环境配置OK

```
jianguo@jianguodeMacBook-Pro-2 harmonyflutter % flutter doctor -v 
[✓] Flutter (Channel stable, 3.13.0, on macOS 13.4.1 22F82 darwin-arm64, locale zh-Hans-CN)
    • Flutter version 3.13.0 on channel stable at /Users/jianguo/development/flutter
    • Upstream repository https://github.com/flutter/flutter.git
    • Framework revision efbf63d9c6 (11 个月前), 2023-08-15 21:05:06 -0500
    • Engine revision 1ac611c64e
    • Dart version 3.1.0
    • DevTools version 2.25.0
    • Pub download mirror https://pub.flutter-io.cn
    • Flutter download mirror https://storage.flutter-io.cn

[✓] Android toolchain - develop for Android devices (Android SDK version 34.0.0)
    • Android SDK at /Users/jianguo/Library/Android/sdk
    • Platform android-34, build-tools 34.0.0
    • ANDROID_HOME = /Users/jianguo/Library/Android/sdk
    • Java binary at: /Applications/Android Studio.app/Contents/jbr/Contents/Home/bin/java
    • Java version OpenJDK Runtime Environment (build 17.0.6+0-17.0.6b829.9-10027231)
    • All Android licenses accepted.

[✓] Xcode - develop for iOS and macOS (Xcode 14.3.1)
    • Xcode at /Applications/Xcode.app/Contents/Developer
    • Build 14E300c
    • CocoaPods version 1.11.0

[✓] Chrome - develop for the web
    • Chrome at /Applications/Google Chrome.app/Contents/MacOS/Google Chrome

[✓] Android Studio (version 2022.3)
    • Android Studio at /Applications/Android Studio.app/Contents
    • Flutter plugin can be installed from:
      🔨 https://plugins.jetbrains.com/plugin/9212-flutter
    • Dart plugin can be installed from:
      🔨 https://plugins.jetbrains.com/plugin/6351-dart
    • Java version OpenJDK Runtime Environment (build 17.0.6+0-17.0.6b829.9-10027231)

[✓] VS Code (version 1.90.2)
    • VS Code at /Applications/Visual Studio Code.app/Contents
    • Flutter extension version 3.92.0

[✓] Connected device (2 available)
    • macOS (desktop) • macos  • darwin-arm64   • macOS 13.4.1 22F82 darwin-arm64
    • Chrome (web)    • chrome • web-javascript • Google Chrome 126.0.6478.127

[✓] Network resources
    • All expected network resources are available.

• No issues found!

```



## 项目创建

创建工程与编译命令，编译产物在${projectName}/ohos/entry/build/default/outputs/default/entry-default-signed.hap下

```
# 创建工程 方式一 该方式只创建了ohos平台
flutter create --platforms ohos <projectName> 

# 创建工程 方式二 该方式创建了android,ios,ohos三个平台
flutter create  <projectName> 

# 进入工程根目录编译hap包
flutter build hap --local-engine=/Users/lihui/Documents/flutter_engine/src/out/ohos_debug_unopt_arm64 --debug
```



这里我采用第一种，

```
flutter create --platforms ohos fluttertoharmony
```



如下图所示，项目创建成功。

![image-20240713172714711](https://luckly007.oss-cn-beijing.aliyuncs.com/uPic/image-20240713172714711.png)

```
jianguo@jianguodeMacBook-Pro-2 teaching % flutter create --platforms ohos harmonyflutter
Creating project harmonyflutter...
Running "flutter pub get" in harmonyflutter...
Resolving dependencies in harmonyflutter... 
+ async 2.10.0 (2.11.0 available)
+ boolean_selector 2.1.1
+ characters 1.2.1 (1.3.0 available)
+ clock 1.1.1
+ collection 1.17.0 (1.19.0 available)
+ cupertino_icons 1.0.6 (1.0.8 available)
+ fake_async 1.3.1
+ flutter 0.0.0 from sdk flutter
+ flutter_lints 2.0.3 (4.0.0 available)
+ flutter_test 0.0.0 from sdk flutter
+ js 0.6.5 (0.7.1 available)
+ lints 2.0.1 (4.0.0 available)
+ matcher 0.12.13 (0.12.16+1 available)
+ material_color_utilities 0.2.0 (0.12.0 available)
+ meta 1.8.0 (1.15.0 available)
+ path 1.8.2 (1.9.0 available)
+ sky_engine 0.0.99 from sdk flutter
+ source_span 1.9.1 (1.10.0 available)
+ stack_trace 1.11.0 (1.11.1 available)
+ stream_channel 2.1.1 (2.1.2 available)
+ string_scanner 1.2.0 (1.3.0 available)
+ term_glyph 1.2.1
+ test_api 0.4.16 (0.7.3 available)
+ vector_math 2.1.4
Changed 24 dependencies in harmonyflutter!
Wrote 43 files.

All done!
You can find general documentation for Flutter at: https://docs.flutter.dev/
Detailed API documentation is available at: https://api.flutter.dev/
If you prefer video documentation, consider: https://www.youtube.com/c/flutterdev

In order to run your application, type:

  $ cd harmonyflutter
  $ flutter run

Your application code is in harmonyflutter/lib/main.dart.
```





```
flutter build hap --local-engine=/Users/jianguo/huawei/flutter_engine/src/out/ohos_debug_unopt_arm64 --debug
```

## 项目编译与运行

通过flutter devices指令发现真机设备之后，获取device-id



方式一：进入项目目录指定构建方式编译hap包并安装到鸿蒙手机中

```
 flutter run --debug --local-engine=/Users/jianguo/huawei/flutter_engine/src/out/ohos_debug_unopt_arm64  -d <deviceId>
```

方式二：进入工程根目录编译hap包,然后安装到鸿蒙手机中

```
flutter build hap --local-engine=/Users/jianguo/huawei/flutter_engine/src/out/ohos_debug_unopt_arm64  --debug

hdc -t <deviceId> install <hap file path>
```

方式三：使用DevEcoStudio 选择设备为真机，点击启动

运行后的效果，如图所示

![image-20240713175215412](https://luckly007.oss-cn-beijing.aliyuncs.com/uPic/image-20240713175215412.png)

今天这篇文章就到此结束，到目前为止，鸿蒙Flutter工程已经初具雏形，整体的适配效果还是不错的。

最后和大家说一下鸿蒙Flutter开发的开发方式。

## 鸿蒙Flutter开发

鸿蒙Flutter开发有两种模式，一种是以纯Flutter工程为主，即上面的这种模式，鸿蒙代码写在Flutter工程中，另一种是和Android、iOS开发类似，通过依赖鸿蒙Flutter的编译产物har来进行开发。

从技术的角度来看，第一种方案会更加简单，因为鸿蒙的Native代码已经是申明式了，类似Compose了，所以在鸿蒙Native代码中使用Flutter页面是非常简单的一件事，甚至可以直接将FlutterPage()当作一个View直接使用，所以鸿蒙Flutter混编会比Android、iOS方便很多。

而另一种方式，通过产物进行依赖，这种方式更加符合三端统一的目标，也更适合团队进行解耦和协作。不过这种方式也有一些问题，那就是Flutter依赖的一些第三方库，同样是需要适配鸿蒙版的，所以在yaml中，相对正常的Flutter项目来说同样需要进行区分。这里最后我也给大家列出了Flutter的三方库的适配计划。

## 已兼容OpenHarmony开发的指令列表

| 指令名称   | 指令描述           | 使用说明                                                     |
| ---------- | ------------------ | ------------------------------------------------------------ |
| doctor     | 环境检测           | flutter doctor                                               |
| config     | 环境配置           | flutter config --<key> <value>                               |
| create     | 创建新项目         | flutter create --platforms ohos,android,ios --org <org> <appName> |
| create     | 创建module模板     | flutter create -t module <module_name>                       |
| create     | 创建plugin模板     | flutter create -t plugin --platforms ohos,android,ios <plugin_name> |
| create     | 创建plugin_ffi模板 | flutter create -t plugin_ffi --platforms ohos,android,ios <plugin_name> |
| devices    | 已连接设备查找     | flutter devices                                              |
| install    | 应用安装           | flutter install -t <deviceId> <hap文件路径>                  |
| assemble   | 资源打包           | flutter assemble                                             |
| build      | 测试应用构建       | flutter build hap --debug [--target-platform ohos-arm64] [--local-engine=<兼容ohos的debug engine产物路径>] |
| build      | 正式应用构建       | flutter build hap --release [--target-platform ohos-arm64] [--local-engine=<兼容ohos的release engine产物路径>] |
| run        | 应用运行           | flutter run [--local-engine=<兼容ohos的engine产物路径>]      |
| attach     | 调试模式           | flutter attach                                               |
| screenshot | 截屏               | flutter screenshot                                           |



## 参考

Flutter相关:
文档：https://gitee.com/openharmony-sig/flutter_samples/tree/master/ohos/docs
flutter sdk库
https://gitee.com/openharmony-sig/flutter_flutter
flutter engine扩展库
https://gitee.com/openharmony-sig/flutter_engine
flutter packages仓
https://gitee.com/openharmony-sig/flutter_packages
flutter sample
https://gitee.com/openharmony-sig/flutter_samples

对于Flutter的第三方库来说，社区也给出了适配的计划表

https://docs.qq.com/sheet/DVVJDWWt1V09zUFN2?tab=BB08J2



https://www.yuque.com/xuyisheng