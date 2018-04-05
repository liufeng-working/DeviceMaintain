//
//  LFDeviceCell.m
//  DeviceMaintain
//
//  Created by 刘丰 on 2018/4/5.
//  Copyright © 2018年 liufeng. All rights reserved.
//

#import "LFDeviceCell.h"
#import "LFDeviceModel.h"

@interface LFDeviceCell ()

@property (weak, nonatomic) IBOutlet UILabel *CodeLabel;
@property (weak, nonatomic) IBOutlet UILabel *ClientCodeLabel;
@property (weak, nonatomic) IBOutlet UILabel *MacModelNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *ClientNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *FactoryTimeLabel;
@property (weak, nonatomic) IBOutlet UILabel *FactoryNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *CtrlModelNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *WorkShopNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *WarrantyTimeLabel;

@end

@implementation LFDeviceCell

LFCell_implementation(device, LFDeviceCell);

- (void)setDeviceModel:(LFDeviceModel *)deviceModel
{
    _deviceModel = deviceModel;
    
    self.CodeLabel.text = deviceModel.Code;
    self.ClientCodeLabel.text = deviceModel.ClientCode;
    self.MacModelNameLabel.text = deviceModel.MacModelName;
    self.ClientNameLabel.text = deviceModel.ClientName;
    self.FactoryTimeLabel.text = deviceModel.FactoryTime;
    self.FactoryNameLabel.text = deviceModel.FactoryName;
    self.CtrlModelNameLabel.text = deviceModel.CtrlModelName;
    self.WorkShopNameLabel.text = deviceModel.WorkShopName;
    self.WarrantyTimeLabel.text = deviceModel.WarrantyTime;
}

@end
