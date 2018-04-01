//
//  LFHistoryRepairViewModel.m
//  DeviceMaintain
//
//  Created by 刘丰 on 2018/4/2.
//  Copyright © 2018年 liufeng. All rights reserved.
//

#import "LFHistoryRepairViewModel.h"

@implementation LFHistoryRepairViewModel

- (void)historyRepairList:(void(^)(NSArray<LFHistoryRepairModel *> *repairs))success
                  failure:(void(^)(void))failure
{
    [LFNetWorking GET:LFHistoryRepairUrl parameters:@{@"code": @"", @"uid": [LFUserManager manager].user.UserID, @"status": @""} success:^(id result) {
        if (success) {
            success([LFHistoryRepairModel mj_objectArrayWithKeyValuesArray:result]);
        }
    } failure:^(NSError *error) {
        if (failure) {
            failure();
        }
    }];
}

@end
