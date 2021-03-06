//
//  LFUser.h
//  DeviceMaintain
//
//  Created by 刘丰 on 2018/4/1.
//  Copyright © 2018年 liufeng. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, LFUserType) {
    LFUserTypeDefault        = 0,// 0.默认
    LFUserTypeClient         = 1,// 1.客户
    LFUserTypeServer         = 2,// 2.售后
    LFUserTypeServerDirector = 3,// 3.售后主管
    LFUserTypeHQDirector     = 4,// 4.总部主管
};

@interface LFUser : NSObject

/**
 用户id
 */
@property(nonatomic, copy) NSString *UserID;

/**
 用户code
 */
@property(nonatomic, copy) NSString *UserCode;

/**
 用户名
 */
@property(nonatomic, copy) NSString *UserName;

/**
 性别 0.女  1.男
 */
@property(nonatomic, assign) NSInteger Sex;

/**
 职位类型。0.默认  1.客户  2.售后  3.售后主管  4.总部主管
 */
@property(nonatomic, assign) LFUserType Post;

/**
 客户id
 */
@property(nonatomic, copy) NSString *ClientID;

/**
 是否大客户
 */
@property(nonatomic, assign) BOOL IsBigClient;

@end
