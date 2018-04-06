//
//  LFMessageViewController.m
//  DeviceMaintain
//
//  Created by 刘丰 on 2018/4/2.
//  Copyright © 2018年 liufeng. All rights reserved.
//

#import "LFMessageViewController.h"
#import "LFMessageCell.h"
#import "LFMessageDetailViewController.h"

typedef NS_ENUM(NSInteger, LFMessageType) {
    LFMessageTypeUnread = 504,// 未读
    LFMessageTypeRead   = 419,// 已读
    LFMessageTypeAll    = 504419,// 全部
};
@interface LFMessageViewController ()<UITableViewDelegate, UITableViewDataSource>

@property(nonatomic, strong) LFMessageViewModel *messageViewModel;
@property(nonatomic, strong) NSArray<LFMessageModel *> *allMessages;
@property(nonatomic, strong) NSArray<LFMessageModel *> *messages;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property(nonatomic, weak) IBOutlet UIButton *firstButton;
@property(nonatomic, strong) UIButton *lastButton;
@property(nonatomic, assign) LFMessageType messageType;

@property(nonatomic, strong) NSTimer *timer;

@end

@implementation LFMessageViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.tableFooterView = [UIView new];
    self.tableView.backgroundColor = LF_color_efeff4();
    self.messageType = LFMessageTypeUnread;
    self.lastButton = self.firstButton;
    
    __weak typeof(self) weakSelf = self;
    self.tableView.mj_header = [LFRefreshHeader headerWithRefreshingBlock:^{
        [weakSelf loadMessage];
    }];
    [self.tableView.mj_header beginRefreshing];
    
    [self fire];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    [self loadMessage];
}

- (void)loadMessage
{
    [self.messageViewModel messagesWithSuccess:^(NSArray<LFMessageModel *> *messages) {
        [self.tableView.mj_header endRefreshing];
        self.allMessages = messages;
        [self filterMessage];
        [self setupBadge];
    } failure:^{
        [self.tableView.mj_header endRefreshing];
    }];
}

- (IBAction)messageButtonClick:(UIButton *)sender {
    if (self.lastButton == sender) {
        return;
    }
    
    sender.selected = YES;
    self.lastButton.selected = NO;
    self.lastButton = sender;
    
    self.messageType = sender.tag;
    [self filterMessage];
}

- (void)filterMessage
{
    if (self.messageType == LFMessageTypeUnread) {
        NSPredicate *p = [NSPredicate predicateWithFormat:@"Status=0"];
        self.messages = [self.allMessages filteredArrayUsingPredicate:p];
    }else if (self.messageType == LFMessageTypeRead) {
        NSPredicate *p = [NSPredicate predicateWithFormat:@"Status=1"];
        self.messages = [self.allMessages filteredArrayUsingPredicate:p];
    }else {
        self.messages = self.allMessages;
    }
    
    [self.tableView reloadData];
}

- (void)setupBadge
{
    NSPredicate *p = [NSPredicate predicateWithFormat:@"Status=0"];
    NSArray *unreadArray = [self.allMessages filteredArrayUsingPredicate:p];
    self.navigationController.tabBarItem.badgeValue = unreadArray.count ? [NSString stringWithFormat:@"%@", @(unreadArray.count)] : nil;
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

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 80;
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

- (void)fire
{
    if (!_timer) {
        _timer = [NSTimer timerWithTimeInterval:60 target:self selector:@selector(loadMessage) userInfo:nil repeats:YES];
        [[NSRunLoop mainRunLoop] addTimer:_timer forMode:NSRunLoopCommonModes];
    }
}

- (void)invalidate
{
    if (_timer) {
        [_timer invalidate];
        _timer = nil;
    }
}

- (void)dealloc {
    [self invalidate];
}

@end
