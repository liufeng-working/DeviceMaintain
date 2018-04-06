//
//  LFExamineViewModel.m
//  DeviceMaintain
//
//  Created by 刘丰 on 2018/4/6.
//  Copyright © 2018年 liufeng. All rights reserved.
//

#import "LFExamineViewModel.h"

@implementation LFExamineViewModel

- (void)getExamineDetailWithId:(NSString *)ID
                       success:(void(^)(LFExamineDetailModel *detailM))success
                       failure:(void(^)(void))failure
{
    [LFNetWorking GET:LFExamineDetailUrl parameters:@{@"keyvalue": ID} success:^(id result) {
        if (success) {
            success([LFExamineDetailModel mj_objectWithKeyValues:result]);
        }
    } failure:^(NSError *error) {
        if (failure) {
            failure();
        }
    }];
}

- (void)examineWithId:(NSString *)ID
                  msg:(NSString *)msg
              success:(void(^)(void))success
              failure:(void(^)(void))failure
{
    [LFNetWorking POST:LFExamineUrl parameters:@{@"RepairID": ID, @"UserID": [LFUserManager manager].user.UserID, @"UserName": [LFUserManager manager].user.UserCode, @"AuditRemark": msg} success:^(id result) {
        if (success) {
            success();
        }
    } failure:^(NSError *error) {
        if (failure) {
            failure();
        }
    }];
}

@end
