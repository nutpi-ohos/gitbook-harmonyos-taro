# 如何使用 FlutterEntry

## 1. EntryAbility 需要继承自 FlutterAbility

```js
export default class EntryAbility extends FlutterAbility {
  configureFlutterEngine(flutterEngine: FlutterEngine) {
    super.configureFlutterEngine(flutterEngine)
    GeneratedPluginRegistrant.registerWith(flutterEngine)
  }
}
```

## 2. FlutterEntry 需要和 FlutterView 一起使用

```js
@Entry
@Component
struct Index {
  private flutterEntry: FlutterEntry | null = null;
  private flutterView?: FlutterView

  aboutToAppear() {
    Log.d("Flutter", "Index aboutToAppear===");
    this.flutterEntry = new FlutterEntry(getContext(this))
    this.flutterEntry.aboutToAppear()
    this.flutterView = this.flutterEntry.getFlutterView()
  }

  aboutToDisappear() {
    Log.d("Flutter", "Index aboutToDisappear===");
    this.flutterEntry?.aboutToDisappear()
  }

  onPageShow() {
    Log.d("Flutter", "Index onPageShow===");
    this.flutterEntry?.onPageShow()
  }

  onPageHide() {
    Log.d("Flutter", "Index onPageHide===");
    this.flutterEntry?.onPageHide()
  }

  build() {
    Stack() {
      FlutterPage({ viewId: this.flutterView?.getId() })
      Button('跳转页面2')
        .onClick(() => {
          try {
            router.pushUrl({ url: 'pages/Index2', params: { route: '/second' } })
          } catch (err) {
            Log.d("Flutter", "跳转页面2 error ===" + JSON.stringify(err));
          }
        })
    }
  }
}
```