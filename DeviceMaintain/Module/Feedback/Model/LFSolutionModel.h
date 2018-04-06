//
//  LFSolutionModel.h
//  DeviceMaintain
//
//  Created by 刘丰 on 2018/4/6.
//  Copyright © 2018年 liufeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LFSolutionModel : NSObject

/**
 故障定义id
 */
@property(nonatomic, copy) NSString *FaultDefinitionID;

/**
 故障编号
 */
@property(nonatomic, copy) NSString *FaultCode;

/**
 解决方式
 */
@property(nonatomic, copy) NSString *WayContent;

/**
 解决方案状态  0代表未审核 1代表审核通过 2审核未通过
 */
@property(nonatomic, assign) NSInteger Status;

/**
 备注
 */
@property(nonatomic, copy) NSString *Remark;

/**
 审核人员id
 */
@property(nonatomic, copy) NSString *AuditUser;

/**
 审核时间
 */
@property(nonatomic, copy) NSString *AuditTime;

/**
 故障内容
 */
@property(nonatomic, copy) NSString *FaultContent;

/**
 故障类型名称
 */
@property(nonatomic, copy) NSString *FaultTypeName;

/**
 故障分类
 */
@property(nonatomic, copy) NSString *FaultCategory;

/**
 数控系统型号
 */
@property(nonatomic, copy) NSString *MacCtrlModelName;

/**
 数控系统类型
 */
@property(nonatomic, copy) NSString *MacCtrlTypeName;

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
