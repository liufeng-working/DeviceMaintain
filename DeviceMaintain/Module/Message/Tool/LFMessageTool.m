//
//  LFMessageTool.m
//  DeviceMaintain
//
//  Created by 刘丰 on 2018/4/2.
//  Copyright © 2018年 liufeng. All rights reserved.
//

#import "LFMessageTool.h"

@implementation LFMessageTool

/**
 消息类型
 */
+ (NSString *)MessageType:(NSInteger)i
{
    switch (i) {
        case 1: return @"设备报警";
        case 2: return @"客户报修";
        case 3: return @"超时接收";
        default: return @"超时关闭";
    }
}

@end
