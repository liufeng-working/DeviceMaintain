//
//  NSArray+LFCategory.h
//  DeviceMaintain
//
//  Created by 刘丰 on 2018/4/5.
//  Copyright © 2018年 liufeng. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSArray<T> (LFCategory)

- (nullable NSArray<id> *)map:(id(^)(T obj))block;

@end

NS_ASSUME_NONNULL_END
