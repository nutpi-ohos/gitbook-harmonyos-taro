# OAID、AAID和ODID分别是什么，如何获取设备的唯一标识？

## OAID

### 概述

OAID：开放匿名设备标识符，是一种非永久性设备标识符，基于开放匿名设备标识符，可在保护用户个人数据隐私安全的前提下，向用户提供个性化广告，同时三方监测平台也可以向广告主提供转化根因分析。OAID具有以下特性：

### 特点

- OAID是设备级标识符，同一台设备上不同的App获取到的OAID值一样。
- OAID的获取受应用的跟踪开关影响：当应用的跟踪开关开启时，该应用可获取到非全0的有效OAID；当应用的跟踪开关关闭时，该应用仅能获取到全0的OAID。
- 同一台设备上首个应用开启应用跟踪开关时，会首次生成OAID。

### 获取OAID信息

在模块的module.json5文件中，申请广告跟踪权限[ohos.permission.APP_TRACKING_CONSENT](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/permissions-for-all-user#ohospermissionapp_tracking_consent)，该权限为user_grant权限，当申请的权限为user_grant权限时，reason，abilities标签必填，配置方式参见[requestPermissions标签说明](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/declare-permissions#在配置文件中声明权限)，示例代码如下所示：

```
{
  "module": {
    "requestPermissions": [
      {
        "name": "ohos.permission.APP_TRACKING_CONSENT",
        "reason": "$string:reason",
        "usedScene": {
          "abilities": [
            "EntryFormAbility"
          ],
          "when": "inuse"
        }
      }
    ]
  }
}
```

应用在需要获取OAID信息时，应通过调用requestPermissionsFromUser接口获取对应权限。注意：其中context的获取方式参见[各类Context的获取方式](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/application-context-stage)。示例代码如下所示：

```js
import { abilityAccessCtrl, PermissionRequestResult } from '@kit.AbilityKit';
import { identifier } from '@kit.AdsKit';
import { hilog } from '@kit.PerformanceAnalysisKit';


async function requestOAID(context: Context): Promise<string | undefined> {
  // 向用户请求授权广告跨应用关联访问权限
  let isPermissionGranted: boolean = false;
  try {
    const atManager: abilityAccessCtrl.AtManager = abilityAccessCtrl.createAtManager();
    const result: PermissionRequestResult =
      await atManager.requestPermissionsFromUser(context, ['ohos.permission.APP_TRACKING_CONSENT']);
    isPermissionGranted = result.authResults[0] === abilityAccessCtrl.GrantStatus.PERMISSION_GRANTED;
  } catch (err) {
    hilog.error(0x0000, 'testTag', `Failed to request permission. Code is ${err.code}, message is ${err.message}`);
  }
  if (isPermissionGranted) {
    hilog.info(0x0000, 'testTag', 'Succeeded in requesting permission');
    try {
      const oaid = await identifier.getOAID();
      hilog.info(0x0000, 'testTag', 'Succeeded in getting OAID');
      return oaid;
    } catch (err) {
      hilog.error(0x0000, 'testTag', `Failed to get OAID. Code is ${err.code}, message is ${err.message}`);
    }
  } else {
    hilog.error(0x0000, 'testTag', 'Failed to request permission. User rejected');
  }
  return undefined;
}
```



## AAID

### 概述

AAID：应用匿名标识符，标识运行在移动智能终端设备上的应用实例，只有该应用实例才能访问该标识符，它只存在于应用的安装期，总长度32位。与无法重置的设备级硬件ID相比，AAID具有更好的隐私权属性。AAID具有以下特性：

### 特点

- 匿名化、无隐私风险：AAID和已有的任何标识符都不关联，并且每个应用只能访问自己的AAID。
- 同一个设备上，同一个开发者的多个应用，AAID取值不同。
- 同一个设备上，不同开发者的应用，AAID取值不同。
- 不同设备上，同一个开发者的应用，AAID取值不同。
- 不同设备上，不同开发者的应用，AAID取值不同

### 获取AAID

导入AAID模块及相关公共模块。

```typescript
import { AAID } from '@kit.PushKit';
import { AbilityConstant, UIAbility, Want } from '@kit.AbilityKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
```

调用AAID.[getAAID](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/push-aaid-api#section573317917425)()方法获取AAID信息。



```typescript
export default class EntryAbility extends UIAbility {
  // 入参want与launchParam并未使用，为初始化项目时自带参数
  async onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): Promise<void> {
    // 获取AAID
    try {
      const aaid: string = await AAID.getAAID();
      hilog.info(0x0000, 'testTag', 'Succeeded in getting AAID.');
    } catch (err) {
      let e: BusinessError = err as BusinessError;
      hilog.error(0x0000, 'testTag', 'Failed to get AAID: %{public}d %{public}s', e.code, e.message);
    }
  }
}
```



## ODID

### 概述

ODID：开发者匿名设备标识符，它主要用于开放给开发者的设备标识，同一设备上运行的同一个开发者的应用，ODID相同。帮助开发者更好地理解用户在不同应用间的行为，从而提供更个性化的服务和推荐。ODID具有以下特性：

### 特点

- 同一设备上运行的同一个开发者的应用，ODID相同。
- 同一个设备上不同开发者的应用，ODID不同。
- 不同设备上同一个开发者的应用，ODID不同。
- 不同设备上不同开发者的应用，ODID不同。

如果想获取设备的唯一标识符，可以使用AAID，获取方法参考链接；广告业务场景下则可以使用OAID；开发者基于应用的分析可以用ODID。

**ODID值会在以下场景重新生成**：手机恢复出厂设置。同一设备上同一个开发者(developerId相同)的应用全部卸载后重新安装时。

**ODID生成规则**：根据签名信息里developerId解析出的groupId生成，developerId规则为groupId.developerId，若无groupId则取整个developerId作为groupId。同一设备上运行的同一个开发者(developerId相同)的应用，ODID相同。同一个设备上不同开发者(developerId不同)的应用，ODID不同。不同设备上同一个开发者(developerId相同)的应用，ODID不同。不同设备上不同开发者(developerId不同)的应用，ODID不同。**说明**：数据长度为37字节。示例：1234a567-XXXX-XXXX-XXXX-XXXXXXXXXXXX

### 获取ODID

```
  let odid: string = deviceInfo.ODID;
    // 输出结果：the value of the ODID is :1234a567-XXXX-XXXX-XXXX-XXXXXXXXXXXX
    console.info('the value of the deviceInfo odid is :' + odid);
```

## 参考链接

[获取AAID](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/push-get-aaid)、[广告标识服务](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/oaid-service)、[设备信息](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/js-apis-device-info#属性)