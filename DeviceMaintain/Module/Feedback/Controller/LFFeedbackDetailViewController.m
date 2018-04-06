//
//  LFFeedbackDetailViewController.m
//  DeviceMaintain
//
//  Created by 刘丰 on 2018/4/6.
//  Copyright © 2018年 liufeng. All rights reserved.
//

#import "LFFeedbackDetailViewController.h"
#import "LFFeedbackViewModel.h"
#import "LFSolutionViewController.h"
#import "LFUserViewController.h"
#import "LFRepairDetailModel.h"

@interface LFFeedbackDetailViewController ()

@property (weak, nonatomic) IBOutlet UILabel *FaultCategoryLabel;

@property(nonatomic, strong) LFFeedbackViewModel *feedbackViewModel;

@property(nonatomic, strong) NSArray<LFFaultModel *> *faultModels;

@property(nonatomic, strong) LFUserViewController *userVC;

@property(nonatomic, copy) NSString *usersID;

@property (weak, nonatomic) IBOutlet UITextField *faultNameTextfield;
@property (weak, nonatomic) IBOutlet UITextField *serverNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *startTimeTextField;
@property (weak, nonatomic) IBOutlet UITextField *endTimeTextField;
@property (weak, nonatomic) IBOutlet UITextField *MaintResultTextField;
@property (weak, nonatomic) IBOutlet UITextField *FaultReasonTextField;
@property (weak, nonatomic) IBOutlet UITextView *SolveWayTextView;
@property (weak, nonatomic) IBOutlet UITextField *SuggestTextField;
@property (weak, nonatomic) IBOutlet UITextField *StaffIDsTextField;

@end

@implementation LFFeedbackDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self getFaultModels];
}

- (IBAction)selectFaultName {
    if (self.faultModels.count) {
        [self showAlertSheetWithTitle:@"请选择故障分类" nameArray: [self.faultModels map:^id _Nonnull(LFFaultModel * _Nonnull obj) {
            return obj.Name;
        }] withComplete:^(NSString * _Nonnull selectItem, NSInteger selectIndex) {
            self.faultNameTextfield.text = selectItem;
        }];
    }
}

- (IBAction)selectStartTime {
    [self showDatePickerWithSureBlock:^(NSString * _Nonnull dateStr, NSDate * _Nonnull date) {
        self.startTimeTextField.text = dateStr;
    }];
}

- (IBAction)selectEndTime {
    [self showDatePickerWithSureBlock:^(NSString * _Nonnull dateStr, NSDate * _Nonnull date) {
        self.endTimeTextField.text = dateStr;
    }];
}

- (IBAction)solutionWay:(UIButton *)sender {
    LFSolutionViewController *solutionVC = LFSB_ViewController(LFFeedbackSBName, LFSolutionViewController);
    LFPush(solutionVC);
}

- (IBAction)selectUsers:(UIButton *)sender {
    
    __weak typeof(self) weakSelf = self;
    self.userVC.callback = ^(NSString *usersID, NSString *name) {
        weakSelf.StaffIDsTextField.text = name;
        weakSelf.usersID = usersID;
    };
    
    self.userVC.rid = self.repairDetailModel.ID;
    LFPush(self.userVC);
}

- (IBAction)feedback:(UIButton *)sender {
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewAutomaticDimension;
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50;
}

#pragma mark -
#pragma mark - lazy懒加载
- (LFFeedbackViewModel *)feedbackViewModel
{
    if (!_feedbackViewModel) {
        _feedbackViewModel = [[LFFeedbackViewModel alloc] init];
    }
    return _feedbackViewModel;
}

#pragma mark -
#pragma mark - private私有方法
- (void)getFaultModels
{
    [LFNotification manuallyHideIndicatorWithText:@"正在加载故障归类"];
    [self.feedbackViewModel getFaults:^(NSArray<LFFaultModel *> *faults) {
        if (!faults.count) {
            [self showAlertViewWithTitle:@"温馨提示" message:@"故障分类无数据，无法进行下步操作，请返回。" sureTitle:@"好的" withComplete:^{
                [self.navigationController popViewControllerAnimated:YES];
            }];
        }else {
            self.faultModels = faults;
            self.faultNameTextfield.text = faults.firstObject.Name;
        }
    } failure:^{
        [LFNotification hideNotification];
        [self showAlertViewWithTitle:@"温馨提示" message:@"故障分类加载失败，您将无法继续下步操作，是否重试？" cancelTitle:@"算了" sureTitle:@"再试一次" withCancelComplete:^{
            [self.navigationController popViewControllerAnimated:YES];
        } withSureComplete:^{
            [self getFaultModels];
        }];
    }];
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
