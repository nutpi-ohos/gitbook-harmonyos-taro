# 平台差异化

跨平台使用场景是一套ArkTS代码运行在多个终端设备上，如Android、iOS、OpenHarmony（含基于OpenHarmony发行的商业版，如HarmonyOS Next）。当不同平台业务逻辑不同，或使用了不支持跨平台的API，就需要根据平台不同进行一定代码差异化适配。当前仅支持在代码运行态进行差异化，接下来详细介绍场景及如何差异化适配。

## 使用场景及能力

### 使用场景

平台差异化适用于以下两种典型场景：

1. 自身业务逻辑不同平台本来就有差异；
2. 在OpenHarmony上调用了不支持跨平台的API，这就需要在OpenHarmony上仍然调用对应API，其他平台通过Bridge桥接机制进行差异化处理；

### 判断平台类型

可以通过`let osName: string = deviceInfo.osFullName;`获取对应OS名字，该接口已支持跨平台，不同平台上其返回值如下:

- OpenHarmony上，osName等于`OpenHarmony XXX`
- Android上，osName等于`Android XXX`
- iOS上，osName等于`iOS XXX`

示例如下:

```ts
test() {
  let osName: string = deviceInfo.osFullName;
  console.log('osName = ' + osName);
  if (osName.startsWith('OpenHarmony')) {
    // OpenHarmony应用平台上业务逻辑
  } else if (osName.startsWith('Android')) {
    // Android应用平台上业务逻辑
  } else if (osName.startsWith('iOS')) {
    // iOS应用平台上业务逻辑
  }
}
```

### 