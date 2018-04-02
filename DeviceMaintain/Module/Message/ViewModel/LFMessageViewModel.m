//
//  LFMessageViewModel.m
//  DeviceMaintain
//
//  Created by 刘丰 on 2018/4/2.
//  Copyright © 2018年 liufeng. All rights reserved.
//

#import "LFMessageViewModel.h"

@implementation LFMessageViewModel

- (void)messagesWithType:(LFMessageType)type
                 success:(void(^)(NSArray<LFMessageModel *> *messages))success
                 failure:(void(^)(void))failure
{
    [LFNetWorking GET:LFMessageUrl parameters:@{@"uid": [LFUserManager manager].user.UserID} success:^(id result) {
        if (success) {
            NSArray<LFMessageModel *> *t = [LFMessageModel mj_objectArrayWithKeyValuesArray:result];
            NSArray *tempArr = [NSArray array];
            if (type == LFMessageTypeUnread) {
                NSPredicate *p = [NSPredicate predicateWithFormat:@"Status==0"];
                tempArr = [t filteredArrayUsingPredicate:p];
            }else if (type == LFMessageTypeRead) {
                NSPredicate *p = [NSPredicate predicateWithFormat:@"Status==1"];
                tempArr = [t filteredArrayUsingPredicate:p];
            }
            success(tempArr);
        }
    } failure:^(NSError *error) {
        if (failure) {
            failure();
        }
    }];
}

@end
