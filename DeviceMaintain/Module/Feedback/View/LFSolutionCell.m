//
//  LFSolutionCell.m
//  DeviceMaintain
//
//  Created by 刘丰 on 2018/4/6.
//  Copyright © 2018年 liufeng. All rights reserved.
//

#import "LFSolutionCell.h"
#import "LFSolutionModel.h"

@interface LFSolutionCell ()

@property (weak, nonatomic) IBOutlet UILabel *wayLabel;
@property (weak, nonatomic) IBOutlet UILabel *MacCtrlTypeNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *FaultTypeNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *MacCtrlModelNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *FaultCodeLabel;
@property (weak, nonatomic) IBOutlet UILabel *FaultContentLabel;
@property (weak, nonatomic) IBOutlet UILabel *WayContentLabel;

@end

@implementation LFSolutionCell

- (void)setSolutionModel:(LFSolutionModel *)solutionModel
{
    _solutionModel = solutionModel;
    
    self.wayLabel.text = [NSString stringWithFormat:@"方案%ld", (long)self.indexPath.row + 1];
    self.MacCtrlTypeNameLabel.text = solutionModel.MacCtrlTypeName;
    self.FaultTypeNameLabel.text = solutionModel.FaultTypeName;
    self.MacCtrlModelNameLabel.text = solutionModel.MacCtrlModelName;
    self.FaultCodeLabel.text = solutionModel.FaultCode;
    self.FaultContentLabel.text = solutionModel.FaultContent;
    self.WayContentLabel.text = solutionModel.WayContent;
}

- (IBAction)useClick:(UIButton *)sender {
    if ([self.delegate respondsToSelector:@selector(solutionCellDidSelect:)]) {
        [self.delegate solutionCellDidSelect:self];
    }
}

@end
