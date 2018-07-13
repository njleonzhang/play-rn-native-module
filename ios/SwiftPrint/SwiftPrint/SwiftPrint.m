//
//  SwiftPrint.m
//  SwiftPrint
//
//  Created by 章鹏程 on 2018/7/13.
//  Copyright © 2018年 章鹏程. All rights reserved.
//

#import <React/RCTBridgeModule.h>

@interface RCT_EXTERN_MODULE(SwiftPrint, NSObject)
RCT_EXTERN_METHOD(test:(NSString*)str);

// prevent warning
+ (BOOL)requiresMainQueueSetup
{
    return YES;
}
@end
