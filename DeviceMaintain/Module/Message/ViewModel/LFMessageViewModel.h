//
//  LFMessageViewModel.h
//  DeviceMaintain
//
//  Created by 刘丰 on 2018/4/2.
//  Copyright © 2018年 liufeng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LFMessageModel.h"

@interface LFMessageViewModel : NSObject

- (void)messagesWithSuccess:(void(^)(NSArray<LFMessageModel *> *messages))success
                    failure:(void(^)(void))failure;

- (void)messageDetailWithId:(NSString *)messageId;

@end
