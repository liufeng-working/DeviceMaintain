//
//  LFMessageViewModel.m
//  DeviceMaintain
//
//  Created by 刘丰 on 2018/4/2.
//  Copyright © 2018年 liufeng. All rights reserved.
//

#import "LFMessageViewModel.h"

@implementation LFMessageViewModel

- (void)messagesWithSuccess:(void(^)(NSArray<LFMessageModel *> *messages))success
                    failure:(void(^)(void))failure
{
    [LFNetWorking GET:LFMessageUrl parameters:@{@"uid": [LFUserManager manager].user.UserID} success:^(id result) {
        if (success) {
            NSArray<LFMessageModel *> *t = [LFMessageModel mj_objectArrayWithKeyValuesArray:result];
            success(t);
        }
    } failure:^(NSError *error) {
        if (failure) {
            failure();
        }
    }];
}

- (void)messageDetailWithId:(NSString *)messageId
{
    [LFNetWorking GET:LFMessageDetailUrl parameters:@{@"uid": [LFUserManager manager].user.UserID, @"Keyvalue": messageId} success:^(id result) {
        
    } failure:^(NSError *error) {
        
    }];
}

@end
