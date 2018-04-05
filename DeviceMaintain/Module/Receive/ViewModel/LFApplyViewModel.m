//
//  LFApplyViewModel.m
//  DeviceMaintain
//
//  Created by 刘丰 on 2018/4/5.
//  Copyright © 2018年 liufeng. All rights reserved.
//

#import "LFApplyViewModel.h"

@implementation LFApplyViewModel

/**
 获取报修单号
 */
- (void)getRepairCode:(void(^)(NSString *code))success
              failure:(void(^)(void))failure
{
    [LFNetWorking GET:LFGetRepairCodeUrl parameters:@{} success:^(id result) {
        if (success) {
            success(result);
        }
    } failure:^(NSError *error) {
        if (failure) {
            failure();
        }
    }];
}

/**
 获取设备列表
 */
- (void)getDeviceListWithPage:(NSInteger)page
                    success:(void(^)(NSArray<LFDeviceModel *> *devices))success
                    failure:(void(^)(void))failure
{
    [LFNetWorking GET:LFGetGetDeviceUrl parameters:@{@"pagesize": @10, @"pageno": @(page), @"code": @"", @"clientcode": @"", @"cid": @"", @"type": @1} success:^(id result) {
        if (success) {
            success([LFDeviceModel mj_objectArrayWithKeyValuesArray:result]);
        }
    } failure:^(NSError *error) {
        if (failure) {
            failure();
        }
    }];
}

@end
