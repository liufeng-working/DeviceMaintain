//
//  LFRepairViewModel.h
//  DeviceMaintain
//
//  Created by 刘丰 on 2018/4/2.
//  Copyright © 2018年 liufeng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LFRepairModel.h"
#import "LFRepairDetailModel.h"

typedef NS_ENUM(NSInteger, LFRepairType) {
    LFRepairTypeReceive  = 1,// 待接收
    LFRepairTypeFeedback = 2,// 待反馈
    LFRepairTypeExamine  = 3,// 待审核
    LFRepairTypeComment  = 4,// 待评价
    LFRepairTypeHistory  = 5,// 历史
};
@interface LFRepairViewModel : NSObject

- (void)repairListWithType:(LFRepairType)type
                   success:(void(^)(NSArray<LFRepairModel *> *repairs))success
                  failure:(void(^)(void))failure;

- (void)repairDetail:(NSString *)ID
             success:(void(^)(LFRepairDetailModel *detail))success
             failure:(void(^)(void))failure;

@end
