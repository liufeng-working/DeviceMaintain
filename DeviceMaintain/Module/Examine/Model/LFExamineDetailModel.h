//
//  LFExamineDetailModel.h
//  DeviceMaintain
//
//  Created by 刘丰 on 2018/4/6.
//  Copyright © 2018年 liufeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LFExamineDetailModel : NSObject

@property(nonatomic, copy) NSString *Code;

/**
 报修单id
 */
@property(nonatomic, copy) NSString *RepairID;

/**
 故障类型id
 */
@property(nonatomic, copy) NSString *FaultTypeID;

/**
 到达时间
 */
@property(nonatomic, copy) NSString *ArriveTime;

/**
 离开时间
 */
@property(nonatomic, copy) NSString *LeaveTime;

/**
 维修结果
 */
@property(nonatomic, copy) NSString *MaintResult;

/**
 故障原因
 */
@property(nonatomic, copy) NSString *FaultReason;

/**
 解决方案
 */
@property(nonatomic, copy) NSString *SolveWay;

/**
 建议
 */
@property(nonatomic, copy) NSString *Suggest;

/**
 维修等级
 */
@property(nonatomic, assign) NSInteger MaintGrade;

/**
 审核结果
 */
@property(nonatomic, copy) NSString *AuditRemark;

/**
 维修单状态
 */
@property(nonatomic, assign) NSInteger Status;

/**
 备注
 */
@property(nonatomic, copy) NSString *Remark;

/**
 维修单编号
 */
@property(nonatomic, copy) NSString *RepairCode;

/**
 客户id
 */
@property(nonatomic, copy) NSString *ClientID;

/**
 故障类型
 */
@property(nonatomic, assign) NSInteger FaultCategory;

/**
 故障定义id
 */
@property(nonatomic, copy) NSString *FaultDefinitionID;

/**
 保修期状态
 */
@property(nonatomic, assign) NSInteger WarrantyStatus;

@property(nonatomic, copy) NSString *ID;

/**
 创建时间
 */
@property(nonatomic, copy) NSString *CreateTime;

/**
 创建用户
 */
@property(nonatomic, copy) NSString *CreateUser;

/**
 更新时间
 */
@property(nonatomic, copy) NSString *UpdateTime;

/**
 更新用户
 */
@property(nonatomic, copy) NSString *UpdateUser;

/**
 是否删除
 */
@property(nonatomic, assign) BOOL IsDelete;

@end
