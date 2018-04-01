//
//  LFLoginTool.m
//  DeviceMaintain
//
//  Created by 刘丰 on 2018/4/1.
//  Copyright © 2018年 liufeng. All rights reserved.
//

#import "LFLoginTool.h"

@implementation LFLoginTool

+ (void)saveUserName:(NSString *)userName
{
    [LFTools setObject:userName forKey:LFUserNameKey];
}

+ (NSString *)getUserName
{
    return [LFTools objectForKey:LFUserNameKey];
}

+ (void)savePassword:(NSString *)password
{
    [LFTools setObject:password forKey:LFPasswordKey];
}

+ (NSString *)getPassword
{
    return [LFTools objectForKey:LFPasswordKey];
}

+ (void)saveIP:(NSString *)ip
{
    [LFTools setObject:ip forKey:LFIPKey];
}

+ (NSString *)getIP
{
    return [LFTools objectForKey:LFIPKey];
}

@end
