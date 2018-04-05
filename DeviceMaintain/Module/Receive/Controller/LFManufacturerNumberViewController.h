//
//  LFManufacturerNumberViewController.h
//  DeviceMaintain
//
//  Created by 刘丰 on 2018/4/5.
//  Copyright © 2018年 liufeng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LFDeviceModel.h"

@interface LFManufacturerNumberViewController : UIViewController

@property(nonatomic, copy) void(^callback)(LFDeviceModel *deviceModel);

@end
