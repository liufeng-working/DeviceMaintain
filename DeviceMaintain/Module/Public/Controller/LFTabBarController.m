//
//  LFTabBarController.m
//

#import "LFTabBarController.h"

@interface LFTabBarController ()

@end

@implementation LFTabBarController

+ (void)initialize {
    //选中颜色
    [[UITabBar appearance] setTintColor:[UIColor redColor]];
    
    //背景颜色
    [[UITabBar appearance] setBarTintColor:[UIColor blueColor]];
    
    //字体大小和颜色
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSFontAttributeName: [UIFont systemFontOfSize:12], NSForegroundColorAttributeName: [UIColor grayColor]} forState:UIControlStateNormal];
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSFontAttributeName: [UIFont systemFontOfSize:12], NSForegroundColorAttributeName: [UIColor redColor]} forState:UIControlStateSelected];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    self.tabBar.translucent = NO;
}

-(void)dealloc {
    NSLog(@"%s",__func__);
}

@end
