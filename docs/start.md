# 我的第一个应用

> [!TIP]
>
> 官方文档 https://developer.huawei.com/consumer/cn/doc/harmonyos-guides-V2/start-with-ets-stage-0000001477980905-V2

## 一、Hello Harmony OS

### 1.1 创建工程

![image-20240604160636345](https://2024-cbq-1311841992.cos.ap-beijing.myqcloud.com/picgo/image-20240604160636345.png)

![image-20240604160654557](https://2024-cbq-1311841992.cos.ap-beijing.myqcloud.com/picgo/image-20240604160654557.png)

![image-20240604160749243](https://2024-cbq-1311841992.cos.ap-beijing.myqcloud.com/picgo/image-20240604160749243.png)

### 1.2 构建第一个页面



```ts
// Index.ets
@Entry
@Component
struct Index {
  @State message: string = 'Hello Harmony OS'

  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
        // 添加按钮，以响应用户点击
        Button() {
          Text('Next')
            .fontSize(30)
            .fontWeight(FontWeight.Bold)
        }
        .type(ButtonType.Capsule)
        .margin({
          top: 20
        })
        .backgroundColor('#0D9FFB')
        .width('40%')
        .height('5%')
      }
      .width('100%')
    }
    .height('100%')
  }
}
```



### 1.3 构建第二个页面

![image-20240604161154646](https://2024-cbq-1311841992.cos.ap-beijing.myqcloud.com/picgo/image-20240604161154646.png)

![image-20240604161322185](https://2024-cbq-1311841992.cos.ap-beijing.myqcloud.com/picgo/image-20240604161322185.png)

```ts
// InfoPage.ets
@Entry
@Component
struct Second {
  @State message: string = 'Hi I am cbq'

  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
        Button() {
          Text('Back')
            .fontSize(25)
            .fontWeight(FontWeight.Bold)
        }
        .type(ButtonType.Capsule)
        .margin({
          top: 20
        })
        .backgroundColor('#0D9FFB')
        .width('40%')
        .height('5%')
      }
      .width('100%')
    }
    .height('100%')
  }
}
```

![image-20240604162255368](https://2024-cbq-1311841992.cos.ap-beijing.myqcloud.com/picgo/image-20240604162255368.png)



### 1.4 实现页面间跳转



```ts
// Index.ets
// 导入页面路由模块
import router from '@ohos.router';

@Entry
@Component
struct Index {
  @State message: string = 'Hello Harmony OS'

  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
        // 添加按钮，以响应用户点击
        Button() {
          Text('Next')
            .fontSize(30)
            .fontWeight(FontWeight.Bold)
        }
        .type(ButtonType.Capsule)
        .margin({
          top: 20
        })
        .backgroundColor('#0D9FFB')
        .width('40%')
        .height('5%')
        // 跳转按钮绑定onClick事件，点击时跳转到第二页
        .onClick(() => {
          console.info(`Succeeded in clicking the 'Next' button.`)
          // 跳转到第二页
          router.pushUrl({ url: 'pages/InfoPage' }).then(() => {
            console.info('Succeeded in jumping to the info page.')
          }).catch((err) => {
            console.error(`Failed to jump to the info page.Code is ${err.code}, message is ${err.message}`)
          })
        })
      }
      .width('100%')
    }
    .height('100%')
  }
}
```



```ts
// InfoPage.ets
// 导入页面路由模块
import router from '@ohos.router';

@Entry
@Component
struct Second {
  @State message: string = 'Hi I am cbq'

  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
        Button() {
          Text('Back')
            .fontSize(25)
            .fontWeight(FontWeight.Bold)
        }
        .type(ButtonType.Capsule)
        .margin({
          top: 20
        })
        .backgroundColor('#0D9FFB')
        .width('40%')
        .height('5%')
        // 返回按钮绑定onClick事件，点击按钮时返回到第一页
        .onClick(() => {
          console.info(`Succeeded in clicking the 'Back' button.`)
          try {
            // 返回第一页
            router.back()
            console.info('Succeeded in returning to the first page.')
          } catch (err) {
            console.error(`Failed to return to the first page.Code is ${err.code}, message is ${err.message}`)
          }
        })
      }
      .width('100%')
    }
    .height('100%')
  }
}
```

![image-20240604161606055](https://2024-cbq-1311841992.cos.ap-beijing.myqcloud.com/picgo/image-20240604161606055.png)

### 1.5 使用模拟机运行查看

![image-20240604161628418](https://2024-cbq-1311841992.cos.ap-beijing.myqcloud.com/picgo/image-20240604161628418.png)

![image-20240604161647967](https://2024-cbq-1311841992.cos.ap-beijing.myqcloud.com/picgo/image-20240604161647967.png)

![image-20240604161726606](https://2024-cbq-1311841992.cos.ap-beijing.myqcloud.com/picgo/image-20240604161726606.png)

![image-20240604162128192](https://2024-cbq-1311841992.cos.ap-beijing.myqcloud.com/picgo/image-20240604162128192.png)

![image-20240604162135929](https://2024-cbq-1311841992.cos.ap-beijing.myqcloud.com/picgo/image-20240604162135929.png)



## 二、项目结构

![image-20240604160858651](https://2024-cbq-1311841992.cos.ap-beijing.myqcloud.com/picgo/image-20240604160858651.png)

- **AppScope > app.json5**：应用的全局配置信息。
- **entry**：HarmonyOS工程模块，编译构建生成一个HAP包。
  - **src > main > ets**：用于存放ArkTS源码。
  - **src > main > ets > entryability**：应用/服务的入口。
  - **src > main > ets > pages**：应用/服务包含的页面。
  - **src > main > resources**：用于存放应用/服务所用到的资源文件，如图形、多媒体、字符串、布局文件等。关于资源文件，详见 [资源分类与访问](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides-V2/resource-categories-and-access-0000001711674888-V2)。
  - **src > main > module.json5**：Stage模型模块配置文件。主要包含HAP包的配置信息、应用/服务在具体设备上的配置信息以及应用/服务的全局配置信息。具体的配置文件说明，详见 [module.json5配置文件](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides-V2/module-configuration-file-0000001427744540-V2)。
  - **build-profile.json5**：当前的模块信息、编译信息配置项，包括buildOption、targets配置等。其中targets中可配置当前运行环境，默认为HarmonyOS。
  - **hvigorfile.ts**：模块级编译构建任务脚本，开发者可以自定义相关任务和代码实现。
- **oh_modules**：用于存放三方库依赖信息。关于原npm工程适配ohpm操作，请参考 [历史工程迁移](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides-V2/project_overview-0000001053822398-V2)。
- **build-profile.json5**：应用级配置信息，包括签名、产品配置等。
- **hvigorfile.ts**：应用级编译构建任务脚本。

## 三、State 模型

每个应用项目必须在项目的代码目录下加入配置文件，这些配置文件会向编译工具、操作系统和应用市场提供应用的基本信息。

在基于Stage模型开发的应用项目代码下，都存在一个app.json5及一个或多个module.json5这两种配置文件。

[app.json5](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides-V2/app-configuration-file-0000001427584584-V2) 主要包含以下内容：

- 应用的全局配置信息，包含应用的包名、开发厂商、版本号等基本信息。
- 特定设备类型的配置信息。

[module.json5](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides-V2/module-configuration-file-0000001427744540-V2) 主要包含以下内容：

- Module的基本配置信息，例如Module名称、类型、描述、支持的设备类型等基本信息。
- [应用组件](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides-V2/stage-model-development-overview-0000001427744552-V2) 信息，包含UIAbility组件和ExtensionAbility组件的描述信息。
- 应用运行过程中所需的权限信息。

基于[Stage模型](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides-V2/application-configuration-file-overview-stage-0000001428061460-V2)开发的应用，经编译打包后，其应用程序包结构如下图**应用程序包结构（Stage模型）**所示。开发者需要熟悉应用程序包结构相关的基本概念。

- 在开发态，一个应用包含一个或者多个Module，可以在DevEco Studio工程中[创建一个或者多个Module](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides-V2/add_new_module-0000001053223741-V2)。Module是HarmonyOS应用/服务的基本功能单元，包含了源代码、资源文件、第三方库及应用/服务配置文件，每一个Module都可以独立进行编译和运行。Module分为“Ability”和“Library”两种类型，“Ability”类型的Module对应于编译后的HAP（Harmony Ability Package）；“Library”类型的Module对应于[HAR](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides-V2/har-package-0000001573432125-V2)（Harmony Archive），或者[HSP](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides-V2/in-app-hsp-0000001523312158-V2)（Harmony Shared Package）。

  一个Module可以包含一个或多个[UIAbility](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides-V2/uiability-overview-0000001477980929-V2)组件，如下图所示。

![image-20240604162511601](https://2024-cbq-1311841992.cos.ap-beijing.myqcloud.com/picgo/image-20240604162511601.png)

- 全文中介绍到的Module默认指的是“Ability”类型的Module。

- 开发者通过DevEco Studio把应用程序编译为一个或者多个.hap后缀的文件，即HAP。HAP是HarmonyOS应用安装的基本单位，包含了编译后的代码、资源、三方库及配置文件。HAP可分为Entry和Feature两种类型。

  - Entry类型的HAP：是应用的主模块，在[module.json5配置文件](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides-V2/module-configuration-file-0000001427744540-V2)中的type标签配置为“entry”类型。在同一个应用中，同一设备类型只支持一个Entry类型的HAP，通常用于实现应用的入口界面、入口图标、主特性功能等。
  - Feature类型的HAP：是应用的动态特性模块，在[module.json5配置文件](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides-V2/module-configuration-file-0000001427744540-V2)中的type标签配置为“feature”类型。一个应用程序包可以包含一个或多个Feature类型的HAP，也可以不包含；Feature类型的HAP通常用于实现应用的特性功能，可以配置成按需下载安装，也可以配置成随Entry类型的HAP一起下载安装（请参见[module对象内部结构](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides-V2/module-configuration-file-0000001427744540-V2)中的“deliveryWithInstall”）。

- 每个HarmonyOS应用可以包含多个.hap文件，一个应用中的.hap文件合在一起称为一个Bundle，而bundleName就是应用的唯一标识（请参见[app.json5配置文件](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides-V2/app-configuration-file-0000001427584584-V2)中的bundleName标签）。需要特别说明的是：在应用上架到应用市场时，需要把应用包含的所有.hap文件（即Bundle）打包为一个.app后缀的文件用于上架，这个.app文件称为App Pack（Application Package），其中同时包含了描述App Pack属性的pack.info文件；在云端（服务器）分发和终端设备安装时，都是以HAP为单位进行分发和安装的。

- 打包后的HAP包结构包括ets、libs、resources等文件夹和resources.index、module.json、pack.info等文件。

  - ets目录用于存放应用代码编译后的字节码文件。
  - libs目录用于存放库文件。库文件是HarmonyOS应用依赖的第三方代码（.so二进制文件）。
  - resources目录用于存放应用的资源文件（字符串、图片等），便于开发者使用和维护，详见[资源分类与访问](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides-V2/resource-categories-and-access-0000001711674888-V2)。
  - resources.index是资源索引表，由IDE编译工程时生成。
  - module.json是HAP的配置文件，内容由工程配置中的module.json5和app.json5组成，该文件是HAP中必不可少的文件。IDE会自动生成一部分默认配置，开发者按需修改其中的配置。详细字段请参见[应用配置文件](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides-V2/application-configuration-file-overview-stage-0000001428061460-V2)。
  - pack.info是Bundle中用于描述每个HAP属性的文件，例如app中的bundleName和versionCode信息、module中的name、type和abilities等信息，由IDE工具生成Bundle包时自动生成。

  ![image-20240604162538013](https://2024-cbq-1311841992.cos.ap-beijing.myqcloud.com/picgo/image-20240604162538013.png)

## 四、UIAbility

TODO 

## 五、ArkTS

> [!CAUTION]
>
> ArkTS 严格来说并不是一门语言，其主要思想是 取其精华弃其糟粕，例如：
>
> - ArkTS： 类似于 TypeScript 具有强类型
> - ArkTS： 类似于 Fluter 具有链式调用
