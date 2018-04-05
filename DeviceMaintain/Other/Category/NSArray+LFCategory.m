//
//  NSArray+LFCategory.m
//  DeviceMaintain
//
//  Created by 刘丰 on 2018/4/5.
//  Copyright © 2018年 liufeng. All rights reserved.
//

#import "NSArray+LFCategory.h"

@implementation NSArray (LFCategory)

- (nullable NSArray<id> *)map:(id(^)(id obj))block
{
    if (!self.count) {
        return nil;
    }
    
    if (!block) {
        return self;
    }
    
    NSMutableArray *resultArray = [NSMutableArray array];
    [self enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [resultArray addObject:block(obj)];
    }];
    
    return resultArray;
}

@end
