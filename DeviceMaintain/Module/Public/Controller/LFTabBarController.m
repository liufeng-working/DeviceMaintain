//
//  LFTabBarController.m
//

#import "LFTabBarController.h"

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
    
//    self.tabBar.translucent = NO;
}

-(void)dealloc {
    NSLog(@"%s",__func__);
}

@end
