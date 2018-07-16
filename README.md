# play-rn-native-module

# ios 版，开发过程和注意事项

对于 `ios` 来说，这里把 `native module` 作为一个静态库，并连接到RN工程中去，具体步骤如下：

1. 在 `ios` 目录下，创建一个ios工程，类型为静态库. `File` -> `new` -> `Project` -> `Cocoa Touch Static Library`. 本例中 `Print` 和 `SwiftPrint` 都是这么创建出来的。
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
