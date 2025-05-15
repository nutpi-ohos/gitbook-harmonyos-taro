# **代码工程及构建介绍**

## 背景

ArkUI作为OpenHarmony的默认开发框架，在本项目（ArkUI-X）中需要做到一套代码同时支持多平台构建，所以会采取共仓开发的方式，部分仓直接指向OpenHarmony相关开源仓。

## 代码结构及仓库结构

代码工程的目录结构如下：

```
├── arkcompiler                 // 方舟编译器
├── base                        // 基础能力
├── build                       // 项目构建和配置脚本
├── build_plugins               // 跨平台构建插件
├── commonlibrary               // 公共基础库
├── community                   // 社区相关
├── developtools                // 开发者工具
├── docs                        // 配套文档
├── foundation
│   ├── appframework            // 应用框架兼容适配层
│   ├── arkui                   // ArkUI引擎
│   ├── communication           // 通信能力
│   ├── distributeddatamgr      // 分布式数据管理
│   ├── filemanagement          // 文件管理
│   ├── graphic                 // 图形引擎
│   └── multimedia              // 多媒体
├── interface                   // 接口声明
├── plugins                     // 插件管理与实现
├── prebuilts                   // 预编译目录
├── productdefine               // 产品形态配置
├── samples                     // 示例代码
├── test                        // 测试框架与用例
└── third_party                 // 三方库
```

具体的代码结构及指向，见下表：

