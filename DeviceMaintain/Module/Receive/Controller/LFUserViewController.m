//
//  LFUserViewController.m
//  DeviceMaintain
//
//  Created by 刘丰 on 2018/4/5.
//  Copyright © 2018年 liufeng. All rights reserved.
//

#import "LFUserViewController.h"
#import "LFUserCell.h"
#import "LFApplyViewModel.h"
#import "LFUserCell.h"

@interface LFUserViewController ()

@property(nonatomic, strong) NSMutableArray<LFUserModel *> *users;

@property(nonatomic, strong) NSArray<LFUserModel *> *originUsers;

@property(nonatomic, strong) LFApplyViewModel *userViewModel;

@end

@implementation LFUserViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    __weak typeof(self) weakSelf = self;
    self.tableView.mj_header = [LFRefreshHeader headerWithRefreshingBlock:^{
        [weakSelf.userViewModel getUserWithTid:weakSelf.tid rid:weakSelf.rid success:^(NSArray<LFUserModel *> *users) {
            weakSelf.originUsers = [users map:^id _Nonnull(LFUserModel * _Nonnull obj) {
                return obj.copy;
            }];
            weakSelf.users = users.mutableCopy;
            [weakSelf.tableView.mj_header endRefreshing];
            [weakSelf.tableView reloadData];
            weakSelf.tableView.mj_header = nil;
        } failure:^{
            [weakSelf.tableView.mj_header endRefreshing];
            [LFNotification autoHideWithText:@"加载失败，请重试"];
        }];
    }];
    [self.tableView.mj_header beginRefreshing];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    if (self.originUsers.count) {
        self.users = [self.originUsers map:^id _Nonnull(LFUserModel * _Nonnull obj) {
            return obj.copy;
        }].mutableCopy;
        [self.tableView reloadData];
    }
}

- (IBAction)sureClick:(UIBarButtonItem *)sender {
    
    self.originUsers = self.users;
    
    NSMutableArray *idArray = [NSMutableArray array];
    NSMutableArray *nameArray = [NSMutableArray array];
    [self.users enumerateObjectsUsingBlock:^(LFUserModel * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (obj.IsCheck) {
            [idArray addObject:obj.UserID];
            [nameArray addObject:obj.UserName];
        }
    }];
    
    if (self.callback) {
        NSData *data = [NSJSONSerialization dataWithJSONObject:idArray options:NSJSONReadingMutableLeaves | NSJSONReadingAllowFragments error:nil];
        NSString *string = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        self.callback(string, [nameArray componentsJoinedByString:@","]);
    }
    [self.navigationController popViewControllerAnimated:YES];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.users.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    LFUserCell *cell = [LFUserCell userCellWithTableView:tableView];
    cell.userModel = self.users[indexPath.row];
    return cell;
}

- (LFApplyViewModel *)userViewModel
{
    if (!_userViewModel) {
        _userViewModel = [[LFApplyViewModel alloc] init];
    }
    return _userViewModel;
}

@end
