//
//  LFLoginTool.h
//  DeviceMaintain
//
//  Created by 刘丰 on 2018/4/1.
//  Copyright © 2018年 liufeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LFLoginTool : NSObject

+ (void)saveUserName:(NSString *)userName;
+ (void)savePassword:(NSString *)password;
+ (NSString *)getUserName;
+ (NSString *)getPassword;
+ (void)saveIP:(NSString *)ip;
+ (NSString *)getIP;

@end
