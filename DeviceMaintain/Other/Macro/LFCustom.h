//
//  LFCustom.h
//

#ifndef LFCustom_h
#define LFCustom_h

#pragma mark -
#pragma mark - 一些视图
//登陆
#define LFLogin LFSB_InitialViewController(@"Login")
//主视图
#define LFMain LFSB_InitialViewController(@"Main")

#pragma mark -
#pragma mark - 从storyboard获取viewController
/** 获取sb */
#define LFStoryboard(storyboardName) [UIStoryboard storyboardWithName:storyboardName bundle:nil]
/** 从某个sb获取某个vc */
#define LFSB_ViewController(storyboardName, className) [LFStoryboard(storyboardName) instantiateViewControllerWithIdentifier:LFClassName(className)]
/** 从某个sb获取主vc */
#define LFSB_InitialViewController(storyboardName) [LFStoryboard(storyboardName) instantiateInitialViewController]

#pragma mark -
#pragma mark - 执行控制器的segue
/** 执行控制器的segue */
#define LFPerformSegue(className) \
[self performSegueWithIdentifier:LFClassName(className) sender:nil];
#define LFPerformSegue_sender(className, parameter) \
[self performSegueWithIdentifier:LFClassName(className) sender:parameter];

#define LFClassName(className) ((void)[className isKindOfClass:[NSObject class]], @#className)

#pragma mark -
#pragma mark - push操作
/** push到某个vc */
#define LFPush(vcName) [self.navigationController pushViewController:vcName animated:YES]
/** push到某个sb的某个vc */
#define LFPush_SB_ViewController(storyboardName, className) do {\
UIViewController *nextVC = LFSB_ViewController(storyboardName, className);\
LFPush(nextVC);\
} while (0)
/** push到某个sb的主vc */
#define LFPush_SB_InitialViewController(storyboardName) do {\
UIViewController *nextVC = LFSB_InitialViewController(storyboardName);\
LFPush(nextVC);\
} while (0)

#endif /* LFCustom_h */
