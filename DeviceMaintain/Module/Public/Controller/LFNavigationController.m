//
//  LFNavigationController.m
//

#import "LFNavigationController.h"

@interface LFNavigationController ()<UIGestureRecognizerDelegate>

@property(nonatomic,strong) UIPanGestureRecognizer *popGestureRecognizer;

@end

@implementation LFNavigationController

+ (void)initialize {
    //背景色
    [[UINavigationBar appearance] setBarTintColor:LF_color_14a6de()];

    //中心标题
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSFontAttributeName: [UIFont boldSystemFontOfSize:17],
         NSForegroundColorAttributeName: [UIColor whiteColor]}];
    
    //左右UIBarButtonItem颜色(对自定义无效)
    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
    
    //修改导航栏返回按钮的图片
    [UINavigationBar appearance].backIndicatorImage = [UIImage imageNamed:@"nav_back"];
    [UINavigationBar appearance].backIndicatorTransitionMaskImage = [UIImage imageNamed:@"nav_back"];
    
    //左右UIBarButtonItem字体颜色(对自定义无效)
    [[UIBarButtonItem appearance] setTitleTextAttributes:@{NSFontAttributeName: [UIFont systemFontOfSize:15],NSForegroundColorAttributeName: [UIColor whiteColor]} forState:UIControlStateNormal];
    
    //去除底部分割线
    [[UINavigationBar appearance] setShadowImage:[UIImage new]];
}

- (UIPanGestureRecognizer *)popGestureRecognizer
{
    if (!_popGestureRecognizer) {
        NSArray *internalTargets = [self.interactivePopGestureRecognizer valueForKey:@"targets"];
        id internalTarget = [internalTargets.firstObject valueForKey:@"target"];
        SEL intetnalAction = NSSelectorFromString(@"handleNavigationTransition:");
        _popGestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:internalTarget action:intetnalAction];
        _popGestureRecognizer.maximumNumberOfTouches = 1;
        _popGestureRecognizer.delegate = self;
    }
    return _popGestureRecognizer;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.interactivePopGestureRecognizer.view addGestureRecognizer:self.popGestureRecognizer];
    
    self.interactivePopGestureRecognizer.enabled = NO;
    
    self.navigationBar.translucent = YES;
}

//push时，隐藏底部TabBar
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    
    viewController.hidesBottomBarWhenPushed = self.viewControllers.count;
    [super pushViewController:viewController animated:animated];
}

- (BOOL)prefersStatusBarHidden {
    return NO;
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

#pragma mark -
#pragma mark - UIGestureRecognizerDelegate
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {
    return self.viewControllers.count > 1 && ![[self valueForKey:@"_isTransitioning"] boolValue];
}

-(void)dealloc {
    NSLog(@"%s",__func__);
}

@end
