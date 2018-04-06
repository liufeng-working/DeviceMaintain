//
//  LFFeedbackViewModel.h
//  DeviceMaintain
//
//  Created by 刘丰 on 2018/4/6.
//  Copyright © 2018年 liufeng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LFFaultModel.h"
#import "LFSolutionModel.h"

@interface LFFeedbackViewModel : NSObject

/**
 故障分类
 */
- (void)getFaults:(void(^)(NSArray<LFFaultModel *> *faults))success
          failure:(void(^)(void))failure;

/**
 智能方案
 */
- (void)faultSolution:(void(^)(NSArray<LFSolutionModel *> *solutions))success
              failure:(void(^)(void))failure;

/**
 反馈
 */
- (void)feedback:(NSDictionary *)param
         success:(void(^)(void))success
         failure:(void(^)(void))failure;


@end
