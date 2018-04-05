//
//  LFReceiveTool.m
//  DeviceMaintain
//
//  Created by 刘丰 on 2018/4/5.
//  Copyright © 2018年 liufeng. All rights reserved.
//

#import "LFReceiveTool.h"

@implementation LFReceiveTool

/**
 保修期限
 */
+ (NSNumber *)WarrantyStatus:(NSString *)s
{
    return @([self.WarrantyStatusString indexOfObjectPassingTest:^BOOL(NSString * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        return [obj isEqualToString:s];
    }]);
}

+ (NSArray<NSString *> *)WarrantyStatusString
{
    return @[@"新机安装", @"保修期内", @"保修期外", @"非经销机床"];
}

@end
