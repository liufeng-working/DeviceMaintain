//
//  LFLoginViewModel.m
//  DeviceMaintain
//
//  Created by 刘丰 on 2018/4/2.
//  Copyright © 2018年 liufeng. All rights reserved.
//

#import "LFLoginViewModel.h"

@implementation LFLoginViewModel

- (void)login:(NSDictionary *)param
      success:(void (^)(void))success
{
    [LFNetWorking GET:LFLoginUrl parameters:param success:^(id result) {
        [LFUserManager manager].user = [LFUser mj_objectWithKeyValues:result];
        if (success) {
            success();
        }
    } failure:^(NSError *error) {
        if (error.code == NSURLErrorUnsupportedURL) {
            [LFNotification autoHideWithText:@"请检查您的ip地址后重试"];
        }
    }];
}

@end
