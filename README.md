# play-rn-native-module

# ios 版，开发过程和注意事项

主要思路是把 `native module` 作为一个静态库，并连接到RN工程中去，具体步骤如下：

1. 在 `ios` 目录下，用 XCode 创建一个ios工程，类型为静态库. `File` -> `new` -> `Project` -> `Cocoa Touch Static Library`. 本例中 `Print` 和 `SwiftPrint` 都是这么创建出来的。
2. 按照 [RN 文档](https://facebook.github.io/react-native/docs/native-modules-ios), 使用宏去导出 `js` 能调用的接口。
3. 把 native module 的项目 拖入到 Demo 工程的 Libraries 目录下。
4. 把 native module 工程的目标静态库，引入到 RN 工程（本例中的demo工程）的链接过程中。`demo Project` -> `targets` -> `demo` -> `Build Phases` -> `Link Binary with Libraries` -> 添加 `libPrint.a` 和 `libSwiftPrint.a`

如果使用 swift （例子中的: SwiftPrint）来开发，则有几点需要注意的：
  1. 参照文档去，使用 OC 宏来导出
      ```
        @objc(test:callback:)
        func test(str: NSString, callback: RCTResponseSenderBlock) {
            NSLog("swift print \(str)")
            callback([1, ["x": 1, "y": 2, "z": 3, "date": NSDate().timeIntervalSince1970]]);
        }
      ```

      或者可以省略 `@objc` 里的参数说明，但注意在函数的第一个参数前加个 `_`

      ```
        @objc
        func test(_ str: NSString, callback: RCTResponseSenderBlock) {
            print("swift print \(str)");
            NSlog("swift print \(str)")
            callback([1, ["x": 1, "y": 2, "z": 3, "date": NSDate().timeIntervalSince1970]]);
        }
      ```
  2. swift 和 OC 互调
    * OC 调 swift，就 import `项目名-Swift.h`
    * swift 调 OC, 在 `项目名-Bridging-Header.h` 文件里引入 swift 用到的头文件

  3. RN 项目里需要有一个空的 swift 文件, 否则链接会出错.

  > 总体上说，使用 swift 还是有点麻烦. 但是代码对于我这样非 smallTalk 语系的码农来说看着确实舒服点.

# android 版，开发过程和注意事项
思路和ios的类似，把 native module 做成一个独立的模块。

1. 用Android Studio打开 demo 目录下的android项目, 创建模块。`File` -> `New` -> `New Module...` -> `Android Library`. 完成后在 demo/android 的目录下会生成一个模块。
2. 我们想做是公共模块，所以把这个模块移到 `play-rn-native-module/android` 的里。为了让 demo 项目能够识别这个模块。我们需要修改 demo 项目 settings.gradle 以及 demo/app/build.gradle

    ```
    // settings.gradle
    include ':app', ':react-toast-module'

    project(':react-toast-module').projectDir = new File(rootProject.projectDir, '../../android')
    ```

    ```
    // app/build.gradle
    dependencies {
        compile fileTree(dir: "libs", include: ["*.jar"])
        compile "com.android.support:appcompat-v7:${rootProject.ext.supportLibVersion}"
        compile "com.facebook.react:react-native:+"  // From node_modules
        compile project(':react-toast-module')
    }
    ```
  3. 按[文档](https://facebook.github.io/react-native/docs/native-modules-android)实现 native 模块. 唯一要注意的就是模块也要添加 react-native 依赖

      ```
      // play-rn-native-module/android/build.gradle
      dependencies {
          compile fileTree(dir: 'libs', include: ['*.jar'])
          compile 'com.android.support:appcompat-v7:26.1.0'
          testCompile 'junit:junit:4.12'
          androidTestCompile('com.android.support.test.espresso:espresso-core:3.0.2', {
              exclude group: 'com.android.support', module: 'support-annotations'
          })

        compile "com.facebook.react:react-native:+"  // From node_modules
      }
      ```
