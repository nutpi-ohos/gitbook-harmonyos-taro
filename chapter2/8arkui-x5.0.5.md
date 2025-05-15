# ArkUI-X 5.0.5 Release （API7）发布：安卓适配全面升级，跨平台能力再突破



## 摘要

本文聚焦 ArkUI-X 5.0.5 Release 版本更新，重点介绍其在**安卓平台适配**、**跨平台框架能力**、**开发工具易用性**及**组件与 API 扩展**等方面的核心升级内容，同时提供版本与平台配套关系及实践指引，帮助开发者快速掌握新版本特性。

## 一、版本概述

ArkUI-X 5.0.5 Release（API 17）重磅发布，本次更新以**安卓平台深度适配**和**跨平台能力强化**为核心，涵盖应用框架、开发工具、组件体系及 API 接口四大维度升级。新增支持 Android Fragment 对接、非压缩模式打包、沉浸式状态栏适配等关键功能，ACE Tools 工具链优化创建模块流程与联动编译能力，组件层新增 XComponent 跨平台组件，API 层扩展超 20 项系统能力接口。本次更新进一步完善 “一次开发，多端部署” 的跨平台体验，助力开发者高效构建 HarmonyOS、Android、iOS 多端应用。

## 二、特性说明

### （一）应用框架：安卓适配与跨平台能力双提升

1. **Android Fragment 深度集成**
   新增支持 Android Fragment 与跨平台界面的无缝对接，开发者可直接在 ArkUI-X 中调用 Fragment 组件，实现复杂页面逻辑与原生功能的融合，具体实现可参考[Fragment 跨平台开发指南](https://gitcode.com/arkui-x/docs/blob/master/zh-cn/application-dev/tutorial/how-to-use-fragment-on-android.md)。
2. **非压缩模式支持**
   适配 Android 应用非压缩打包场景（`useLegacyPacking=false`或`android:extractNativeLibs=false`），满足特定安全或性能优化需求。
3. **生命周期与内存管理优化**
   自动回收 Activity/ViewController 销毁时的 API 插件内存，降低内存泄漏风险。
4. 系统交互能力增强
   - 支持**沉浸式状态栏**及获取状态栏避让区域信息，优化 PC / 平板等大屏设备的视觉体验。
   - 新增 ArkUI 拖拽事件（`drag`）与触摸事件（`touch`）跨平台适配，完善交互逻辑。
5. **平台视图兼容性升级**
   强化 WebView 等原生视图与跨平台组件的协同渲染能力，提升混合开发场景稳定性。

### （二）ACE Tools：开发效率倍增的工具链升级

1. **模块化开发流程优化**
   创建 Module 时支持选择类型（如 Application、Library），简化工程结构配置。
2. **多端部署效率提升**
   支持同时向 OpenHarmony 终端安装多个 HAP/HSP 包，加速多模块联调。
3. **源码级调试支持**
   配置 ArkUI-X 框架源码目录后，可自动关联编译产物，实现断点调试直达框架底层逻辑（`--source-dir`参数）。
4. **跨平台联动编译**
   支持在 Android/iOS 工程中直接触发 ArkTS 代码编译，无缝衔接原生与跨平台开发流程，具体指南参见[Android 联动编译](https://gitcode.com/arkui-x/docs/blob/master/zh-cn/application-dev/tutorial/how-to-linkage-compilation-on-android.md)与[iOS 联动编译](https://gitcode.com/arkui-x/docs/blob/master/zh-cn/application-dev/tutorial/how-to-linkage-compilation-on-ios.md)。

### （三）组件适配：跨平台组件矩阵再扩容

1. **XComponent 跨平台组件**
   新增`XComponent`组件，支持嵌入原生视图（如 Android 的 View、iOS 的 UIView），实现跨平台界面与原生组件的混合渲染，详情参考[XComponent 文档](https://gitcode.com/arkui-x/docs/blob/master/zh-cn/application-dev/reference/arkui-ts/ts-basic-components-xcomponent.md)。
2. **交互组件子窗口适配**
   Dialog、Toast、contextMenu、Popup 等组件新增子窗口逻辑适配，优化多窗口场景下的显示层级与交互响应。
   完整组件跨平台支持列表见[组件跨平台列表](https://gitcode.com/arkui-x/docs/blob/master/zh-cn/application-dev/reference/arkui-ts/README.md)。

### （四）API 适配：20 + 系统能力跨平台扩展

本次更新新增以下系统接口的跨平台支持，覆盖系统服务、多媒体、网络、数据存储等核心领域：

- **系统交互**：`window.setWindowLayoutFullScreen`（全屏设置）、`window.getWindowAvoidArea`（获取避让区域）。
- **硬件与传感器**：`ohos.wifiManager`（Wi-Fi 管理）、`ohos.bluetooth`系列接口（蓝牙连接与 BLE）。
- **数据与文件**：`ohos.file.picker`（文件选择器）、`ohos.data.relationalStore`（关系型数据库）。
- **多媒体**：`ohos.multimedia.audio`（音频管理）、`ohos.multimedia.image`（图片编解码）。
- **安全与性能**：`ohos.security.cryptoFramework`（加密框架）、`ohos.taskpool`（任务池管理）。
  完整 API 跨平台列表见[ArkTS 接口跨平台列表](https://gitcode.com/arkui-x/docs/blob/master/zh-cn/application-dev/reference/apis/README.md)。

## 三、配套关系

**表 1 版本软件与平台兼容矩阵**

| 目标平台  | 兼容 OS 版本            | 获取方式                                                     |
| --------- | ----------------------- | ------------------------------------------------------------ |
| HarmonyOS | 5.0.5 Release（API 17） | 通过 HUAWEI DevEco Studio 下载：[点击获取](https://developer.huawei.com/consumer/cn/download/) |
| Android   | Android 8+（API 26+）   | 直接集成至 Android 工程，无需额外获取                        |
| iOS       | iOS 10+                 | 直接集成至 iOS 工程，无需额外获取                            |

## 四、总结

ArkUI-X 5.0.5 Release 通过**安卓平台深度适配**与**跨平台能力全面升级**，进一步巩固了其作为多端开发首选框架的地位。对于已有 Android 项目的开发者，新增的 Fragment 对接与非压缩模式支持可大幅降低迁移成本；而追求高效跨平台开发的团队，XComponent 组件与联动编译功能则能显著提升开发效率。建议开发者优先升级至该版本，结合[官方文档](https://gitcode.com/arkui-x/docs)与[示例工程](https://gitcode.com/arkui-x/samples)，充分利用新增能力构建更具竞争力的多端应用。欢迎大家加入坚果派开发者社区，共同推动 ArkUI-X 生态发展。

