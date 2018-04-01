//
//  LFReceiveViewController.m
//  DeviceMaintain
//
//  Created by 刘丰 on 2018/4/1.
//  Copyright © 2018年 liufeng. All rights reserved.
//

#import "LFReceiveViewController.h"

@interface LFReceiveViewController ()

@end

@implementation LFReceiveViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.mj_header = [LFRefreshHeader headerWithRefreshingBlock:^{
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self.tableView.mj_header endRefreshing];
        });
    }];
    
    self.tableView.mj_footer = [LFRefreshFooter footerWithRefreshingBlock:^{
        
    }];
}

@end
