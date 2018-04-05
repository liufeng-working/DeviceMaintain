//
//  LFMessageDetailViewController.m
//  DeviceMaintain
//
//  Created by 刘丰 on 2018/4/3.
//  Copyright © 2018年 liufeng. All rights reserved.
//

#import "LFMessageDetailViewController.h"
#import "LFMessageViewModel.h"

@interface LFMessageDetailViewController ()

@property (weak, nonatomic) IBOutlet UILabel *dateLabel;

@property (weak, nonatomic) IBOutlet UILabel *contentLabel;

@property(nonatomic, strong) LFMessageViewModel *messageViewModel;

@end

@implementation LFMessageDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.dateLabel.text = self.messageModel.CreateTime;
    self.contentLabel.text = self.messageModel.Content;
    
    [self.messageViewModel messageDetailWithId:self.messageModel.ID];
}

- (LFMessageViewModel *)messageViewModel
{
    if (!_messageViewModel) {
        _messageViewModel = [[LFMessageViewModel alloc] init];
    }
    return _messageViewModel;
}

@end
