//
//  LFMessageModel.m
//  DeviceMaintain
//
//  Created by 刘丰 on 2018/4/2.
//  Copyright © 2018年 liufeng. All rights reserved.
//

#import "LFMessageModel.h"
#import "LFMessageTool.h"

@implementation LFMessageModel

- (NSString *)MessageTypeString
{
    NSString *_MessageTypeString = objc_getAssociatedObject(self, _cmd);
    if (!_MessageTypeString) {
        _MessageTypeString = [LFMessageTool MessageType:self.MessageType];
        objc_setAssociatedObject(self, _cmd, _MessageTypeString, OBJC_ASSOCIATION_COPY_NONATOMIC);
    }
    return _MessageTypeString;
}

@end
