//
//  KTSystem.h
//

#ifndef LFSystem_h
#define LFSystem_h

#pragma mark -
#pragma mark - 屏幕宽高
/** 屏幕宽高 */
#define LFWidth [UIScreen mainScreen].bounds.size.width
#define LFHeight [UIScreen mainScreen].bounds.size.height

#pragma mark -
#pragma mark - 主窗口
/** 主窗口 */
#define LFWindow ([UIApplication sharedApplication].delegate.window)

#pragma mark -
#pragma mark - 主程序
/** 主程序代理 */
#define LFAppDelegate ((AppDelegate *)[UIApplication sharedApplication].delegate)

#pragma mark -
#pragma mark - 主程序
/** 主程序 */
#define LFApp [UIApplication sharedApplication]

#pragma mark -
#pragma mark - 用户偏好设置
/** 用户偏好设置 */
#define LFUserDefaults [NSUserDefaults standardUserDefaults]

#pragma mark -
#pragma mark - 通知中心
/** 通知中心 */
#define LFNotificationCenter [NSNotificationCenter defaultCenter]

#endif /* LFSystem_h */
