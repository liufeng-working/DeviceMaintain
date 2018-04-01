//
//  LFTools.m
//  DeviceMaintain
//
//  Created by 刘丰 on 2018/4/1.
//  Copyright © 2018年 liufeng. All rights reserved.
//

#import "LFTools.h"

@implementation LFTools

+ (void)setObject:(id)obj forKey:(NSString *)key
{
    [LFUserDefaults setObject:obj forKey:key];
    [LFUserDefaults synchronize];
}

+ (id)objectForKey:(NSString *)key
{
    id obj = [LFUserDefaults objectForKey:key];
    [LFUserDefaults synchronize];
    return obj;
}

@end
