//
//  UIColor+LFCategory.h
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIColor (LFCategory)

/**
 *  用6位数 获取颜色（字符串 @"#000000" 或者 @"000000"）
 */
+ (UIColor *)colorWithHexString:(NSString*)hex;

@end

NS_ASSUME_NONNULL_END
