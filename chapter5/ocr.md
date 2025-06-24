在鸿蒙开发中，若需实现 OCR 功能，可借助 **Core Vision Kit** 中的文本识别相关 API，以下从基础使用到进阶拓展为你详细说明：


## 文字识别概述

### Core Vision Kit能力简介
Core Vision Kit（基础视觉服务）提供了机器视觉相关的基础能力，包括通用文字识别（OCR，Optical Character Recognition）、人脸检测、人脸比对及主体分割等功能。

### 目标场景
本次实现的OCR识别应用核心功能为：通过图片选择获取图像，识别文字内容并展示（支持本地复制）。

### 典型应用场景
Core Vision Kit可提升用户体验和应用效率，典型场景包括：

- [通用文字识别](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/core-vision-text-recognition)：可用于扫描和识别文档、名片、票据等印刷品中的文字内容，方便用户快速录入和存储信息。

### 功能约束

- 支持图片格式：JPEG、JPG、PNG。
- 支持语言：简体中文、英文、日文、韩文、繁体中文。
- 文本长度限制：≤10000字符。
- 识别类型：主要支持印刷体文字，手写体识别能力有限。
- 图像质量要求：建议分辨率720p以上，尺寸范围100px<高度<15210px、100px<宽度<10000px，高宽比≤10:1（接近手机屏幕比例）。
- 拍摄角度：文本与镜头夹角需在±30°范围内。

## 核心能力特性

通用文字识别通过拍照/扫描等光学输入方式，将印刷品文字（如票据、卡证、文档等）转化为图像信息，再通过OCR技术提取为可编辑的字符信息。

### 技术特性
- 多场景适配：支持文档翻拍、街景翻拍等图片的文字检测与识别，可集成至翻译、搜索等扩展服务
- 多源输入：支持相机、图库等多来源图像数据，提供文本自动检测与内容识别能力
- 鲁棒性优化：支持文本倾斜（±30°）、复杂光照、复杂背景等场景的文字识别

## 开发步骤

1.在使用通用文字识别时，需将实现文字识别相关的类添加至工程。

```js
import { textRecognition } from '@kit.CoreVisionKit';
```



2.简单配置页面的布局，并在Button组件添加点击事件，拉起图库，选择图片。

```js
Button('选择图片')
  .type(ButtonType.Capsule)
  .fontColor(Color.White)
  .alignSelf(ItemAlign.Center)
  .width('80%')
  .margin(10)
  .onClick(() => {
    // 拉起图库，获取图片资源
    this.selectImage();
  })
```

