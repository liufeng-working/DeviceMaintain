//
//  LFRepairDetailViewController.h
//  DeviceMaintain
//
//  Created by 刘丰 on 2018/4/2.
//  Copyright © 2018年 liufeng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LFRepairViewModel.h"

@interface LFRepairDetailViewController : UIViewController

@property(nonatomic, strong) LFRepairModel *repairM;

@property(nonatomic, copy) NSString *operationButtonTitle;

@property(nonatomic, copy) void(^operationBlock)(LFRepairDetailModel *detailModel);

@end
