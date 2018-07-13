//
//  SwiftPrintM.swift
//  SwiftPrint
//
//  Created by 章鹏程 on 2018/7/13.
//  Copyright © 2018年 章鹏程. All rights reserved.
//

import Foundation

@objc(SwiftPrint) class SwiftPrint : NSObject {
    // https://stackoverflow.com/questions/39692230/got-is-not-a-recognized-objective-c-method-when-bridging-swift-to-react-native
    @objc
    func test(_ str: NSString) {
        print("swift print \(str)")
    }
}
