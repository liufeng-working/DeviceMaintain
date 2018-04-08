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

@interface LFManufacturerNumberViewController ()<UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate>

@property (weak, nonatomic) IBOutlet UIButton *arrowButton;

@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property(nonatomic, strong) LFApplyViewModel *applyViewModel;

@property(nonatomic, strong) NSMutableArray<LFDeviceModel *> *devices;

@property(nonatomic, assign) NSInteger page;

@property(nonatomic, strong) NSArray<LFDeviceModel *> *allDevices;

@property(nonatomic, assign) BOOL isCode;

@property(nonatomic, strong) LFRefreshFooter *footer;

@end

@implementation LFManufacturerNumberViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.arrowButton.transform = CGAffineTransformMakeRotation(M_PI_2);
    
    
    __weak typeof(self) weakSelf = self;
    self.footer = [LFRefreshFooter footerWithRefreshingBlock:^{
        [weakSelf.applyViewModel getDeviceListWithPage:1 success:^(NSArray<LFDeviceModel *> *devices) {
            [weakSelf.tableView.mj_header endRefreshing];
            [weakSelf.devices addObjectsFromArray:devices];
            weakSelf.allDevices = weakSelf.devices;
            [weakSelf.tableView reloadData];
            weakSelf.page ++;
        } failure:^{
            [weakSelf.tableView.mj_header endRefreshing];
            [LFNotification autoHideWithText:@"获取设备列表失败"];
        }];
    }];
    self.tableView.mj_footer = self.footer;
    
    self.tableView.mj_header = [LFRefreshHeader headerWithRefreshingBlock:^{
        [weakSelf.applyViewModel getDeviceListWithPage:1 success:^(NSArray<LFDeviceModel *> *devices) {
            [weakSelf.tableView.mj_header endRefreshing];
            weakSelf.devices = devices.mutableCopy;
            weakSelf.allDevices = weakSelf.devices;
            [weakSelf.tableView reloadData];
            weakSelf.page = 2;
            weakSelf.tableView.mj_footer = weakSelf.footer;
        } failure:^{
            [weakSelf.tableView.mj_header endRefreshing];
            [LFNotification autoHideWithText:@"获取设备列表失败"];
        }];
    }];
    [self.tableView.mj_header beginRefreshing];
}

- (IBAction)arrowButtonClick:(UIButton *)sender {
    [self showAlertSheetWithTitle:@"查询参数" nameArray:@[@"客户编号", @"厂家编号"] withComplete:^(NSString * _Nonnull selectItem, NSInteger selectIndex) {
        self.isCode = selectIndex;
        self.searchBar.placeholder = [NSString stringWithFormat:@"请输入%@", selectItem];
    }];
}

- (IBAction)search:(UIButton *)sender {
    if (self.searchBar.text) {
        [self.view endEditing:YES];
        self.tableView.mj_footer = nil;
        if (self.isCode) {
            NSPredicate *p = [NSPredicate predicateWithFormat:@"Code CONTAINS %@", self.searchBar.text];
            self.devices = [self.allDevices filteredArrayUsingPredicate:p].mutableCopy;
            
        }else {
            NSPredicate *p = [NSPredicate predicateWithFormat:@"ClientCode CONTAINS %@", self.searchBar.text];
            self.devices = [self.allDevices filteredArrayUsingPredicate:p].mutableCopy;
        }
        
        [self.tableView reloadData];
    }else {
        [LFNotification autoHideWithText:@"请输入搜索关键词"];
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

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (self.callback) {
        self.callback(self.devices[indexPath.row]);
    }
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText {
    if (searchBar.text.length == 0) {
        self.devices = self.allDevices.mutableCopy;
        self.tableView.mj_footer = self.footer;
        [self.tableView reloadData];
    }
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    [self search:nil];
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
