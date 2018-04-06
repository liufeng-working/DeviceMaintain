//
//  LFRepairDetailModel.h
//  DeviceMaintain
//
//  Created by 刘丰 on 2018/4/2.
//  Copyright © 2018年 liufeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LFRepairDetailModel : NSObject

/**
 报修单号
 */
@property(nonatomic, copy) NSString *Code;

/**
 报修日期
 */
@property(nonatomic, copy) NSString *RepairDate;

/**
 报修人
 */
@property(nonatomic, copy) NSString *RepairMan;

/**
 联系方式
 */
@property(nonatomic, copy) NSString *ContactWay;

/**
 机床id
 */
@property(nonatomic, copy) NSString *MachineID;

/**
 保修状态。1 新机安装，2 保修期内， 3 保修期外， 4非经销机床
 */
@property(nonatomic, assign) NSInteger WarrantyStatus;

/**
 客户id
 */
@property(nonatomic, copy) NSString *ClientID;

/**
 机器地址
 */
@property(nonatomic, copy) NSString *MacAddress;

/**
 故障描述
 */
@property(nonatomic, copy) NSString *FaultDescription;

/**
 报修单状态
 */
@property(nonatomic, assign) NSInteger Status;

/**
 报修来源
 */
@property(nonatomic, assign) NSInteger RecordSource;

/**
 备注
 */
@property(nonatomic, copy) NSString *Remark;

/**
 故障id
 */
@property(nonatomic, copy) NSString *FaultDefinitionID;

/**
 客户名
 */
@property(nonatomic, copy) NSString *ClientName;

/**
 客户机床编号
 */
@property(nonatomic, copy) NSString *ClientCode;

/**
 机床厂家编号
 */
@property(nonatomic, copy) NSString *FactoryCode;

/**
 机床型号
 */
@property(nonatomic, copy) NSString *MacModelName;

/**
 出厂时间
 */
@property(nonatomic, copy) NSString *FactoryTime;

/**
 数控系统
 */
@property(nonatomic, copy) NSString *MacCtrlName;

/**
 工厂名
 */
@property(nonatomic, copy) NSString *FactoryName;

/**
 车间名
 */
@property(nonatomic, copy) NSString *WorkShopName;

/**
 客户手机
 */
@property(nonatomic, copy) NSString *ClientPhone;

/**
 客户电话
 */
@property(nonatomic, copy) NSString *ClientMobile;

/**
 所属办事处
 */
@property(nonatomic, copy) NSString *OfficeName;

/**
 维修单id
 */
@property(nonatomic, copy) NSString *MaintID;

/**
 报修单id
 */
@property(nonatomic, copy) NSString *ID;

/**
 创建时间
 */
@property(nonatomic, copy) NSString *CreateTime;

/**
 创建用户主键
 */
@property(nonatomic, copy) NSString *CreateUser;

/**
 更新时间
 */
@property(nonatomic, copy) NSString *UpdateTime;

/**
 更新用户主键
 */
@property(nonatomic, copy) NSString *UpdateUser;

/**
 <#Description#>
 */
@property(nonatomic, assign) BOOL IsDelete;

@end

@interface LFRepairDetailModel (extesion)

@property(nonatomic, copy, readonly) NSString *RecordSourceString;

@end
