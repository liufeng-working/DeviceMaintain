//
//  LFExamineViewModel.h
//  DeviceMaintain
//
//  Created by 刘丰 on 2018/4/6.
//  Copyright © 2018年 liufeng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LFExamineDetailModel.h"

@interface LFExamineViewModel : NSObject

- (void)getExamineDetailWithId:(NSString *)ID
                       success:(void(^)(LFExamineDetailModel *detailM))success
                       failure:(void(^)(void))failure;

- (void)examineWithId:(NSString *)ID
                  msg:(NSString *)msg
              success:(void(^)(void))success
              failure:(void(^)(void))failure;

@end
