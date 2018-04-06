//
//  LFRepairViewModel.m
//  DeviceMaintain
//
//  Created by 刘丰 on 2018/4/2.
//  Copyright © 2018年 liufeng. All rights reserved.
//

#import "LFRepairViewModel.h"

@implementation LFRepairViewModel

- (void)repairListWithType:(LFRepairType)type
                   success:(void(^)(NSArray<LFRepairModel *> *repairs))success
                   failure:(void(^)(void))failure
{
    [LFNetWorking GET:LFRepairUrl parameters:@{@"code": @"", @"uid": [LFUserManager manager].user.UserID, @"status": type ? @(type) : @""} success:^(id result) {
        if (success) {
            success([LFRepairModel mj_objectArrayWithKeyValuesArray:result]);
        }
    } failure:^(NSError *error) {
        if (failure) {
            failure();
        }
    }];
}

- (void)repairDetail:(NSString *)ID
             success:(void(^)(LFRepairDetailModel *detail))success
             failure:(void(^)(void))failure
{
    [LFNetWorking GET:LFRepairDetailUrl parameters:@{@"keyvalue": ID} success:^(id result) {
        if (success) {
            success([LFRepairDetailModel mj_objectWithKeyValues:result]);
        }
    } failure:^(NSError *error) {
        if (failure) {
            failure();
        }
    }];
}

@end
