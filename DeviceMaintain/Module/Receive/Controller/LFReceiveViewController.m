//
//  LFReceiveViewController.m
//  DeviceMaintain
//
//  Created by 刘丰 on 2018/4/1.
//  Copyright © 2018年 liufeng. All rights reserved.
//

#import "LFReceiveViewController.h"
#import "LFApplyViewModel.h"

@interface LFReceiveViewController ()

@property(nonatomic, strong) LFApplyViewModel *applyViewModel;

@end

@implementation LFReceiveViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [LFNotificationCenter addObserver:self selector:@selector(refresh:) name:LFReceiveSuccessNotification object:nil];
    
    self.type = LFRepairTypeReceive;
    self.operationButtonTitle = @"接收";
    __weak typeof(self) weakSelf = self;
    self.operationBlock = ^(LFRepairDetailModel *detailModel) {
        [LFNotification manuallyHideIndicatorWithText:@"正在处理"];
        [weakSelf.applyViewModel receiveWithId:detailModel.ID success:^{
            [LFNotification manuallyHideWithText:@"接收成功"];
            [LFNotificationCenter postNotificationName:LFReceiveSuccessNotification object:nil];
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [LFNotification hideNotification];
                [weakSelf.navigationController popToRootViewControllerAnimated:YES];
            });
        } failure:^{
            [LFNotification autoHideWithText:@"接收失败，请重试"];
        }];
    };
}

- (void)refresh:(NSNotification *)noti
{
    [self.tableView.mj_header beginRefreshing];
}

- (LFApplyViewModel *)applyViewModel
{
    if (!_applyViewModel) {
        _applyViewModel = [[LFApplyViewModel alloc] init];
    }
    return _applyViewModel;
}

- (void)dealloc {
    [LFNotificationCenter removeObserver:self];
}

@end
