//
//  LFFaultModel.h
//  DeviceMaintain
//
//  Created by 刘丰 on 2018/4/6.
//  Copyright © 2018年 liufeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LFFaultModel : NSObject

/**
 故障编号
 */
@property(nonatomic, copy) NSString *Code;

/**
 故障名
 */
@property(nonatomic, copy) NSString *Name;

/**
 故障类型
 */
@property(nonatomic, assign) NSInteger FaultCategory;

/**
 数控系统类型id
 */
@property(nonatomic, copy) NSString *MacCtrlTypeID;

/**
 数控系统型号id
 */
@property(nonatomic, copy) NSString *MacCtrlModelID;

/**
 排序号
 */
@property(nonatomic, assign) NSInteger SortCode;

/**
 备注
 */
@property(nonatomic, copy) NSString *Remark;

@property(nonatomic, copy) NSString *ID;

/**
 创建时间
 */
@property(nonatomic, copy) NSString *CreateTime;

/**
 创建用户id
 */
@property(nonatomic, copy) NSString *CreateUser;

/**
 更新时间
 */
@property(nonatomic, copy) NSString *UpdateTime;

/**
 更新用户id
 */
@property(nonatomic, copy) NSString *UpdateUser;

@property(nonatomic, assign) BOOL IsDelete;

@end
