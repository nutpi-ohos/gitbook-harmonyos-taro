# React Native 鸿蒙化学习指南

随着鸿蒙系统的不断发展，越来越多的开发者开始关注如何将 React Native 应用适配到鸿蒙平台上。本文将为大家提供一份详细的 React Native 鸿蒙化学习指南，帮助大家快速上手。

## 一、版本信息与配套环境

### （一）当前适配版本

当前 React Native 鸿蒙版本基于社区 RN 0.72.5 进行适配，发布版本信息如下

| 名称                                           | 版本号    |
| ---------------------------------------------- | --------- |
| react-native-harmony.tgz                       | 0.72.64   |
| react-native-harmony-cli.tgz                   | 0.0.28    |
| react_native_openharmony-5.1.0.401.har         | 0.72.64   |
| react_native_openharmony_release-5.1.0.401.har | 5.1.0.401 |

### （二）配套 IDE、SDK 版本和手机 ROM



| 名称          | 版本号                                                       |
| ------------- | ------------------------------------------------------------ |
| DevEco Studio | DevEco Studio 5.1.0.408SP1                                   |
| HarmonyOS SDK | HarmonyOS SDK 5.1.0.101                                      |
| 手机ROM       | ALN-AL00 205.1.0.101(SP30DEVC00E101R4P3) ALN-AL80 205.1.0.101(SP30DEVC00E101R4P3) BRA-AL00 205.1.0.101(SP30DEVC00E101R4P3) |

也就是说现在适配的是最新的IDE和最新的SDK。

## 二、分支说明

### （一）0.72.5-ohos-5.0-release 分支

- **特点** ：release 分支，质量稳定，适合商业项目使用。
- **操作建议** ：如需下载源码，请从此分支下载上述正式版本对应的 tag 点源码。

### （二）master 分支

- **特点** ：主分支，主要用于开发和测试，不保证质量。
- **操作建议** ：请勿从此分支拉取源码用于商用版本

## 三、学习路径

本文档适合具有 React Native 基础的开发者使用。在阅读本文档前，建议自行学习 React Native 的相关知识。以下是详细的学习路径：

### （一）框架介绍

了解 React Native 鸿蒙化的整体框架结构和设计理念，为后续学习打下基础。[框架介绍](https://gitcode.com/openharmony-sig/ohos_react_native/blob/master/docs/zh-cn/框架介绍.md)

### （二）架构介绍

深入学习 React Native 鸿蒙化的架构设计，包括组件结构、数据流向等关键内容。[架构介绍](https://gitcode.com/openharmony-sig/ohos_react_native/blob/master/docs/zh-cn/析析介绍.md)

### （三）版本说明

掌握 React Native 鸿蒙化各版本的特点、更新内容和适用场景。[版本说明](https://gitcode.com/openharmony-sig/ohos_react_native/blob/master/docs/zh-cn/版本说明.md)

### （四）环境搭建

学习如何搭建 React Native 鸿蒙化的开发环境，包括 IDE 配置、SDK 安装等。[环境搭建](https://gitcode.com/openharmony-sig/ohos_react_native/blob/master/docs/zh-cn/环境搭建.md)

### （五）功能开发

掌握 React Native 鸿蒙化应用的功能开发方法，包括 UI 组件使用、状态管理等。[功能开发](https://gitcode.com/openharmony-sig/ohos_react_native/blob/master/docs/zh-cn/功能开发.md)

### （六）性能调优

学习如何优化 React Native 鸿蒙化应用的性能，提高应用的运行效率和用户体验。[性能调优](https://gitcode.com/openharmony-sig/ohos_react_native/blob/master/docs/zh-cn/性能调优.md)

### （七）调试调测

掌握 React Native 鸿蒙化应用的调试方法和技巧，确保应用的稳定性和可靠性。[调试调测](https://gitcode.com/openharmony-sig/ohos_react_native/blob/master/docs/zh-cn/调试调测.md)

### （八）三方库接入

了解如何接入第三方库，丰富应用的功能和特性。[三方库接入](https://gitee.com/react-native-oh-library/usage-docs#rnoh-%E4%B8%89%E6%96%B9%E5%BA%93%E6%80%BB%E8%A7%88)

### （九）常见开发场景

学习 React Native 鸿蒙化在常见开发场景中的应用和解决方案。[常见开发场景](https://gitcode.com/openharmony-sig/ohos_react_native/blob/master/docs/zh-cn/常见开发场景.md)

### （十）FAQ

查看常见问题解答，解决开发过程中遇到的疑问和困难。[FAQ](https://gitcode.com/openharmony-sig/ohos_react_native/blob/master/docs/zh-cn/FAQ.md)

### （十一）附录

查阅附录中的参考资料和资源，进一步拓展学习。[附录](https://gitcode.com/openharmony-sig/ohos_react_native/blob/master/docs/zh-cn/附录.md)

## 四、坚果派团队介绍

坚果派由坚果等人创建，团队拥有若干华为 HDE，以及若干其他领域的三十余位万粉博主运营。专注于分享的技术包括 HarmonyOS/OpenHarmony，ArkUI-X，元服务，服务卡片，华为自研语言，BlueOS 操作系统、团队成员聚集在北京、上海、广州、深圳、南京、杭州、苏州、宁夏等地。 聚焦“鸿蒙原生应用”、“智能物联”和“AI 赋能”、“人工智能”四大业务领域，依托华为开发者专家等强大的技术团队，以及涵盖需求、开发、测试、运维于一体的综合服务体系，赋能文旅、媒体、社交、家居、消费电子等行业客户，满足社区客户数字化升级转型的需求，帮助客户实现价值提升。 目前上架鸿蒙原生应用 18 款，三方库 72 个。欢迎大家加微信联系。

地址：https://atomgit.com/nutpi

https://gitcode.com/nutpi

商务对接：nut_pie或者邮箱jianguo@nutpi.net



## 五、思维导图

```
React Native 鸿蒙化学习指南
├── 版本信息与配套环境
│   ├── 当前适配版本
│   └── 配套 IDE、SDK 版本和手机 ROM
├── 分支说明
│   ├── 0.72.5-ohos-5.0-release 分支
│   └── master 分支
├── 学习路径
│   ├── 框架介绍
│   ├── 架构介绍
│   ├── 版本说明
│   ├── 环境搭建
│   ├── 功能开发
│   ├── 性能调优
│   ├── 调试调测
│   ├── 三方库接入
│   ├── 常见开发场景
│   ├── FAQ
│   └── 附录
└── 坚果派团队介绍
    ├── 团队概况
    ├── 业务领域
    ├── 技术资源
    └── 联系方式
```

