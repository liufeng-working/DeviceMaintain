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
    [LFNetWorking GET:LFGetDeviceUrl parameters:@{@"pagesize": @10, @"pageno": @(page), @"code": @"", @"clientcode": @"", @"cid": @"", @"type": @1} success:^(id result) {
        if (success) {
            success([LFDeviceModel mj_objectArrayWithKeyValuesArray:result]);
        }
    } failure:^(NSError *error) {
        if (failure) {
            failure();
        }
    }];
}

/**
 人员分配
 */
- (void)getUserWithTid:(NSString *)tid
                   rid:(NSString *)rid
               success:(void(^)(NSArray<LFUserModel *> *users))success
               failure:(void(^)(void))failure
{
    [LFNetWorking GET:tid ? LFGetUserUrl : LFGetUserRepairUrl parameters:@{@"tid": tid ?: @"", @"rid": rid} success:^(id result) {
        if (success) {
            success([[LFUserModel mj_objectArrayWithKeyValuesArray:result] map:^id _Nonnull(LFUserModel *obj) {
                obj.IsCheck = YES;
                return obj;
            }]);
        }
    } failure:^(NSError *error) {
        if (failure) {
            failure();
        }
    }];
}

/**
 提交报修单
 */
- (void)submitRepairWithParam:(NSDictionary *)param
                      success:(void(^)(void))success
                      failure:(void(^)(void))failure
{
    [LFNetWorking POST:LFSubmitUrl parameters:param success:^(id result) {
        if (success) {
            success();
        }
    } failure:^(NSError *error) {
        if (failure) {
            failure();
        }
    }];
}

/**
 接收报修单
 */
- (void)receiveWithId:(NSString *)ID
              success:(void(^)(void))success
              failure:(void(^)(void))failure
{
    [LFNetWorking POST:LFReceiveUrl parameters:@{@"repairID": ID, @"userID": [LFUserManager manager].user.UserID, @"userName": [LFUserManager manager].user.UserCode} success:^(id result) {
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
