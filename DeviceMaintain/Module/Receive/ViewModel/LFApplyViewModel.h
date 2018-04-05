//
//  LFApplyViewModel.h
//  DeviceMaintain
//
//  Created by 刘丰 on 2018/4/5.
//  Copyright © 2018年 liufeng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LFDeviceModel.h"

@interface LFApplyViewModel : NSObject

/**
 获取报修单号
 */
- (void)getRepairCode:(void(^)(NSString *code))success
              failure:(void(^)(void))failure;

/**
 获取设备列表
 */
- (void)getDeviceListWithPage:(NSInteger)page
                    success:(void(^)(NSArray<LFDeviceModel *> *devices))success
                    failure:(void(^)(void))failure;
@end