| 目录路径                                    | 描述                                                      | 代码仓位置                                                   |
| ------------------------------------------- | --------------------------------------------------------- | ------------------------------------------------------------ |
| build                                       | 项目构建和配置脚本                                        | [OpenHarmony/build](https://gitcode.com/openharmony/build)   |
| build_plugins                               | 跨平台构建插件                                            | [ArkUI-X/build_plugins](https://gitcode.com/arkui-x/build_plugins) |
| samples                                     | 应用程序样例                                              | [ArkUI-X/samples](https://gitcode.com/arkui-x/samples)       |
| community                                   | 社区运作管理                                              | [ArkUI-X/community](https://gitcode.com/arkui-x/community)   |
| docs                                        | 说明文档                                                  | [ArkUI-X/docs](https://gitcode.com/arkui-x/docs)             |
| interface/sdk                               | ArkUI-X SDK配置                                           | [ArkUI-X/interface_sdk](https://gitcode.com/arkui-x/interface_sdk) |
| plugins                                     | API插件管理，OpenHarmony API插件实现                      | [ArkUI-X/plugins](https://gitcode.com/arkui-x/plugins)       |
| test/xts                                    | ArkUI-X跨平台应用测试套件                                 | [ArkUI-X/xts](https://gitcode.com/arkui-x/xts)               |
| test/testfwk/arkxtest                       | ArkUI-X测试框架                                           | [ArkUI-X/arkxtest](https://gitcode.com/arkui-x/arkxtest)     |
| developtools/ace_tools                      | 跨平台命令行工具                                          | [ArkUI-X/cli](https://gitcode.com/arkui-x/cli)               |
| foundation/appframework                     | 应用框架兼容适配层                                        | [ArkUI-X/app_framework](https://gitcode.com/arkui-x/app_framework) |
| foundation/arkui/ace_engine/adapter/android | Android平台适配代码                                       | [ArkUI-X/arkui_for_android](https://gitcode.com/arkui-x/arkui_for_android) |
| foundation/arkui/ace_engine/adapter/ios     | iOS平台适配代码                                           | [ArkUI-X/arkui_for_ios](https://gitcode.com/arkui-x/arkui_for_ios) |
| foundation/arkui/ace_engine                 | ArkUI 引擎核心代码                                        | [OpenHarmony/arkui_ace_engine](https://gitcode.com/openharmony/arkui_ace_engine) |
| foundation/arkui/napi                       | Native API扩展机制                                        | [OpenHarmony/arkui_napi](https://gitcode.com/openharmony/arkui_napi) |
| foundation/communication/netmanager_base    | 网络管理模块                                              | [OpenHarmony/communication_netmanager_base](https://gitcode.com/openharmony/communication_netmanager_base) |
| foundation/communication/netstack           | 网络协议栈                                                | [OpenHarmony/communication_netstack](https://gitcode.com/openharmony/communication_netstack) |
| foundation/graphic/graphic_2d               | 2D图形基础库                                              | [OpenHarmony/graphic_graphic_2d](https://gitcode.com/openharmony/graphic_graphic_2d) |
| foundation/filemanagement/file_api          | 提供目录和文件的访问操作接口                              | [OpenHarmony/filemanagement_file_api](https://gitcode.com/openharmony/filemanagement_file_api) |
| foundation/multimedia/image_framework       | 图片编解码功能实现                                        | [OpenHarmony/multimedia_image_framework](https://gitcode.com/openharmony/multimedia_image_framework) |
| developtools/ace_ets2bundle                 | 基于ArkTS的声明式开发范式编译转换工具和跨平台应用构建工具 | [OpenHarmony/ace_ets2bundle](https://gitcode.com/openharmony/developtools_ace_ets2bundle) |
| developtools/ace_js2bundle                  | 兼容JS的类Web开发范式编译转换工具和跨平台应用构建工具     | [OpenHarmony/ace_js2bundle](https://gitcode.com/openharmony/developtools_ace_js2bundle) |
| arkcompiler/ets_frontend                    | 方舟前端工具                                              | [OpenHarmony/arkcompiler_ets_frontend](https://gitcode.com/openharmony/arkcompiler_ets_frontend) |
| arkcompiler/ets_runtime                     | 方舟ArkTS运行时                                           | [OpenHarmony/arkcompiler_ets_runtime](https://gitcode.com/openharmony/arkcompiler_ets_runtime) |
| arkcompiler/runtime_core                    | 方舟编译器运行时                                          | [OpenHarmony/arkcompiler_runtime_core](https://gitcode.com/openharmony/arkcompiler_runtime_core) |
| arkcompiler/toolchain                       | 调试调优工具                                              | [OpenHarmony/arkcompiler_toolchain](https://gitcode.com/openharmony/arkcompiler_toolchain) |
| prebuilts                                   | 预编译目录，python，nodejs，clang和cmake等                | 通过脚本预下载                                               |
| third_party                                 | 开源第三方组件（统一复用OpenHarmony代码仓）               | 引用开源三方库集合                                           |
| commonlibrary/c_utils                       | 通用的C++功能函数和类                                     | [OpenHarmony/commonlibrary_c_utils](https://gitcode.com/openharmony/commonlibrary_c_utils) |
| commonlibrary/ets_utils                     | 用于存放基础类库JSAPI，比如url、uri等                     | [OpenHarmony/commonlibrary_ets_utils](https://gitcode.com/openharmony/commonlibrary_ets_utils) |
| base/hiviewdfx/hilog                        | 系统日志功能                                              | [OpenHarmony/hiviewdfx_hilog](https://gitcode.com/openharmony/hiviewdfx_hilog) |
| base/web/webview                            | WebView组件的Native引擎                                   | [OpenHarmony/web_webview](https://gitcode.com/openharmony/web_webview) |
| base/global/resource_management             | 全球化资源管理                                            | [OpenHarmony/global_resource_management](https://gitcode.com/openharmony/global_resource_management) |

## 分支同步策略

OpenHarmony相关代码仓，指向OpenHarmony master分支的固定tag点，定期同步，默认按照OpenHarmony的Weekly分支频率进行同步。

## ArkUI引擎核心代码仓目录结构

ArkUI引擎核心代码仓 `ace_engine` 的目录结构以及每个目录的内容如下：

```
foundation/arkui/ace_engine
├── ace_config.gni      // 全局配置文件
├── adapter             // 平台适配层
│   ├── android         // Android平台适配，独立仓
│   │   ├── build
│   │   ├── capability
│   │   ├── entrance
│   │   ├── stage
│   │   └── osal
│   ├── ios             // iOS平台适配，独立仓
│   │   ├── build
│   │   ├── capability
│   │   ├── entrance
│   │   ├── stage
│   │   └── osal
│   ├── ohos            // OpenHarmony平台适配
│   └── preview         // 预览器平台适配
├── build               // 编译配置
│   ├── ace_gen_obj.gni
│   ├── ace_lib.gni
│   ├── BUILD.gn
│   ├── search.py
│   └── tools
├── BUILD.gn            // 全局编译配置
├── frameworks          // 引擎框架层
│   ├── base            // base库
│   ├── bridge          // 前端桥接
│   └── core            // 引擎核心实现
├── interfaces          // 通用对外接口
│   └── napi
│       └── kits
├── LICENSE
├── OAT.xml
├── README.md
├── README_zh.md
└── test                // 测试相关
```

