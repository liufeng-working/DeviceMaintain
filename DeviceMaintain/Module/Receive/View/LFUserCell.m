//
//  LFUserCell.m
//  DeviceMaintain
//
//  Created by 刘丰 on 2018/4/5.
//  Copyright © 2018年 liufeng. All rights reserved.
//

#import "LFUserCell.h"
#import "LFUserModel.h"

@interface LFUserCell ()

@property (weak, nonatomic) IBOutlet UIButton *checkButton;
@property (weak, nonatomic) IBOutlet UILabel *UserCodeLabel;
@property (weak, nonatomic) IBOutlet UILabel *UserNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *DepartmentNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *PostNameLabel;

@end

@implementation LFUserCell

LFCell_implementation(user, LFUserCell);

- (void)setUserModel:(LFUserModel *)userModel
{
    _userModel = userModel;
    
    self.checkButton.selected = userModel.IsCheck;
    self.UserCodeLabel.text = userModel.UserCode;
    self.UserNameLabel.text = userModel.UserName;
    self.DepartmentNameLabel.text = userModel.DepartmentName;
    self.PostNameLabel.text = userModel.PostName;
}

- (IBAction)checkClick:(UIButton *)sender {
    sender.selected = !sender.selected;
    self.userModel.IsCheck = sender.selected;
}

@end
