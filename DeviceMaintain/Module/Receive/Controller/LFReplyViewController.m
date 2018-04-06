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
#import "LFReceiveTool.h"
#import "LFUserViewController.h"

@interface LFReplyViewController ()

@property(nonatomic, strong) LFApplyViewModel *applyViewModel;

/** 报修单编号 */
@property(nonatomic, weak) IBOutlet UITextField *CodeTextField;

/** 报修单日期 */
@property(nonatomic, weak) IBOutlet UITextField *RepairDateTextField;

/** 设备厂家编号 */
@property(nonatomic, weak) IBOutlet UITextField *Code1TextField;

/** 设备客户编号 */
@property(nonatomic, weak) IBOutlet UITextField *ClientCodeTextField;

/** 设备型号 */
@property(nonatomic, weak) IBOutlet UITextField *MacModelNameTextField;

/** 出厂时间 */
@property(nonatomic, weak) IBOutlet UITextField *FactoryTimeTextField;

/** 控制系统 */
@property(nonatomic, weak) IBOutlet UITextField *CtrlModelNameTextField;

/** 客户名称 */
@property(nonatomic, weak) IBOutlet UITextField *ClientNameTextField;

/** 所属工厂 */
@property(nonatomic, weak) IBOutlet UITextField *FactoryNameTextField;

/** 所属车间 */
@property(nonatomic, weak) IBOutlet UITextField *WorkShopNameTextField;

/** 所属办事处 */
@property(nonatomic, weak) IBOutlet UITextField *OfficeNameTextField;

/** 客户联系方式 */
@property(nonatomic, weak) IBOutlet UITextField *ClientMobileTextField;

/** 保修期限 1 新机安装，2 保修期内 3 保修期外， 4非经销机床 */
@property(nonatomic, weak) IBOutlet UITextField *WarrantyStatusTextField;

/** 设备地址 */
@property(nonatomic, weak) IBOutlet UITextField *MacAddressTextField;

/** 报修人 */
@property(nonatomic, weak) IBOutlet UITextField *RepairManTextField;

/** 联系方式 */
@property(nonatomic, weak) IBOutlet UITextField *ContactWayTextField;

/** 故障描述 */
@property(nonatomic, weak) IBOutlet UITextField *FaultDescriptionTextField;

/** 备注 */
@property(nonatomic, weak) IBOutlet UITextField *RemarkTextField;

/** 人员id列表 */
@property(nonatomic, weak) IBOutlet UITextField *StaffIDsTextField;

@property(nonatomic, strong) NSDate *date;

@property(nonatomic, strong) LFDeviceModel *deviceModel;

@property(nonatomic, strong) LFUserViewController *userVC;

@property(nonatomic, copy) NSString *usersID;

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
    LFManufacturerNumberViewController *manufacturerNumberVC = LFSB_ViewController(LFReceiveSBName, LFManufacturerNumberViewController);
    
    __weak typeof(self) weakSelf = self;
    manufacturerNumberVC.callback = ^(LFDeviceModel *deviceModel) {
        weakSelf.Code1TextField.text = deviceModel.Code;
        weakSelf.ClientCodeTextField.text = deviceModel.Code;
        weakSelf.MacModelNameTextField.text = deviceModel.MacModelName;
        weakSelf.FactoryTimeTextField.text = deviceModel.FactoryTime;
        weakSelf.CtrlModelNameTextField.text = deviceModel.CtrlModelName;
        weakSelf.ClientNameTextField.text = deviceModel.ClientName;
        weakSelf.FactoryNameTextField.text = deviceModel.FactoryName;
        weakSelf.WorkShopNameTextField.text = deviceModel.WorkShopName;
        weakSelf.OfficeNameTextField.text = deviceModel.OfficeName;
        weakSelf.ClientMobileTextField.text = deviceModel.ClientMobile;
        
        weakSelf.deviceModel = deviceModel;
    };
    LFPush(manufacturerNumberVC);
}

