//
//  LFLoginViewController.m
//  DeviceMaintain
//
//  Created by 刘丰 on 2018/3/21.
//  Copyright © 2018年 liufeng. All rights reserved.
//

#import "LFLoginViewController.h"

@interface LFLoginViewController ()

@end

@implementation LFLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    char *c = "1";
    printf("%s", c);
}

- (IBAction)login:(UIButton *)sender {
    [UIApplication sharedApplication].delegate.window.rootViewController = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateInitialViewController];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"温馨提示" message:@"" preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
    }];
    [cancel setValue:[UIColor blackColor] forKey:@"titleTextColor"];
    [alert addAction:cancel];
    
    UIAlertAction *sure = [UIAlertAction actionWithTitle:@"" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    [alert addAction:sure];
    [self presentViewController:alert animated:YES completion:nil];
}

@end
