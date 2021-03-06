//
//  UIViewController+LFCategory.h
//

#import <UIKit/UIKit.h>
#import "LFDatePickerViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (alert)

/**
 *  展示一个alertView(只有一个确定按钮)
 *
 *  @param title       标题
 *  @param message     详细信息
 *  @param sureTitle   确认按钮标题
 *  @param com         确认回调
 */
- (void)showAlertViewWithTitle:(NSString *)title message:(NSString *)message sureTitle:(NSString *)sureTitle withComplete:(void(^ _Nullable)(void))com;

/**
 *  展示一个alertView（有取消和确定按钮、确定回调）
 *
 *  @param title       标题
 *  @param message     详细信息
 *  @param cancelTitle 取消按钮标题
 *  @param sureTitle   确认按钮标题
 *  @param com         确认回调
 */
- (void)showAlertViewWithTitle:(NSString *)title message:(nullable NSString *)message cancelTitle:(nullable NSString *)cancelTitle sureTitle:(NSString *)sureTitle withComplete:(void(^ _Nullable)(void))com;


/**
 展示一个alertView（有取消和确定按钮、取消回掉和确定回调）
 
 @param title 标题
 @param message 详细信息
 @param cancelTitle 取消按钮标题
 @param sureTitle 确认按钮标题
 @param cancelAction 取消回调
 @param sureAction 确认回调
 */
- (void)showAlertViewWithTitle:(NSString *)title message:(NSString *)message cancelTitle:(NSString *)cancelTitle sureTitle:(NSString *)sureTitle withCancelComplete:(void(^ _Nullable)(void))cancelAction withSureComplete:(void(^ _Nullable)(void))sureAction;

/**
 *  展示一个alertSheet（只有确定回调）
 *
 *  @param title   标题
 *  @param nameArr 子标题数组
 *  @param com     选中后的回调
 */
- (void)showAlertSheetWithTitle:(NSString *)title nameArray:(NSArray <NSString *>*)nameArr withComplete:(void(^)(NSString *selectItem, NSInteger selectIndex))com;

/**
 展示一个alertSheet（有取消回调和确定回调）
 
 @param title 标题
 @param nameArr 子标题数组
 @param cancelBlock 取消回掉
 @param com 选中后的回调
 */
- (void)showAlertSheetWithTitle:(NSString *)title nameArray:(NSArray <NSString *>*)nameArr cancelBlock:(void(^ _Nullable)(void))cancelBlock withComplete:(void(^ _Nullable)(NSString *selectItem, NSInteger selectIndex))com;

/**
 弹出窗，输入框
 
 @param title 标题
 @param texts text数组
 @param placeholds 占位符数组
 @param sureTitle 确定按钮标题
 @param com 点击“确定”后的回调
 */
- (void)showTextFieldWithTitle:(NSString *)title texts:(NSArray<NSString *> *)texts placeholds:(NSArray<NSString *> *)placeholds sureTitle:(NSString *)sureTitle withComplete:(void(^)(NSArray<UITextField *> *tfs))com;

@end@interface UIViewController (datePicker)

/**
 展示一个时间选择器（只有一个确定回调）
 
 @param sureBlock 确定回调
 @return 返回一个实例，可以用这个实例来设置其他属性
 */
- (LFDatePickerViewController *)showDatePickerWithSureBlock:(void(^ _Nullable)(NSString *dateStr, NSDate *date))sureBlock;

/**
 展示一个时间选择器（时间字符串的格式、时间选择器的样式、确定回调）
 
 @param dateFormat 返回的时间字符串的格式
 @param datePickerMode 时间选择器的样式
 @param sureBlock 确定回调
 */
- (LFDatePickerViewController *)showDatePickerWithDateFormat:(nullable NSString *)dateFormat datePickerMode:(UIDatePickerMode)datePickerMode sureBlock:(void(^)(NSString *dateStr, NSDate *date))sureBlock;

/**
 展示一个时间选择器（可以设置各种属性）
 
 @param cancelTitle 取消按钮标题
 @param cancelColor 取消按钮颜色
 @param sureTitle 确定按钮
 @param sureColor 确定按钮颜色
 @param dateFormat 返回的时间字符串的格式
 @param datePickerMode 时间选择器的样式
 @param cancelBlock 取消回调
 @param sureBlock 确定回调
 */
- (LFDatePickerViewController *)showDatePickerWithCancelTitle:(nullable NSString *)cancelTitle cancelColor:(nullable UIColor *)cancelColor sureTitle:(nullable NSString *)sureTitle sureColor:(nullable UIColor *)sureColor dateFormat:(nullable NSString *)dateFormat datePickerMode:(UIDatePickerMode)datePickerMode cancelBlock:(void(^ _Nullable)(void))cancelBlock sureBlock:(void(^ _Nullable)(NSString *dateStr, NSDate *date))sureBlock;

@end

NS_ASSUME_NONNULL_END

