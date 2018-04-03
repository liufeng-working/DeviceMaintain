//
//  LFRepairCell.h
//  DeviceMaintain
//
//  Created by 刘丰 on 2018/4/2.
//  Copyright © 2018年 liufeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LFRepairModel;
@interface LFRepairCell : UITableViewCell

LFCell_interface(repair);

@property(nonatomic, strong) LFRepairModel *repairModel;

@end
