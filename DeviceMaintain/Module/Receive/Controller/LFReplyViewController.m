//
//  LFReplyViewController.m
//  DeviceMaintain
//
//  Created by 刘丰 on 2018/4/5.
//  Copyright © 2018年 liufeng. All rights reserved.
//

#import "LFReplyViewController.h"
#import "LFApplyViewModel.h"
#import "LFManufacturerNumberViewController.h"

@interface LFReplyViewController ()

@property(nonatomic, strong) LFApplyViewModel *applyViewModel;

/** 报修单编号 */
@property(nonatomic, weak) IBOutlet UITextField *CodeTextField;

/** 报修单日期 */
@property(nonatomic, weak) IBOutlet UITextField *RepairDateTextField;

/** 报修人 */
@property(nonatomic, weak) IBOutlet UITextField *RepairManTextField;

/** 联系方式 */
@property(nonatomic, weak) IBOutlet UITextField *ContactWayTextField;

/** 设备id */
@property(nonatomic, weak) IBOutlet UITextField *MachineIDTextField;

/** 报修期限 1 新机安装，2 保修期内 3 保修期外， 4非经销机床 */
@property(nonatomic, weak) IBOutlet UITextField *WarrantyStatusTextField;

/** 客户id */
@property(nonatomic, weak) IBOutlet UITextField *ClientIDTextField;

/** 设备地址 */
@property(nonatomic, weak) IBOutlet UITextField *MacAddressTextField;

/** 故障描述 */
@property(nonatomic, weak) IBOutlet UITextField *FaultDescriptionTextField;

/** 报修单状态 */
@property(nonatomic, weak) IBOutlet UITextField *StatusTextField;

/** 记录来源 */
@property(nonatomic, weak) IBOutlet UITextField *RecordSourceTextField;

/** 备注 */
@property(nonatomic, weak) IBOutlet UITextField *RemarkTextField;

/** 故障定义主键 */
@property(nonatomic, weak) IBOutlet UITextField *FaultDefinitionIDTextField;

/** 客户名称 */
@property(nonatomic, weak) IBOutlet UITextField *ClientNameTextField;

/** 设备客户编号 */
@property(nonatomic, weak) IBOutlet UITextField *ClientCodeTextField;

/** 用户主键 */
@property(nonatomic, weak) IBOutlet UITextField *UserIDTextField;

/** 用户名称 */
@property(nonatomic, weak) IBOutlet UITextField *UserNameTextField;

/** 人员id列表 */
@property(nonatomic, weak) IBOutlet UITextField *StaffIDsTextField;

@property(nonatomic, strong) NSDate *date;

@end

@implementation LFReplyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [LFNotification manuallyHideWithIndicator];
    [self.applyViewModel getRepairCode:^(NSString *code) {
        self.CodeTextField.text = code;
    } failure:^{
        [LFNotification manuallyHideWithText:@"报修单号请求失败，请重试"];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [LFNotification hideNotification];
            [self.navigationController popViewControllerAnimated:YES];
        });
    }];
}

- (IBAction)selectDate:(UITapGestureRecognizer *)sender {
    [self showDatePickerWithSureBlock:^(NSString * _Nonnull dateStr, NSDate * _Nonnull date) {
        self.RepairDateTextField.text = dateStr;
        self.date = date;
    }].datePicker.date = self.date;;
}

- (IBAction)selectManufacturerNumber:(UITapGestureRecognizer *)sender {
    LFManufacturerNumberViewController *vc = LFSB_ViewController(LFReceiveSBName, LFManufacturerNumberViewController);
    LFPush(vc);
}

#pragma mark -
#pragma mark - lazy懒加载
- (LFApplyViewModel *)applyViewModel
{
    if (!_applyViewModel) {
        _applyViewModel = [[LFApplyViewModel alloc] init];
    }
    return _applyViewModel;
}

- (NSDate *)date
{
    if (!_date) {
        _date = [NSDate date];
    }
    return _date;
}

@end
