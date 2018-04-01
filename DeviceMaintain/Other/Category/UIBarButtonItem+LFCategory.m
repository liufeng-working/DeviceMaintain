//
//  UIBarButtonItem+LFCategory.m
//

#import "UIBarButtonItem+LFCategory.h"

@implementation UIBarButtonItem (custom)

/**
 快速构建一个自定义item
 
 @param target 响应方法的目标
 @param action 方法
 @param image 默认图片
 @param highlightedImage 高亮图片
 @return item
 */
+ (UIBarButtonItem *)barButtonItemWithTarget:(nullable id)target action:(nullable SEL)action image:(UIImage *)image highlightedImage:(nullable UIImage *)highlightedImage
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0, 0, 30, 30);
    [btn setImage:image forState:UIControlStateNormal];
    [btn setImage:highlightedImage forState:UIControlStateHighlighted];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    [btn setContentHorizontalAlignment:UIControlContentHorizontalAlignmentRight];
    [btn setContentVerticalAlignment:UIControlContentVerticalAlignmentCenter];
    UIView *content = [[UIView alloc] initWithFrame:btn.bounds];
    [content addSubview:btn];
    return [[UIBarButtonItem alloc] initWithCustomView:content];
}

/**
 快速构建一个自定义item
 
 @param target 响应方法的目标
 @param action 方法
 @param image 默认图片
 @param selectedImage 选中图片
 @return item
 */
+ (UIBarButtonItem *)barButtonItemWithTarget:(nullable id)target action:(nullable SEL)action image:(UIImage *)image selectedImage:(nullable UIImage *)selectedImage
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0, 0, 30, 30);
    btn.adjustsImageWhenHighlighted = NO;
    [btn setImage:image forState:UIControlStateNormal];
    [btn setImage:selectedImage forState:UIControlStateSelected];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    [btn setContentHorizontalAlignment:UIControlContentHorizontalAlignmentRight];
    [btn setContentVerticalAlignment:UIControlContentVerticalAlignmentCenter];
    UIView *content = [[UIView alloc] initWithFrame:btn.bounds];
    [content addSubview:btn];
    return [[UIBarButtonItem alloc] initWithCustomView:content];
}

/**
 快速构建一个返回item
 
 @param target 响应方法的目标
 @param action 方法
 @param image 默认图片
 @param highlightedImage 高亮图片
 @param color 默认文字颜色
 @param highlightedColor 高亮文字颜色
 @param title 返回标题
 @return item
 */
+ (UIBarButtonItem *)backBarButtonItemWithTarget:(nullable id)target action:(nullable SEL)action image:(UIImage *)image highlightedImage:(nullable UIImage *)highlightedImage color:(UIColor *)color highlightedColor:(UIColor *)highlightedColor title:(NSString *)title
{
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    backBtn.contentEdgeInsets = UIEdgeInsetsMake(0, -10, 0, 10);
    [backBtn setTitle:title forState:UIControlStateNormal];
    [backBtn setTitleColor:color forState:UIControlStateNormal];
    [backBtn setTitleColor:highlightedColor forState:UIControlStateHighlighted];
    [backBtn setImage:image forState:UIControlStateNormal];
    [backBtn setImage:highlightedImage forState:UIControlStateHighlighted];
    [backBtn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    [backBtn sizeToFit];
    return [[UIBarButtonItem alloc] initWithCustomView:backBtn];
}

@end
