//
//  Print.h
//  Print
//
//  Created by 章鹏程 on 2018/7/12.
//  Copyright © 2018年 章鹏程. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <React/RCTBridgeModule.h>

@interface Print : NSObject <RCTBridgeModule>
-(void) test: (NSString*) string;
@end
