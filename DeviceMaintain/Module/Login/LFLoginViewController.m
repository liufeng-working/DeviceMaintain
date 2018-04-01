//
//  LFLoginViewController.m
//  DeviceMaintain
//
//  Created by 刘丰 on 2018/3/21.
//  Copyright © 2018年 liufeng. All rights reserved.
//

#import "LFLoginViewController.h"

@interface LFLoginViewController ()<UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *userNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@property (weak, nonatomic) IBOutlet UIButton *remebeButton;
@property (weak, nonatomic) IBOutlet UIButton *settingButton;
@property (weak, nonatomic) IBOutlet UIButton *loginButton;

@end

@implementation LFLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [LFNotificationCenter addObserver:self selector:@selector(textFieldTextDidChange:) name:UITextFieldTextDidChangeNotification object:nil];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self loginButtonEnable];
}

- (IBAction)login:(UIButton *)sender {
    if (self.loginButtonEnable) {
        [LFNotification autoHideWithText:@"请先填写信息"];
        return;
    }
    
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}

- (IBAction)remebeClick:(UIButton *)sender {
    sender.selected = !sender.selected;
    
}

- (IBAction)settingClick:(UIButton *)sender {
    
}

#pragma mark -
#pragma mark - delegate代理方法
#pragma mark -
#pragma mark - UITextFieldDelegate


#pragma mark -
#pragma mark - private私有方法
#pragma mark -
#pragma mark - 文字改变
- (void)textFieldTextDidChange:(NSNotification *)noti
{
    if (![noti.object isKindOfClass:[UITextField class]]) {
        return;
    }
    
    [self loginButtonEnable];
}

#pragma mark -
#pragma mark - 检查等了按钮是否可用
- (BOOL)loginButtonEnable
{
    BOOL enable = self.userNameTextField.hasText && self.passwordTextField.hasText;
    self.loginButton.enabled = enable;
    return enable;
}

- (void)dealloc {
    NSLog(@"%s", __func__);
    [LFNotificationCenter removeObserver:self];
}

@end
