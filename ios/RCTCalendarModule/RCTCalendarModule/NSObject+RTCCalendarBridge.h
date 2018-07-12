//
//  NSObject+RTCCalendarBridge.h
//  RCTCalendarModule
//
//  Created by 章鹏程 on 2018/7/12.
//  Copyright © 2018年 章鹏程. All rights reserved.
//

#import <React/RCTBridgeModule.h>

@interface RCT_EXTERN_MODULE(RCTCalendarModule, NSObject)
    RCT_EXTERN_METHOD(addEvent:(NSString *)name location:(NSString *)location date:(nonnull NSNumber *)date)
@end
