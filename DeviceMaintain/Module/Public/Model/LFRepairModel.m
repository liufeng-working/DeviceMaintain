//
//  LFRepairModel.m
//  DeviceMaintain
//
//  Created by 刘丰 on 2018/4/1.
//  Copyright © 2018年 liufeng. All rights reserved.
//

#import "LFRepairModel.h"
#import "LFPublicTool.h"
#import <objc/runtime.h>

@implementation LFRepairModel

@end

@implementation LFRepairModel (extension)

- (NSString *)statusString
{
    NSString *_statusString = objc_getAssociatedObject(self, _cmd);
    if (!_statusString) {
        _statusString = [LFPublicTool status:self.Status];
        objc_setAssociatedObject(self, _cmd, _statusString, OBJC_ASSOCIATION_COPY_NONATOMIC);
    }
    return _statusString;
}

@end
