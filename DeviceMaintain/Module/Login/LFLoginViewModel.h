//
//  LFLoginViewModel.h
//  DeviceMaintain
//
//  Created by 刘丰 on 2018/4/2.
//  Copyright © 2018年 liufeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LFLoginViewModel : NSObject

- (void)login:(NSDictionary *)param
      success:(void (^)(void))success;

@end
