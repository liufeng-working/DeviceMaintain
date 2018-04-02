//
//  LFMessageViewModel.h
//  DeviceMaintain
//
//  Created by 刘丰 on 2018/4/2.
//  Copyright © 2018年 liufeng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LFMessageModel.h"

typedef NS_ENUM(NSInteger, LFMessageType) {
    LFMessageTypeUnread = 504,// 未读
    LFMessageTypeRead   = 419,// 已读
};

@interface LFMessageViewModel : NSObject

- (void)messagesWithType:(LFMessageType)type
                 success:(void(^)(NSArray<LFMessageModel *> *messages))success
                 failure:(void(^)(void))failure;

@end
