//
//  LFRepairDetailModel.h
//  DeviceMaintain
//
//  Created by 刘丰 on 2018/4/2.
//  Copyright © 2018年 liufeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LFRepairDetailModel : NSObject

@property(nonatomic, copy) NSString *Code;
@property(nonatomic, copy) NSString *RepairDate;
@property(nonatomic, copy) NSString *RepairMan;
@property(nonatomic, copy) NSString *ContactWay;
@property(nonatomic, copy) NSString *MachineID;
@property(nonatomic, assign) NSInteger WarrantyStatus;
@property(nonatomic, copy) NSString *ClientID;
@property(nonatomic, copy) NSString *MacAddress;
@property(nonatomic, copy) NSString *FaultDescription;
@property(nonatomic, assign) NSInteger Status;
@property(nonatomic, assign) NSInteger RecordSource;
@property(nonatomic, copy) NSString *Remark;
@property(nonatomic, copy) NSString *FaultDefinitionID;
@property(nonatomic, copy) NSString *ClientName;
@property(nonatomic, copy) NSString *ClientCode;
@property(nonatomic, copy) NSString *FactoryCode;
@property(nonatomic, copy) NSString *MacModelName;
@property(nonatomic, copy) NSString *FactoryTime;
@property(nonatomic, copy) NSString *MacCtrlName;
@property(nonatomic, copy) NSString *FactoryName;
@property(nonatomic, copy) NSString *WorkShopName;
@property(nonatomic, copy) NSString *ClientPhone;
@property(nonatomic, copy) NSString *ClientMobile;
@property(nonatomic, copy) NSString *OfficeName;
@property(nonatomic, copy) NSString *MaintID;
@property(nonatomic, copy) NSString *ID;
@property(nonatomic, copy) NSString *CreateTime;
@property(nonatomic, copy) NSString *CreateUser;
@property(nonatomic, copy) NSString *UpdateTime;
@property(nonatomic, copy) NSString *UpdateUser;
@property(nonatomic, assign) BOOL IsDelete;

@end

@interface LFRepairDetailModel (extesion)

@property(nonatomic, copy, readonly) NSString *RecordSourceString;

@end
