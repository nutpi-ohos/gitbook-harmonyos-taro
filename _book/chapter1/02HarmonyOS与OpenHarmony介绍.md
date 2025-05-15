https://developer.huawei.com/consumer/cn/app/planning

## HarmonyOS

HarmonyOS 是新一代智能终端操作系统。为不同设备的智能化、互联与协同提供了统一的语言。设备可实现一碰入网，无屏变有屏，操作可视化，一键直达原厂服务等全新功能。通过简单而智能的服务，实现设备智能化产业升级。

HarmonyOS 是一款面向全场景智慧生活方式的分布式操作系统。在传统的单设备系统能力的基础上，HarmonyOS 提出了基于同一套系统能力、适配多种终端形态的分布式理念，能够支持手机、平板、PC等多种终端设备。对消费者而言，HarmonyOS 能够将生活场景中的各类终端进行能力整合，实现不同终端设备之间的极速连接、能力互助、资源共享，匹配合适的设备、提供流畅的全场景体验

在开发过程中，HarmonyOS提供了完备的开发套件、赋能套件，帮助开发者快速学习并掌握应用开发所需的技能，通过了解并应用HarmonyOS设计理念，帮助开发者打造高端精致、简单易用、极致流畅、纯净安全的应用。

### ArkTS和ArkUI

#### ArkTS

在HarmonyOS应用开发中，优先选择[ArkTS](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides-V5/arkts-get-started-V5)语言。ArkTS是Harmony生态的应用开发语言，它在TypeScript生态基础上进一步扩展，提供了简洁自然的声明式语法、组件化机制、数据-UI自动关联等能力，让开发者可以更简洁、更自然的开发高性能应用。

#### ArkUI

开发者可以使用[ArkUI](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides-V5/arkui-overview-V5)的UI组件绘制应用界面。ArkUI是一套构建分布式应用界面的声明式UI开发框架，它提供了丰富的UI组件、动画、交互事件、实时界面预览工具等，可以帮助我们快速入门HarmonyOS应用开发。ArkUI提供了规则图形绘制和用户自定义绘制，通过调用ArkUI规则图形组件、事件，可以快速实现应用界面，提升HarmonyOS应用界面开发效率。

### 开发套件

开发套件是万物互联时代的鸿蒙生态加速器，包含HarmonyOS应用/服务从设计、开发、测试、上架所需的关键技术和产品。

#### DevEco Studio

在正式开发前，开发者需要搭建好开发环境，包括开发工具[DevEco Studio安装](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides-V5/ide-software-install-0000001558013317-V5)、[新工程的创建](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides-V5/ide-hello-world-0000001507373502-V5)。[DevEco Studio](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides-V5/ide-tools-overview-0000001558763037-V5)是面向HarmonyOS应用及元服务开发者提供的集成开发环境，能够支持项目工程管理、智能代码编辑、一键编译和构建、多端双向实时预览、性能调优、多端设备模拟仿真等。

DevEco Studio支持多种品类的应用/服务开发，预置了丰富的[工程模板](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides-V5/ide-template-0000001053702407-V5)，如Empty Ability、Native C++、[CloudDev]Empty Ability等模板。开发者可以根据工程向导轻松创建适应于各类设备的工程，并自动生成对应的代码和资源模板。同时，DevEco Studio还提供了多种编程语言供开发者进行应用/服务开发，包括ArkTS、C/C++等。

## OpenHarmony

OpenHarmony是由开放原子开源基金会（OpenAtom Foundation）孵化及运营的开源项目，目标是面向全场景、全连接、全智能时代，基于开源的方式，搭建一个智能终端设备操作系统的框架和平台，促进万物互联产业的繁荣发展。

### 技术架构

OpenHarmony整体遵从分层设计，从下向上依次为：内核层、系统服务层、框架层和应用层。系统功能按照“系统 > 子系统 > 组件”逐级展开，在多设备部署场景下，支持根据实际需求裁剪某些非必要的组件。OpenHarmony技术架构如下所示：

![img](https://luckly007.oss-cn-beijing.aliyuncs.com/uPic/1.png)

