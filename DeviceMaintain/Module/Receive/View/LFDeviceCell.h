//
//  LFDeviceCell.h
//  DeviceMaintain
//
//  Created by 刘丰 on 2018/4/5.
//  Copyright © 2018年 liufeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LFDeviceModel;
@interface LFDeviceCell : UITableViewCell

LFCell_interface(device);

@property(nonatomic, strong) LFDeviceModel *deviceModel;

@end
