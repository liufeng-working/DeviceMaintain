//
//  LFFeedbackDetailViewController.h
//  DeviceMaintain
//
//  Created by 刘丰 on 2018/4/6.
//  Copyright © 2018年 liufeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LFRepairDetailModel;
@interface LFFeedbackDetailViewController : UITableViewController

@property(nonatomic, strong) LFRepairDetailModel *repairDetailModel;

@property(nonatomic, copy) NSString *RepairCode;

@end
