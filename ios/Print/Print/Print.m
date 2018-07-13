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

-(void) test: (NSString*) string {
    NSLog(string);
}

RCT_EXPORT_METHOD(test1: (NSString*) string) {
    NSLog(string);
}

@end
