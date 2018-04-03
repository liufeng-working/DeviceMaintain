//
//  LFRepairModel.h
//  DeviceMaintain
//
//  Created by 刘丰 on 2018/4/1.
//  Copyright © 2018年 liufeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LFRepairModel : NSObject

/**
 报修单id
 */
@property(nonatomic, copy) NSString *ID;

/**
 报修单编号
 */
@property(nonatomic, copy) NSString *RepairCode;

/**
 报修日期
 */
@property(nonatomic, copy) NSString *RepairDate;

/**
 厂家机床编号
 */
@property(nonatomic, copy) NSString *FactoryCode;

/**
 客户机床编号
 */
@property(nonatomic, copy) NSString *ClientCode;

/**
 报修单状态。1 待接收，2 待反馈， 3 待审核， 4待评价， 5 关闭
 */
@property(nonatomic, assign) NSInteger Status;

/**
 报修单来源  1 机床报警 ， 2 客户报修
 */
@property(nonatomic, assign) NSInteger RecordSource;

@end

@interface LFRepairModel (extension)

@property(nonatomic, copy, readonly) NSString *statusString;

@end
