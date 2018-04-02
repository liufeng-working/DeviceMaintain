//
//  LFPageViewController.h
//

/**
 用法：
 1.继承LFPageViewController
 2.实现代理方法
 */

#import <UIKit/UIKit.h>

@protocol LFPageDelegate <NSObject>

@required
- (NSInteger)tabCount;
- (UIViewController *)viewControllerAtIndex:(NSUInteger)index;
- (NSString *)tabTitleAtIndex:(NSUInteger)index;

@optional
- (UIColor *)tabBackgroundColor;
- (UIColor *)tabNormalColor;
- (UIColor *)tabSelectClolor;
- (UIColor *)scrollBarColor;
- (CGFloat)scrollBarHeight;
- (CGFloat)duration;

@end

@interface LFPageViewController : UIViewController<LFPageDelegate>

@property(nonatomic,weak) id<LFPageDelegate> delegate;

@property(nonatomic,assign) NSInteger selectIndex;

@property(nonatomic,assign) BOOL scrollEnable;

- (void)reloadData;

@end

