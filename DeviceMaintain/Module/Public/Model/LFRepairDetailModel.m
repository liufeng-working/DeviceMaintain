//
//  LFRepairDetailModel.m
//  DeviceMaintain
//
//  Created by 刘丰 on 2018/4/2.
//  Copyright © 2018年 liufeng. All rights reserved.
//

#import "LFRepairDetailModel.h"
#import "LFPublicTool.h"

@implementation LFRepairDetailModel

@end

@implementation LFRepairDetailModel (extesion)

- (NSString *)RecordSourceString
{
    NSString *_RecordSourceString = objc_getAssociatedObject(self, _cmd);
    if (!_RecordSourceString) {
        _RecordSourceString = [LFPublicTool RecordSource:self.RecordSource];
        objc_setAssociatedObject(self, _cmd, _RecordSourceString, OBJC_ASSOCIATION_COPY_NONATOMIC);
    }
    return _RecordSourceString;
}

@end
