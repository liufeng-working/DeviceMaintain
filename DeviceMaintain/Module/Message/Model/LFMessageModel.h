//
//  LFMessageModel.h
//  DeviceMaintain
//
//  Created by 刘丰 on 2018/4/2.
//  Copyright © 2018年 liufeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LFMessageModel : NSObject

@property(nonatomic, copy) NSString *ID;
@property(nonatomic, copy) NSString *UserID;
@property(nonatomic, copy) NSString *RepairID;
@property(nonatomic, copy) NSString *MaintID;
@property(nonatomic, assign) NSInteger Status;
@property(nonatomic, assign) NSInteger MessageType;
@property(nonatomic, copy) NSString *Content;
@property(nonatomic, assign) NSInteger RecordSource;
@property(nonatomic, copy) NSString *Remark;
@property(nonatomic, copy) NSString *CreateTime;
@property(nonatomic, copy) NSString *CreateUser;
@property(nonatomic, copy) NSString *UpdateTime;
@property(nonatomic, copy) NSString *UpdateUser;
@property(nonatomic, assign) BOOL IsDelete;
@property(nonatomic, copy) NSString *UserName;

@end

@interface LFMessageModel (extension)

@property(nonatomic, copy, readonly) NSString *MessageTypeString;

@end
