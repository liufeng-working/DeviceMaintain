//
//  NSString+LFCategory.h
//
// 判断是否是汉字 @"^(\\p{script=Han})*$";
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (LFCategory)

#pragma mark -
#pragma mark - md5加密
- (NSString *)md5Encoded;

@end

NS_ASSUME_NONNULL_END
