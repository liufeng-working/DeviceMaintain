//
//  LFRepairViewController.m
//  DeviceMaintain
//
//  Created by 刘丰 on 2018/4/3.
//  Copyright © 2018年 liufeng. All rights reserved.
//

#import "LFRepairViewController.h"
#import "LFProfileTool.h"
#import "LFRepairCell.h"
#import "LFRepairDetailViewController.h"

@interface LFRepairViewController ()

@property(nonatomic, strong) NSArray<LFRepairModel *> *repairs;

@property(nonatomic, strong) LFRepairViewModel *repaireViewModel;
@end

@implementation LFRepairViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.tableFooterView = [UIView new];
    
    __weak typeof(self) weakSelf = self;
    self.tableView.mj_header = [LFRefreshHeader headerWithRefreshingBlock:^{
        [weakSelf.repaireViewModel repairListWithType:self.type success:^(NSArray<LFRepairModel *> *repairs) {
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
    LFRepairCell *cell = [LFRepairCell repairCellWithTableView:tableView];
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
    LFRepairDetailViewController *detailVC = LFSB_ViewController(LFPublicSBName, LFRepairDetailViewController);
    detailVC.repairM = self.repairs[indexPath.row];
    LFPush(detailVC);
}

#pragma mark -
#pragma mark - private私有方法
- (LFRepairViewModel *)repaireViewModel
{
    if (!_repaireViewModel) {
        _repaireViewModel = [LFRepairViewModel new];
    }
    return _repaireViewModel;
}

- (void)dealloc {
    NSLog(@"%s", __func__);
}

@end
