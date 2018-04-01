//
//  LFHistoryRepairCell.m
//  DeviceMaintain
//
//  Created by 刘丰 on 2018/4/2.
//  Copyright © 2018年 liufeng. All rights reserved.
//

#import "LFHistoryRepairCell.h"
#import "LFHistoryRepairModel.h"

@interface LFHistoryRepairCell ()

@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
@property (weak, nonatomic) IBOutlet UILabel *numberLabel;
@property (weak, nonatomic) IBOutlet UILabel *codeLabel;
@property (weak, nonatomic) IBOutlet UILabel *endLabel;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;

@end

@implementation LFHistoryRepairCell

LFCell_implementation(historyPerair, LFHistoryRepairCell);

- (void)setRepairModel:(LFHistoryRepairModel *)repairModel
{
    _repairModel = repairModel;
    
    self.iconImageView.image = [UIImage imageNamed:@"ic_news_machine"];
    self.numberLabel.text = [NSString stringWithFormat:@"报修单号：%@", repairModel.RepairCode];
    self.codeLabel.text = repairModel.ClientCode;
    self.endLabel.text = repairModel.statusString;
    self.dateLabel.text = repairModel.RepairDate;
}

@end
