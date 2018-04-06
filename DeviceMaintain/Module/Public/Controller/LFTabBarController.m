//
//  LFTabBarController.m
//

#import "LFTabBarController.h"
#import "LFMessageViewController.h"

@interface LFTabBarController ()

@end

@implementation LFTabBarController

+ (void)initialize {
    //选中颜色
    [[UITabBar appearance] setTintColor:LF_color_14a6de()];
    
    //背景颜色
    [[UITabBar appearance] setBarTintColor:[UIColor whiteColor]];
    
    //字体大小和颜色
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSFontAttributeName: [UIFont systemFontOfSize:10], NSForegroundColorAttributeName: [UIColor grayColor]} forState:UIControlStateNormal];
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSFontAttributeName: [UIFont systemFontOfSize:10], NSForegroundColorAttributeName: LF_color_14a6de()} forState:UIControlStateSelected];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [LFMessageViewModel.new messagesWithSuccess:^(NSArray<LFMessageModel *> *messages) {
        NSPredicate *p = [NSPredicate predicateWithFormat:@"Status=0"];
        NSArray *unreadArray = [messages filteredArrayUsingPredicate:p];
        [self.viewControllers enumerateObjectsUsingBlock:^(__kindof UINavigationController * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            if ([obj.viewControllers.firstObject isKindOfClass:[LFMessageViewController class]]) {
                obj.tabBarItem.badgeValue = unreadArray.count ? [NSString stringWithFormat:@"%@", @(unreadArray.count)] : nil;
                *stop = YES;
            }
        }];
    } failure:nil];
}

@end
