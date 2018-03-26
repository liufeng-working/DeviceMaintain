//
//  UIColor+LFCategory.m
//

#import "UIColor+LFCategory.h"

@implementation UIColor (LFCategory)

/**
 *  用6位数 获取颜色（字符串 @"#000000" 或者 @"000000"）
 */
+ (UIColor *)colorWithHexString:(NSString*)hex
{
    if (hex.length <6) {
        return [UIColor clearColor];
    }
    
    unsigned int redInt_, greenInt_, blueInt_;
    NSRange rangeNSRange_;
    rangeNSRange_.length = 2;  // 范围长度为2
    
    // 取红色的值
    rangeNSRange_.location = hex.length -6;
    [[NSScanner scannerWithString:[hex substringWithRange:rangeNSRange_]]
     scanHexInt:&redInt_];
    
    // 取绿色的值
    rangeNSRange_.location = hex.length -4;
    [[NSScanner scannerWithString:[hex substringWithRange:rangeNSRange_]]
     scanHexInt:&greenInt_];
    
    // 取蓝色的值
    rangeNSRange_.location = hex.length -2;
    [[NSScanner scannerWithString:[hex substringWithRange:rangeNSRange_]]
     scanHexInt:&blueInt_];
    
    return [UIColor colorWithRed:(float)(redInt_/255.0f)
                           green:(float)(greenInt_/255.0f)
                            blue:(float)(blueInt_/255.0f)
                           alpha:1.0f];
}

@end
