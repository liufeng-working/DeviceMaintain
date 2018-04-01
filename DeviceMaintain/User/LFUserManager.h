//
//  LFUserManager.h
//  DeviceMaintain
//
//  Created by 刘丰 on 2018/4/1.
//  Copyright © 2018年 liufeng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LFUser.h"

@interface LFUserManager : NSObject<NSCopying, NSMutableCopying>

/**
 单例
 */
+ (instancetype)manager;

/**
 登陆成功后，赋值一次，其他地方只允许调用
 */
@property(nonatomic, strong) LFUser *user;

@end
