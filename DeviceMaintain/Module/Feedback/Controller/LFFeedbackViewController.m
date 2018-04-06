//
//  LFFeedbackViewController.m
//  DeviceMaintain
//
//  Created by 刘丰 on 2018/4/3.
//  Copyright © 2018年 liufeng. All rights reserved.
//

#import "LFFeedbackViewController.h"
#import "LFFeedbackDetailViewController.h"

@interface LFFeedbackViewController ()

@end

@implementation LFFeedbackViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [LFNotificationCenter addObserver:self selector:@selector(refresh:) name:LFReceiveSuccessNotification object:nil];
    [LFNotificationCenter addObserver:self selector:@selector(refresh:) name:LFFeedbackSuccessNotification object:nil];
    self.type = LFRepairTypeFeedback;
    self.operationButtonTitle = @"去反馈";
    __weak typeof(self) weakSelf = self;
    self.operationBlock = ^(LFRepairDetailModel *detailModel, LFRepairModel *repairModel) {
        LFFeedbackDetailViewController *feedbackDetailVC = LFSB_ViewController(LFFeedbackSBName, LFFeedbackDetailViewController);
        feedbackDetailVC.repairDetailModel = detailModel;
        feedbackDetailVC.RepairCode = repairModel.RepairCode;
        [weakSelf.navigationController pushViewController:feedbackDetailVC animated:YES];
    };
}

- (void)refresh:(NSNotification *)noti
{
    [self.tableView.mj_header beginRefreshing];
}

- (void)dealloc {
    [LFNotificationCenter removeObserver:self];
}

@end
