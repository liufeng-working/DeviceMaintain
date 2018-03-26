//
//  LFViewController.m
//  DeviceMaintain
//
//  Created by 刘丰 on 2018/3/21.
//  Copyright © 2018年 liufeng. All rights reserved.
//

#import <UIKit/UIViewController.h>
#import <objc/runtime.h>

static inline void lf_exchangeInstanceMethod(Class class, SEL oldSelect, SEL newSelect) {
    Method oldMethod = class_getInstanceMethod(class, oldSelect);
    Method newMethod = class_getInstanceMethod(class, newSelect);
    method_exchangeImplementations(oldMethod, newMethod);
}

@implementation UIViewController (base)

+ (void)load {
    lf_exchangeInstanceMethod(self, @selector(viewDidLoad), @selector(lf_viewDidLoad));
}

- (void)lf_viewDidLoad {
    [self lf_viewDidLoad];
    
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

@end
