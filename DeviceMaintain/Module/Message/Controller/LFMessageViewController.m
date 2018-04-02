//
//  LFMessageViewController.m
//  DeviceMaintain
//
//  Created by 刘丰 on 2018/4/2.
//  Copyright © 2018年 liufeng. All rights reserved.
//

#import "LFMessageViewController.h"
#import "LFMessageListViewController.h"

@interface LFMessageViewController ()

@property(nonatomic, strong) NSArray<NSString *> *titles;

@end

@implementation LFMessageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (NSInteger)tabCount
{
    return self.titles.count;
}

- (UIViewController *)viewControllerAtIndex:(NSUInteger)index
{
    LFMessageListViewController *messageVC = [[LFMessageListViewController alloc] init];
    messageVC.messageType = index == 0 ? LFMessageTypeUnread : LFMessageTypeRead;
    return messageVC;
}

- (NSString *)tabTitleAtIndex:(NSUInteger)index
{
    return self.titles[index];
}

- (UIColor *)tabBackgroundColor
{
    return LF_color_14a6de();
}

- (UIColor *)tabNormalColor
{
    return LF_color_666666();
}

- (UIColor *)tabSelectClolor
{
    return LF_color_ffffff();
}

- (UIColor *)scrollBarColor
{
    return LF_color_ffffff();
}

#pragma mark -
#pragma mark - lazy懒加载
- (NSArray<NSString *> *)titles
{
    if (!_titles) {
        _titles = @[@"未读", @"已读"];
    }
    return _titles;
}

@end
