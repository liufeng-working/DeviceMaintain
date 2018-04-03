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
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.tableView.mj_header beginRefreshing];
}

@end
