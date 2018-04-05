//
//  LFManufacturerNumberViewController.m
//  DeviceMaintain
//
//  Created by 刘丰 on 2018/4/5.
//  Copyright © 2018年 liufeng. All rights reserved.
//

#import "LFManufacturerNumberViewController.h"
#import "LFApplyViewModel.h"
#import "LFDeviceCell.h"

@interface LFManufacturerNumberViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UIButton *arrowButton;

@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property(nonatomic, strong) LFApplyViewModel *applyViewModel;

@property(nonatomic, strong) NSMutableArray<LFDeviceModel *> *devices;

@property(nonatomic, assign) NSInteger page;

@end

@implementation LFManufacturerNumberViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.arrowButton.transform = CGAffineTransformMakeRotation(M_PI_2);
    
    __weak typeof(self) weakSelf = self;
    self.tableView.mj_header = [LFRefreshHeader headerWithRefreshingBlock:^{
        [weakSelf.applyViewModel getDeviceListWithPage:1 success:^(NSArray<LFDeviceModel *> *devices) {
            [weakSelf.tableView.mj_header endRefreshing];
            weakSelf.devices = devices.mutableCopy;
            [weakSelf.tableView reloadData];
            self.page = 2;
        } failure:^{
            [self.tableView.mj_header endRefreshing];
            [LFNotification autoHideWithText:@"获取设备列表失败"];
        }];
    }];
    [self.tableView.mj_header beginRefreshing];
    
    self.tableView.mj_footer = [LFRefreshFooter footerWithRefreshingBlock:^{
        [weakSelf.applyViewModel getDeviceListWithPage:1 success:^(NSArray<LFDeviceModel *> *devices) {
            [weakSelf.tableView.mj_header endRefreshing];
            [weakSelf.devices addObjectsFromArray:devices];
            [weakSelf.tableView reloadData];
            self.page ++;
        } failure:^{
            [self.tableView.mj_header endRefreshing];
            [LFNotification autoHideWithText:@"获取设备列表失败"];
        }];
    }];
}

- (IBAction)arrowButtonClick:(UIButton *)sender {
    [self showAlertSheetWithTitle:@"查询参数" nameArray:@[@"客户编号", @"厂家编号"] withComplete:^(NSString * _Nonnull selectItem, NSInteger selectIndex) {
        
    }];
}

- (IBAction)search:(UIButton *)sender {
    if (self.searchBar.text) {
        
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.devices.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    LFDeviceCell *cell = [LFDeviceCell deviceCellWithTableView:tableView];
    cell.deviceModel = self.devices[indexPath.row];
    return cell;
}

#pragma mark -
#pragma mark - lazy懒加载
- (LFApplyViewModel *)applyViewModel
{
    if (!_applyViewModel) {
        _applyViewModel = [[LFApplyViewModel alloc] init];
    }
    return _applyViewModel;
}

@end
