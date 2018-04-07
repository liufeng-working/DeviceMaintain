//
//  LFLoginViewController.m
//  DeviceMaintain
//
//  Created by 刘丰 on 2018/3/21.
//  Copyright © 2018年 liufeng. All rights reserved.
//

#import "LFLoginViewController.h"
#import "LFLoginTool.h"
#import "LFLoginViewModel.h"

@interface LFLoginViewController ()<UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *userNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@property (weak, nonatomic) IBOutlet UIButton *remebeButton;
@property (weak, nonatomic) IBOutlet UIButton *loginButton;

@property(nonatomic, strong) LFLoginViewModel *loginViewModel;

@end

@implementation LFLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [LFNotificationCenter addObserver:self selector:@selector(textFieldTextDidChange:) name:UITextFieldTextDidChangeNotification object:nil];
    
    if (LFLoginTool.getRemebeUser) {
        self.userNameTextField.text = LFLoginTool.getUserName;
        self.passwordTextField.text = LFLoginTool.getPassword;
        self.remebeButton.selected = YES;
    }
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self loginButtonEnable];
}

- (IBAction)login {
    [self.view endEditing:YES];
    
    [LFNotification manuallyHideWithIndicator];
    [self.loginViewModel login:@{@"name": self.userNameTextField.text, @"pwd": self.passwordTextField.text.md5Encoded} success:^ {
        if (LFLoginTool.getRemebeUser) {
            [LFLoginTool saveUserName:self.userNameTextField.text];
            [LFLoginTool savePassword:self.passwordTextField.text];
        }
        
        if ([LFUserManager manager].user.Post == LFUserTypeServer) {
            LFWindow.rootViewController = LFMain1;
        }else {
            LFWindow.rootViewController = LFMain;
        }
    }];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}

- (IBAction)remebeClick:(UIButton *)sender {
    sender.selected = !sender.selected;
    [LFLoginTool saveRemebeUers:sender.selected];
}

- (IBAction)settingClick {
    [self showTextFieldWithTitle:@"车间配置" texts:@[LFLoginTool.getIP ?: @""] placeholds:@[@"请输入车间ip"] sureTitle:@"确定" withComplete:^(NSArray<UITextField *> * _Nonnull tfs) {
        [LFLoginTool saveIP:tfs.firstObject.text];
    }];
}

#pragma mark -
#pragma mark - delegate代理方法
#pragma mark -
#pragma mark - UITextFieldDelegate
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    if (textField == self.userNameTextField) {
        [self.passwordTextField becomeFirstResponder];
    }
    
    if (textField == self.passwordTextField) {
        [self settingClick];
    }
    
    return YES;
}

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
    BOOL enable = self.userNameTextField.hasText && self.passwordTextField.hasText && LFLoginTool.getIP.length;
    self.loginButton.enabled = enable;
    return enable;
}

#pragma mark -
#pragma mark - private私有方法
- (LFLoginViewModel *)loginViewModel
{
    if (!_loginViewModel) {
        _loginViewModel = [LFLoginViewModel new];
    }
    return _loginViewModel;
}

- (void)dealloc {
    [LFNotificationCenter removeObserver:self];
}

@end
