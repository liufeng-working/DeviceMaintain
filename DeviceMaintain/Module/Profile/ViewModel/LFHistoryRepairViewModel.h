//
//  LFHistoryRepairViewModel.h
//  DeviceMaintain
//
//  Created by 刘丰 on 2018/4/2.
//  Copyright © 2018年 liufeng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LFHistoryRepairModel.h"
#import "LFRepairDetailModel.h"

@interface LFHistoryRepairViewModel : NSObject

- (void)historyRepairList:(void(^)(NSArray<LFHistoryRepairModel *> *repairs))success
                  failure:(void(^)(void))failure;

- (void)repairDetail:(NSString *)ID
             success:(void(^)(LFRepairDetailModel *detail))success
             failure:(void(^)(void))failure;

@end
