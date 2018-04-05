//
//  LFReceiveTool.h
//  DeviceMaintain
//
//  Created by 刘丰 on 2018/4/5.
//  Copyright © 2018年 liufeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LFReceiveTool : NSObject

/**
 保修期限
 */
+ (NSNumber *)WarrantyStatus:(NSString *)s;
+ (NSArray<NSString *> *)WarrantyStatusString;

@end
