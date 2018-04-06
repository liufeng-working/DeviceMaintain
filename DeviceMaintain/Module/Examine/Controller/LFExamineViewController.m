//
//  LFExamineViewController.m
//  DeviceMaintain
//
//  Created by 刘丰 on 2018/4/3.
//  Copyright © 2018年 liufeng. All rights reserved.
//

#import "LFExamineViewController.h"

@interface LFExamineViewController ()

@end

@implementation LFExamineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
 
    self.type = LFRepairTypeExamine;
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
