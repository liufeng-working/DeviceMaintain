//
//  LFFeedbackViewModel.m
//  DeviceMaintain
//
//  Created by 刘丰 on 2018/4/6.
//  Copyright © 2018年 liufeng. All rights reserved.
//

#import "LFFeedbackViewModel.h"

@implementation LFFeedbackViewModel

/**
 故障分类
 */
- (void)getFaults:(void(^)(NSArray<LFFaultModel *> *faults))success
          failure:(void(^)(void))failure
{
    [LFNetWorking GET:LFFaultUrl parameters:@{} success:^(id result) {
        if (success) {
            success([LFFaultModel mj_objectArrayWithKeyValuesArray:result]);
        }
    } failure:^(NSError *error) {
        if (failure) {
            failure();
        }
    }];
}

@end
