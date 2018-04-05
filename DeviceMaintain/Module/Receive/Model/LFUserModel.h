//
//  LFUserModel.h
//  DeviceMaintain
//
//  Created by 刘丰 on 2018/4/5.
//  Copyright © 2018年 liufeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LFUserModel : NSObject<NSCopying>

/**
 用户主键
 */
@property(nonatomic, copy) NSString *UserID;

/**
 工号
 */
@property(nonatomic, copy) NSString *UserCode;

/**
 用户姓名
 */
@property(nonatomic, copy) NSString *UserName;

/**
 部门id
 */
@property(nonatomic, copy) NSString *DepartmentID;

/**
 部门名称
 */
@property(nonatomic, copy) NSString *DepartmentName;

/**
 职位
 */
@property(nonatomic, copy) NSString *PostName;

/**
 性别
 */
@property(nonatomic, assign) NSInteger Sex;

/**
 是否负责维修
 */
@property(nonatomic, assign) BOOL IsCheck;


@end
