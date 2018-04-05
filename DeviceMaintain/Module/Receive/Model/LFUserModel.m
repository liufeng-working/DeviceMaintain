//
//  LFUserModel.m
//  DeviceMaintain
//
//  Created by 刘丰 on 2018/4/5.
//  Copyright © 2018年 liufeng. All rights reserved.
//

#import "LFUserModel.h"

@implementation LFUserModel

- (id)copyWithZone:(nullable NSZone *)zone {
    LFUserModel *user = [[LFUserModel alloc] init];
    user.UserID = self.UserID;
    user.UserCode = self.UserCode;
    user.UserName = self.UserName;
    user.DepartmentID = self.DepartmentID;
    user.DepartmentName = self.DepartmentName;
    user.PostName = self.PostName;
    user.Sex = self.Sex;
    user.IsCheck = self.IsCheck;
    return user;
}

@end
