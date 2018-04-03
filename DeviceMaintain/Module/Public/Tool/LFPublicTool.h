//
//  LFPublicTool.h
//  DeviceMaintain
//
//  Created by 刘丰 on 2018/4/3.
//  Copyright © 2018年 liufeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LFPublicTool : NSObject

/**
 报修单状态
 */
+ (NSString *)status:(NSInteger)s;

/**
 报修单来源
 */
+ (NSString *)RecordSource:(NSInteger)r;

@end