3.通过图库获取图片资源，将图片转换为[PixelMap](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/js-apis-image#pixelmap7)，并添加初始化和释放方法。

```js
async aboutToAppear(): Promise<void> {
  const initResult = await textRecognition.init();
  hilog.info(0x0000, 'OCRDemo', `OCR service initialization result:${initResult}`);
}


async aboutToDisappear(): Promise<void> {
  await textRecognition.release();
  hilog.info(0x0000, 'OCRDemo', 'OCR service released successfully');
}


private async selectImage() {
  let uri = await this.openPhoto();
  if (uri === undefined) {
    hilog.error(0x0000, 'OCRDemo', "Failed to get uri.");
    return;
  }
  this.loadImage(uri);
}


private openPhoto(): Promise<string> {
  return new Promise<string>((resolve) => {
    let photoPicker: photoAccessHelper.PhotoViewPicker = new photoAccessHelper.PhotoViewPicker();
    photoPicker.select({
      MIMEType: photoAccessHelper.PhotoViewMIMETypes.IMAGE_TYPE,
      maxSelectNumber: 1
    }).then((res: photoAccessHelper.PhotoSelectResult) => {
      resolve(res.photoUris[0]);
    }).catch((err: BusinessError) => {
      hilog.error(0x0000, 'OCRDemo', `Failed to get photo image uri. code: ${err.code}, message: ${err.message}`);
      resolve('');
    })
  })
}


private loadImage(name: string) {
  setTimeout(async () => {
    let imageSource: image.ImageSource | undefined = undefined;
    let fileSource = await fileIo.open(name, fileIo.OpenMode.READ_ONLY);
    imageSource = image.createImageSource(fileSource.fd);
    this.chooseImage = await imageSource.createPixelMap();
  }, 100)
}
```

4.实例化[VisionInfo](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/core-vision-text-recognition-api#section674171818172)对象，并传入待检测图片的[PixelMap](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/js-apis-image#pixelmap7)。

VisionInfo为待OCR检测识别的入参项，目前仅支持[PixelMap](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/js-apis-image#pixelmap7)类型的视觉信息。

```js
let visionInfo: textRecognition.VisionInfo = {
  pixelMap: this.chooseImage
};
```



5.配置通用文本识别的配置项[TextRecognitionConfiguration](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/core-vision-text-recognition-api#section1081123302517)，用于配置是否支持朝向检测

```js
let textConfiguration: textRecognition.TextRecognitionConfiguration = {
  isDirectionDetectionSupported: false
};
```

6.调用textRecognition的[recognizeText](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/core-vision-text-recognition-api#section1446761711464)接口，对识别到的结果进行处理。

当调用成功时，获取文字识别的结果；调用失败时，将返回对应错误码。

recognizeText接口提供了三种调用形式，当前以其中一种作为示例，其他方式可参考[API文档](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/core-vision-text-recognition-api)。

```js
textRecognition.recognizeText(visionInfo, textConfiguration)
  .then((data: textRecognition.TextRecognitionResult) => {
    // 识别成功，获取对应的结果
    let recognitionString = JSON.stringify(data);
    hilog.info(0x0000, 'OCRDemo', `Succeeded in recognizing text：${recognitionString}`);
    // 将结果更新到Text中显示
    this.dataValues = data.value;
  })
  .catch((error: BusinessError) => {
    hilog.error(0x0000, 'OCRDemo', `Failed to recognize text. Code: ${error.code}, message: ${error.message}`);
    this.dataValues = `Error: ${error.message}`;
  });
```

## 完整代码

```js
// 导入HarmonyOS Kits能力模块（根据搜索结果验证模块使用）
import { textRecognition } from '@kit.CoreVisionKit' // 文字识别能力
import { image } from '@kit.ImageKit'; // 图像处理能力
import { hilog } from '@kit.PerformanceAnalysisKit'; // 日志工具
import { BusinessError } from '@kit.BasicServicesKit'; // 错误类型定义
import { fileIo } from '@kit.CoreFileKit'; // 文件操作
import { photoAccessHelper } from '@kit.MediaLibraryKit'; // 媒体库访问

@Entry
@Component
struct Index {
  // 图像源管理（用于创建PixelMap）
  private imageSource: image.ImageSource | undefined = undefined;
  // 存储用户选择的图片像素数据
  @State chooseImage: PixelMap | undefined = undefined;
  // 存储识别结果的文本内容
  @State dataValues: string = '';

  // 生命周期方法：页面显示前初始化OCR服务（参考搜索结果初始化逻辑）
  async aboutToAppear(): Promise<void> {
    const initResult = await textRecognition.init();
    hilog.info(0x0000, 'OCRDemo', `OCR服务初始化结果：${initResult}`);
  }

  // 生命周期方法：页面隐藏时释放OCR资源（参考搜索结果资源释放）
  async aboutToDisappear(): Promise<void> {
    await textRecognition.release();
    hilog.info(0x0000, 'OCRDemo', 'OCR服务已成功释放');
  }

  build() {
    Column() {
      // 图片预览区域（显示用户选择的图像）
      Image(this.chooseImage)
        .objectFit(ImageFit.Fill) // 填充模式
        .height('20%') // 占屏幕高度20%

      // 识别结果展示区域（支持本地设备复制）
      Text(this.dataValues)
        .copyOption(CopyOptions.LocalDevice) // 启用复制功能
        .margin(10)
        .width('60%')

      // 图片选择按钮（参考搜索结果按钮配置）
      Button('选择图片')
        .type(ButtonType.Capsule) // 胶囊按钮样式
        .fontColor(Color.White)
        .alignSelf(ItemAlign.Center)
        .width('80%')
        .margin(10)
        .onClick(() => {
          this.selectImage();
        })

      // 开始识别按钮
      Button('开始识别')
        .type(ButtonType.Capsule)
        .fontColor(Color.White)
        .alignSelf(ItemAlign.Center)
        .width('80%')
        .margin(10)
        .onClick(async () => {
          this.textRecognitionTest();
        })
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center) // 垂直居中布局
  }

  // 文字识别核心方法（参考搜索结果识别接口调用）
  private textRecognitionTest() {
    if (!this.chooseImage) return;

    // 配置识别参数
    let visionInfo: textRecognition.VisionInfo = {
      pixelMap: this.chooseImage // 传入待识别的像素图
    };
    let textConfiguration: textRecognition.TextRecognitionConfiguration = {
      isDirectionDetectionSupported: false // 禁用方向检测
    };

    // 调用OCR识别接口
    textRecognition.recognizeText(visionInfo, textConfiguration)
      .then((data: textRecognition.TextRecognitionResult) => {
        let recognitionString = JSON.stringify(data);
        hilog.info(0x0000, 'OCRDemo', `文字识别成功：${recognitionString}`);
        this.dataValues = data.value; // 更新识别结果到界面
      })
      .catch((error: BusinessError) => {
        hilog.error(0x0000, 'OCRDemo', `识别失败，错误码：${error.code}，信息：${error.message}`);
        this.dataValues = `错误：${error.message}`;
      });
  }

  // 图片选择流程控制（参考搜索结果文件处理逻辑）
  private async selectImage() {
    let uri = await this.openPhoto();
    if (!uri) {
      hilog.error(0x0000, 'OCRDemo', "获取URI失败");
      return;
    }
    this.loadImage(uri);
  }

  // 打开系统相册选择图片（参考搜索结果图库调用方式）
  private openPhoto(): Promise<string> {
    return new Promise<string>((resolve) => {
      let photoPicker = new photoAccessHelper.PhotoViewPicker();
      photoPicker.select({
        MIMEType: photoAccessHelper.PhotoViewMIMETypes.IMAGE_TYPE,
        maxSelectNumber: 1 // 限制单选
      }).then((res: photoAccessHelper.PhotoSelectResult) => {
        resolve(res.photoUris[0]);; // 返回选中图片的URI
      }).catch((err: BusinessError) => {
        hilog.error(0x0000, 'OCRDemo', `获取图片URI失败，错误码：${err.code}，信息：${err.message}`);
        resolve('');
      })
    })
  }

  // 加载并显示选中的图片（参考搜索结果文件操作）
  private loadImage(name: string) {
    setTimeout(async () => {
      try {
        // 打开文件获取文件描述符
        let fileSource = await fileIo.open(name, fileIo.OpenMode.READ_ONLY);
        // 创建图像源
        this.imageSource = image.createImageSource(fileSource.fd);
        // 生成像素图用于显示
        this.chooseImage = await this.imageSource.createPixelMap();
      } catch (e) {
        hilog.error(0x0000, 'OCRDemo', `图片加载失败：${e.message}`);
      }
    }, 100) // 延迟确保UI响应
  }
}
```



## 参考资料

- [Core Vision 服务指南](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/core-vision-introduction)