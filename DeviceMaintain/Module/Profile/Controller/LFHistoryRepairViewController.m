//
//  LFHistoryRepairViewController.m
//  DeviceMaintain
//
//  Created by 刘丰 on 2018/4/1.
//  Copyright © 2018年 liufeng. All rights reserved.
//

#import "LFHistoryRepairViewController.h"
#import "LFProfileTool.h"
#import "LFHistoryRepairCell.h"
#import "LFHistoryRepairViewModel.h"
#import "LFRepairViewController.h"

@interface LFHistoryRepairViewController ()

@property(nonatomic, strong) NSArray<LFHistoryRepairModel *> *repairs;

@property(nonatomic, strong) LFHistoryRepairViewModel *repaireViewModel;
@end

@implementation LFHistoryRepairViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    __weak typeof(self) weakSelf = self;
    self.tableView.mj_header = [LFRefreshHeader headerWithRefreshingBlock:^{
        [weakSelf.repaireViewModel historyRepairList:^(NSArray<LFHistoryRepairModel *> *repairs) {
            weakSelf.repairs = repairs;
            [weakSelf.tableView reloadData];
            [weakSelf.tableView.mj_header endRefreshing];
        } failure:^{
            [weakSelf.tableView.mj_header endRefreshing];
            [LFNotification autoHideWithText:@"请求失败，请稍候再试"];
        }];
    }];
    [self.tableView.mj_header beginRefreshing];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.repairs.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    LFHistoryRepairCell *cell = [LFHistoryRepairCell historyPerairCellWithTableView:tableView];
    cell.repairModel = self.repairs[indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewAutomaticDimension;
}

-(CGFloat)tableView:(UITableView *)tableView estimatedHeightForFooterInSection:(NSInteger)section {
    return 60;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    LFRepairViewController *detailVC = LFSB_ViewController(LFProfileSBName, LFRepairViewController);
    detailVC.repairM = self.repairs[indexPath.row];
    LFPush(detailVC);
}

#pragma mark -
#pragma mark - private私有方法
- (LFHistoryRepairViewModel *)repaireViewModel
{
    if (!_repaireViewModel) {
        _repaireViewModel = [LFHistoryRepairViewModel new];
    }
    return _repaireViewModel;
}

- (void)dealloc {
    NSLog(@"%s", __func__);
}

@end
