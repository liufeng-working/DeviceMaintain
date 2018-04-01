//
//  LFHistoryRepairCell.h
//  DeviceMaintain
//
//  Created by 刘丰 on 2018/4/2.
//  Copyright © 2018年 liufeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LFHistoryRepairModel;
@interface LFHistoryRepairCell : UITableViewCell

LFCell_interface(historyPerair);

@property(nonatomic, strong) LFHistoryRepairModel *repairModel;

@end
