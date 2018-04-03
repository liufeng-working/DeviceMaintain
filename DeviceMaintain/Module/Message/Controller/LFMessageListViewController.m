//
//  LFMessageListViewController.m
//  DeviceMaintain
//
//  Created by 刘丰 on 2018/4/2.
//  Copyright © 2018年 liufeng. All rights reserved.
//

#import "LFMessageListViewController.h"
#import "LFMessageViewModel.h"
#import "LFMessageCell.h"
#import "LFMessageDetailViewController.h"

@interface LFMessageListViewController ()

@property(nonatomic, strong) LFMessageViewModel *messageViewModel;

@property(nonatomic, strong) NSArray<LFMessageModel *> *messages;

@end

@implementation LFMessageListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.tableFooterView = [UIView new];
    
    __weak typeof(self) weakSelf = self;
    self.tableView.mj_header = [LFRefreshHeader headerWithRefreshingBlock:^{
        [weakSelf.messageViewModel messagesWithType:self.messageType success:^(NSArray<LFMessageModel *> *messages) {
            [weakSelf.tableView.mj_header endRefreshing];
            weakSelf.messages = messages;
            [weakSelf.tableView reloadData];
        } failure:^{
            [weakSelf.tableView.mj_header endRefreshing];
        }];
    }];
    [self.tableView.mj_header beginRefreshing];
}


#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.messages.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    LFMessageCell *cell = [LFMessageCell messageCellCellWithTableView:tableView];
    cell.messageModel = self.messages[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    LFMessageDetailViewController *detailVC = LFSB_ViewController(LFMessageSBName, LFMessageDetailViewController);
    detailVC.messageModel = self.messages[indexPath.row];
    LFPush(detailVC);
}

#pragma mark -
#pragma mark - private私有方法
- (LFMessageViewModel *)messageViewModel
{
    if (!_messageViewModel) {
        _messageViewModel = [[LFMessageViewModel alloc] init];
    }
    return _messageViewModel;
}

@end
