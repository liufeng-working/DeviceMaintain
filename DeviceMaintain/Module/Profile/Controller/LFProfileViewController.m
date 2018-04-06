//
//  LFProfileViewController.m
//  DeviceMaintain
//
//  Created by 刘丰 on 2018/4/1.
//  Copyright © 2018年 liufeng. All rights reserved.
//

#import "LFProfileViewController.h"

@interface LFProfileViewController ()

@property (weak, nonatomic) IBOutlet UILabel *codeNameLabel;

@property (weak, nonatomic) IBOutlet UILabel *userNameLabel;

@end

@implementation LFProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.codeNameLabel.text = [LFUserManager manager].user.UserCode;
    self.userNameLabel.text = [LFUserManager manager].user.UserName;
    
    self.tableView.contentInset = UIEdgeInsetsMake(-44, 0, 0, 0);
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}

- (IBAction)exit:(UIButton *)sender {
    [self showAlertViewWithTitle:@"温馨提示" message:@"您确定退出？" cancelTitle:@"取消" sureTitle:@"确定" withComplete:^{
        LFWindow.rootViewController = LFLogin;
    }];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (void)dealloc {
    NSLog(@"%s", __func__);
}

@end
