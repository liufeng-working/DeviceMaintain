//
//  LFExamineViewController.m
//  DeviceMaintain
//
//  Created by 刘丰 on 2018/4/3.
//  Copyright © 2018年 liufeng. All rights reserved.
//

#import "LFExamineViewController.h"
#import "LFExamineDetailViewController.h"

@interface LFExamineViewController ()

@end

@implementation LFExamineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
 
    self.type = LFRepairTypeExamine;
    self.operationButtonTitle = @"去审核";
    
    __weak typeof(self) weakSelf = self;
    self.operationBlock = ^(LFRepairDetailModel *detailModel, LFRepairModel *repairModel) {
        LFExamineDetailViewController *examineDetailVC = LFSB_ViewController(LFExamineSBName, LFExamineDetailViewController);
        examineDetailVC.ID = detailModel.ID;
        [weakSelf.navigationController pushViewController:examineDetailVC animated:YES];
    };
    
    [LFNotificationCenter addObserver:self selector:@selector(refresh:) name:LFExamineSuccessNotification object:nil];
}

- (void)refresh:(NSNotification *)noti
{
    [self.tableView.mj_header beginRefreshing];
}

- (void)dealloc {
    [LFNotificationCenter removeObserver:self];
}

@end
