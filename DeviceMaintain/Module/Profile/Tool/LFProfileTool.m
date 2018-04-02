//
//  LFProfileTool.m
//  DeviceMaintain
//
//  Created by 刘丰 on 2018/4/1.
//  Copyright © 2018年 liufeng. All rights reserved.
//

#import "LFProfileTool.h"

@implementation LFProfileTool

/**
 报修单状态
 */
+ (NSString *)status:(NSInteger)s
{
    switch (s) {
        case 1: return @"待接收";
        case 2: return @"待反馈";
        case 3: return @"待审核";
        case 4: return @"待评价";
        default: return @"关闭";
    }
}

/**
 报修单来源
 */
+ (NSString *)RecordSource:(NSInteger)r
{
    switch (r) {
        case 1: return @"机床报警";
        default: return @"客户报修";
    }
}

@end
