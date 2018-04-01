//
//  UIViewController+LFCategory.m
//

#import "UIViewController+LFCategory.h"

@implementation UIViewController (alert)

/**
 *  展示一个alertView(只有一个确定按钮)
 *
 *  @param title       标题
 *  @param message     详细信息
 *  @param sureTitle   确认按钮标题
 *  @param com         确认回调
 */
- (void)showAlertViewWithTitle:(NSString *)title message:(NSString *)message sureTitle:(NSString *)sureTitle withComplete:(void(^)(void))com
{
    [self showAlertViewWithTitle:title message:message cancelTitle:nil sureTitle:sureTitle withComplete:com];
}

/**
 *  展示一个alertView
 *
 *  @param title       标题
 *  @param message     详细信息
 *  @param cancelTitle 取消按钮标题
 *  @param sureTitle   确认按钮标题
 *  @param com         确认回调
 */
- (void)showAlertViewWithTitle:(NSString *)title message:(NSString *)message cancelTitle:(NSString *)cancelTitle sureTitle:(NSString *)sureTitle withComplete:(void(^)(void))com
{
    [self showAlertViewWithTitle:title message:message cancelTitle:cancelTitle sureTitle:sureTitle withCancelComplete:nil withSureComplete:com];
}

/**
 展示一个alertView（有取消和确定按钮）
 
 @param title 标题
 @param message 详细信息
 @param cancelTitle 取消按钮标题
 @param sureTitle 确认按钮标题
 @param cancelAction 取消回调
 @param sureAction 确认回调
 */
- (void)showAlertViewWithTitle:(NSString *)title message:(NSString *)message cancelTitle:(NSString *)cancelTitle sureTitle:(NSString *)sureTitle withCancelComplete:(void(^)(void))cancelAction withSureComplete:(void(^)(void))sureAction
{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    
    if (cancelTitle) {
        UIAlertAction *cancel = [UIAlertAction actionWithTitle:cancelTitle style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            if (cancelAction) {
                cancelAction();
            }
        }];
        [cancel setValue:[UIColor blackColor] forKey:@"titleTextColor"];
        [alert addAction:cancel];
    }
    
    UIAlertAction *sure = [UIAlertAction actionWithTitle:sureTitle style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        
        if (sureAction) {
            sureAction();
        }
    }];
    [alert addAction:sure];
    [self presentViewController:alert animated:YES completion:nil];
}

/**
 *  展示一个alertSheet
 *
 *  @param title   标题
 *  @param nameArr 子标题数组
 *  @param com     选中后的回调
 */
- (void)showAlertSheetWithTitle:(NSString *)title nameArray:(NSArray <NSString *>*)nameArr withComplete:(void(^)(NSString *selectItem, NSInteger selectIndex))com
{
    [self showAlertSheetWithTitle:title nameArray:nameArr cancelBlock:nil withComplete:com];
}

/**
 展示一个alertSheet
 
 @param title 标题
 @param nameArr 子标题数组
 @param cancelBlock 取消回调
 @param com 选中后的回调
 */
- (void)showAlertSheetWithTitle:(NSString *)title nameArray:(NSArray <NSString *>*)nameArr cancelBlock:(void(^)(void))cancelBlock withComplete:(void(^)(NSString *selectItem, NSInteger selectIndex))com
{
    [self.view endEditing:YES];
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        if (cancelBlock) {
            cancelBlock();
        }
    }];
    [cancel setValue:[UIColor blackColor] forKey:@"titleTextColor"];
    [alert addAction:cancel];
    
    [nameArr enumerateObjectsUsingBlock:^(NSString * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        UIAlertAction *allAction = [UIAlertAction actionWithTitle:obj style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            if (com) {
                com(obj, idx);
            }
        }];
        
//        [allAction setValue:kNavColor forKey:@"titleTextColor"];
        [alert addAction:allAction];
    }];
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [self presentViewController:alert animated:YES completion:nil];
    });
}

/**
 弹出窗，输入框
 
 @param title 标题
 @param texts text数组
 @param placeholds 占位符数组
 @param sureTitle 确定按钮标题
 @param com 点击“确定”后的回调
 */
- (void)showTextFieldWithTitle:(NSString *)title texts:(NSArray<NSString *> *)texts placeholds:(NSArray<NSString *> *)placeholds sureTitle:(NSString *)sureTitle withComplete:(void(^)(NSArray<UITextField *> *tfs))com
{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:nil preferredStyle:UIAlertControllerStyleAlert];
    
    [placeholds enumerateObjectsUsingBlock:^(NSString * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [alert addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
            textField.text = idx < texts.count ? texts[idx] : nil;
            textField.placeholder = obj;
            textField.returnKeyType = UIReturnKeyDone;
            textField.borderStyle = UITextBorderStyleNone;
        }];
    }];
    
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    [cancel setValue:[UIColor blackColor] forKey:@"titleTextColor"];
    [alert addAction:cancel];
    
    UIAlertAction *sure = [UIAlertAction actionWithTitle:sureTitle style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        
        if (com) {
            com(alert.textFields);
        }
    }];
    [alert addAction:sure];
    
    [self presentViewController:alert animated:YES completion:nil];
}

@end