- (IBAction)selectWarrantyStatus:(UITapGestureRecognizer *)sender {
    [self showAlertSheetWithTitle:@"保修期限" nameArray:LFReceiveTool.WarrantyStatusString withComplete:^(NSString * _Nonnull selectItem, NSInteger selectIndex) {
        self.WarrantyStatusTextField.text = selectItem;
    }];
}

- (IBAction)selectUser:(UIButton *)sender {
    
    if (self.CodeTextField.text.length <= 0) {
        return [LFNotification autoHideWithText:@"请先生成报修单号"];
    }
    
    if (self.deviceModel.ClientID.length <= 0) {
        return [LFNotification autoHideWithText:@"请先选择厂家设备编号"];
    }
    
    __weak typeof(self) weakSelf = self;
    self.userVC.callback = ^(NSString *usersID, NSString *name) {
        weakSelf.StaffIDsTextField.text = name;
        weakSelf.usersID = usersID;
    };
    self.userVC.tid = self.deviceModel.ClientID;
    self.userVC.rid = self.CodeTextField.text;
    LFPush(self.userVC);
}

- (IBAction)commit:(UIButton *)sender {
    [self.view endEditing:YES];
    
    if (!self.CodeTextField.text.length) {
        return [LFNotification autoHideWithText:@"请先生成报修单号"];
    }
    
    if (!self.RepairDateTextField.text.length) {
        return [LFNotification autoHideWithText:@"请先选择报修时间"];
    }
    
    if (!self.Code1TextField.text.length) {
        return [LFNotification autoHideWithText:@"请先选择厂家编号"];
    }
    
    if (!self.WarrantyStatusTextField.text.length) {
        return [LFNotification autoHideWithText:@"请先选择报修期限"];
    }
    
    if (!self.RepairManTextField.text.length) {
        return [LFNotification autoHideWithText:@"请先填写报修人"];
    }
    
    if (!self.FaultDescriptionTextField.text.length) {
        return [LFNotification autoHideWithText:@"请先填写故障描述"];
    }
    
    if (!self.StaffIDsTextField.text.length) {
        return [LFNotification autoHideWithText:@"请先选择人员分配"];
    }
    
    NSMutableDictionary *param = [NSMutableDictionary dictionary];
    param[@"ID"] = @"";
    param[@"Code"] = self.CodeTextField.text;
    param[@"RepairDate"] = self.RepairDateTextField.text;
    param[@"ClientCode"] = self.ClientCodeTextField.text;
    param[@"ClientName"] = self.ClientNameTextField.text;
    param[@"WarrantyStatus"] = [LFReceiveTool WarrantyStatus:self.WarrantyStatusTextField.text];
    param[@"MacAddress"] = self.MacAddressTextField.text;
    param[@"RepairMan"] = self.RepairManTextField.text;
    param[@"ContactWay"] = self.ContactWayTextField.text;
    param[@"FaultDescription"] = self.FaultDescriptionTextField.text;
    param[@"MachineID"] = [NSUUID UUID].UUIDString;
    param[@"Remark"] = self.RemarkTextField.text;
    param[@"ClientID"] = self.deviceModel.ClientID;
    param[@"Status"] = @0;
    param[@"RecordSource"] = @2;
    param[@"FaultDefinitionID"] = @"";
    param[@"ClientCode"] = self.deviceModel.ClientCode;
    param[@"UserID"] = [LFUserManager manager].user.UserID;
    param[@"UserName"] = [LFUserManager manager].user.UserCode;
    param[@"StaffIDs"] = self.usersID;    
    
    [LFNotification manuallyHideWithText:@"正在处理"];
    [self.applyViewModel submitRepairWithParam:param success:^ {
        [LFNotification autoHideWithText:@"报修申请成功"];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self.navigationController popViewControllerAnimated:YES];
        });
    } failure:^{
        [LFNotification autoHideWithText:@"报修申请失败，请重试"];
    }];
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

- (LFUserViewController *)userVC
{
    if (!_userVC) {
        _userVC =LFSB_ViewController(LFReceiveSBName, LFUserViewController);
    }
    return _userVC;
}

- (void)dealloc {
    self.userVC = nil;
}

@end
