## 使用公共依赖库

插件默认使用内置版本的公共依赖库，可以通过 useChoreLibrary 配置禁用或者配置指定版本依赖。

```ts
const config = {
  // ...
  plugins: [
    '@tarojs/plugin-platform-harmony-cpp', // useChoreLibrary: 'local'
    // ['@tarojs/plugin-platform-harmony-cpp', { useChoreLibrary: false }],
    // ['@tarojs/plugin-platform-harmony-cpp', { useChoreLibrary: '4.1.0-alpha.0' }],
  ],
  harmony: {
    ohPackage: {
      dependencies: {
        library: 'file:../library',
      },
    },
  },
  // ...
}
```



插件版本可以通过 `ohPackage.dependencies` 配置或者鸿蒙工程内 `oh-package.json5` 配置覆盖。、

## 插件默认使用内置版本的公共依赖库

比如我们使用的话，就是默认使用本地的配置。

```js
 plugins: [
      ['@tarojs/plugin-platform-harmony-cpp', {
      }]
    ],
```



生成后的依赖就是

```js
{
  "name": "entry",
  "version": "1.0.0",
  "description": "Please describe the basic information.",
  "main": "",
  "author": "",
  "license": "",
  "dependencies": {
    "@taro-oh/library": "file:../static/@taro-oh/library-4.1.1.har"
  },
  "devDependencies": {}
}

```

## useChoreLibrary 配置指定版本依赖

比如我们使用的话，就是默认使用本地的配置。

```js
 plugins: [
       ['@tarojs/plugin-platform-harmony-cpp', { useChoreLibrary: '4.1.1' }],
    ],
```

生成后的依赖就是

```js
{
  "name": "entry",
  "version": "1.0.0",
  "description": "Please describe the basic information.",
  "main": "",
  "author": "",
  "license": "",
  "dependencies": {
    "@taro-oh/library": "4.1.1"
  },
  "devDependencies": {}
}

```

