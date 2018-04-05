//
//  LFDeviceModel.h
//  DeviceMaintain
//
//  Created by 刘丰 on 2018/4/5.
//  Copyright © 2018年 liufeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LFDeviceModel : NSObject

/**
 厂家编号
 */
@property(nonatomic, copy) NSString *Code;

/**
 客户编号
 */
@property(nonatomic, copy) NSString *ClientCode;

/**
 设备型号
 */
@property(nonatomic, copy) NSString *MacModelName;

/**
 出厂时间
 */
@property(nonatomic, copy) NSString *FactoryTime;

/**
 保修截止时间
 */
@property(nonatomic, copy) NSString *WarrantyTime;


/**
 数控系统型号
 */
@property(nonatomic, copy) NSString *CtrlModelName;

/**
 数控系统类型
 */
@property(nonatomic, copy) NSString *CtrlTypeName;

/**
 客户id
 */
@property(nonatomic, copy) NSString *ClientID;

/**
 客户名称
 */
@property(nonatomic, copy) NSString *ClientName;

/**
 工厂名称
 */
@property(nonatomic, copy) NSString *FactoryName;

/**
 车间名称
 */
@property(nonatomic, copy) NSString *WorkShopName;

/**
 客户联系电话
 */
@property(nonatomic, copy) NSString *ClientMobile;

/**
 所属办事处
 */
@property(nonatomic, copy) NSString *OfficeName;

/**
 客户地址
 */
@property(nonatomic, copy) NSString *ClientAddress;

@end
