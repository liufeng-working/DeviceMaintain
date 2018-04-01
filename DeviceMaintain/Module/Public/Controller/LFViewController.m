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

@interface UIViewController (private)

- (BOOL)isSystemViewController;

@end

@implementation UIViewController (base)

+ (void)load {
    lf_exchangeInstanceMethod(self, @selector(viewDidLoad), @selector(lf_viewDidLoad));
}

- (void)lf_viewDidLoad {
    [self lf_viewDidLoad];
    
    if (self.isSystemViewController) { return; }
    
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.view.backgroundColor = [UIColor colorWithHexString:@"efeff4"];
    
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:nil action:nil];
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

@end

@implementation UIViewController (private)

- (BOOL)isSystemViewController
{
    if ([self isKindOfClass:NSClassFromString(@"UICompatibilityInputViewController")] ||
        [self isKindOfClass:NSClassFromString(@"UIInputWindowController")] ||
        [self isKindOfClass:NSClassFromString(@"UIApplicationRotationFollowingControllerNoTouches")] ||
        [self isKindOfClass:NSClassFromString(@"_UIAlertControllerTextFieldViewController")] ||
        [self isKindOfClass:[UIAlertController class]] ||
        [self isKindOfClass:NSClassFromString(@"PUUIAlbumListViewController")] ||
        [self isKindOfClass:[UIImagePickerController class]]) {
        return YES;
    }
    return NO;
}

@end
