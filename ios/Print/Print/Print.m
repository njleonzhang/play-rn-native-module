//
//  Print.m
//  Print
//
//  Created by 章鹏程 on 2018/7/12.
//  Copyright © 2018年 章鹏程. All rights reserved.
//

#import "Print.h"

@implementation Print

RCT_EXPORT_MODULE();

RCT_EXPORT_METHOD(test1: (NSString*) string callback: (RCTResponseSenderBlock) callback) {
    NSLog(string);
    callback(@[@1,  @{@"x":@1, @"y":@2, @"z":@3, @"date": @([[NSDate date] timeIntervalSince1970]) }]);
}

// prevent warning
+ (BOOL)requiresMainQueueSetup
{
    return YES;
}

- (NSDictionary *)constantsToExport
{
    return @{ @"firstDayOfTheWeek": @"Monday" };
}
@end
