##  开发Flutter静态库

本节我们一起来看一下，开发Flutter静态库。

本节主要分为四个模块

1. 开发module
2. 开发package
3. 开发plugin
4. 开发FFI plugin

## 开发module

```
# 1. 创建 flutter子模块工程
flutter create -t module my_flutter_module
# 2. 编译生成 flutter_module.har
cd my_flutter_module
flutter build har --debug
cd -
# 3. 复制 EntryAbility.ets 和 Index.ets 到 MyApplication 中
cp my_flutter_module/.ohos/entry/src/main/ets/entryability/EntryAbility.ets MyApplication/entry/src/main/ets/entryability/EntryAbility.ets
cp my_flutter_module/.ohos/entry/src/main/ets/pages/Index.ets MyApplication/entry/src/main/ets/pages/Index.ets
```

## 开发package

可参考 [开发纯Dart的packages](https://gitee.com/link?target=https%3A%2F%2Fflutter.cn%2Fdocs%2Fpackages-and-plugins%2Fdeveloping-packages%23dart)

### 1. 创建 package

```
flutter create --template=package hello
```

### 2. 实现 package

对于纯 Dart 库的 package，只要在 lib/.dart 文件中添加功能实现，或在 lib 目录中的多个文件中添加功能实现。



## 开发原生插件类型的Packages

本文介绍了如何开发ohos平台的 Flutter Packages。

### 一、创建Package

```
flutter create --org com.example --template=plugin --platforms=android,ios,ohos hello
```

这将在 hello 目录下创建一个插件项目，其中包含以下内容：

`lib/hello.dart` 文件

Dart 插件 API 实现。

`android/src/main/java/com/example/hello/HelloPlugin.kt` 文件

Android 平台原生插件 API 实现（使用 Kotlin 编程语言）。

`ios/Classes/HelloPlugin.m` 文件

iOS 平台原生插件 API 实现（使用 Objective-C 编程语言）。

`ohos/hello/src/main/ets/components/plugin/HelloPlugin.ets` 文件

Ohos 平台原生插件 API 实现 (使用 ArkTS 编程语言)。

`example/` 文件

一个依赖于该插件并说明了如何使用它的 Flutter 应用。

**指定支持Ohos平台**

插件可以通过向 pubspec.yaml 中的 platforms map 添加 keys 来指定其支持的平台。例如，以下是 hello 插件的 flutter: map，它支持Android、iOS和Ohos：

```
flutter:
  plugin:
    platforms:
      android:
        package: com.example.hello
        pluginClass: HelloPlugin
      ios:
        pluginClass: HelloPlugin
      ohos:
        pluginClass: HelloPlugin

environment:
  sdk: ">=2.19.6 <3.0.0"
  flutter: ">=2.5.0"
```

### 二、实现Package

#### 2.1 定义package API

打开 hello 主目录，并找到 lib/hello.dart 文件。

#### 2.2 编译example

```
cd hello/example
flutter pub get
flutter build hap --local-engine=$ENGINE_DEBUG --debug
```

#### 2.2 添加 Ohos 平台代码 (.ets)

建议使用 DevEco-Studio 来编译 Ohos 代码。

1. 启动 DevEco-Studio，打开 hello/example/ohos 目录
2. 配置签名信息: File->Project Structure->Signing Configs->Support HarmonyOS & Automatically generate signature->Sign in
3. 在打开的网页中登录华为开发者账号，然后回到DevEco-Studio，保存签名信息。
4. 运行项目。

### 为现有的插件项目加入ohos平台的支持

```
flutter create . --template=plugin --platforms=ohos
```

### 开发FFI插件

```
flutter create hello --template=plugin_ffi --platforms=ohos
```

### 参考文档

1. [Flutter Packages 的开发和提交](https://gitee.com/link?target=https%3A%2F%2Fflutter.cn%2Fdocs%2Fpackages-and-plugins%2Fdeveloping-packages)
2. [开发原生插件](https://gitee.com/link?target=https%3A%2F%2Fflutter.cn%2Fdocs%2Fpackages-and-plugins%2Fdeveloping-packages%23plugin)
3. [OpenHarmony文档](https://gitee.com/link?target=https%3A%2F%2Fdocs.openharmony.cn%2Fpages%2Fv4.0%2Fzh-cn%2Fapplication-dev%2Fapplication-dev-guide.md%2F)
4. [HarmonyOS文档](https://gitee.com/link?target=https%3A%2F%2Fdeveloper.huawei.com%2Fconsumer%2Fcn%2Fdoc%2Fharmonyos-guides-V2%2Fstart-overview-0000001478061421-V2)

##  开发FFI plugin

可参考 [开发FFI插件](https://gitee.com/link?target=https%3A%2F%2Fflutter.cn%2Fdocs%2Fpackages-and-plugins%2Fdeveloping-packages%23plugin-ffi)

### 1. 创建 package

```
flutter create --template=plugin_ffi hello --platforms=android,ios,ohos
```

### 2. 构建和绑定本地原生代码

pubspec.yaml 中指定 FFI插件的平台如下

```
  plugin:
    platforms:
      android:
        ffiPlugin: true
      ohos:
        ffiPlugin: true
      ios:
        ffiPlugin: true
```

### 3. 绑定本地原生代码

为了使用本地原生代码，需要在 Dart 中进行绑定。

为了避免手工编写，它们由头文件 (src/hello.h) 中的 package:ffigen 生成。运行以下指令重新生成绑定：

```
dart run ffigen --config ffigen.yaml
```

### 4. 调用本地原生代码

运行时间很短的本地原生函数可以在任何 isolate 中直接调用。例如，请查看 lib/hello.dart 中的 sum。

运行时间较长的本地原生函数应在 [helper isolate](https://gitee.com/link?target=https%3A%2F%2Fdart.cn%2Fguides%2Flanguage%2Fconcurrency%23background-workers) 上调用，以避免在 Flutter 应用程序中掉帧。例如，请查看 lib/hello.dart 中的 sumAsync。
