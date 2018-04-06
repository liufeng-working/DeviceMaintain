//
//  LFExamineDetailViewController.m
//  DeviceMaintain
//
//  Created by 刘丰 on 2018/4/6.
//  Copyright © 2018年 liufeng. All rights reserved.
//

#import "LFExamineDetailViewController.h"
#import "LFExamineViewModel.h"

@interface LFExamineDetailViewController ()<UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UILabel *FaultCategoryLabel;
@property (weak, nonatomic) IBOutlet UILabel *ServiceManLabel;
@property (weak, nonatomic) IBOutlet UILabel *ArriveTimeLabel;
@property (weak, nonatomic) IBOutlet UILabel *LeaveTimeLabel;
@property (weak, nonatomic) IBOutlet UILabel *MaintResultLabel;
@property (weak, nonatomic) IBOutlet UILabel *FaultReasonLabel;
@property (weak, nonatomic) IBOutlet UILabel *SolveWayLabel;
@property (weak, nonatomic) IBOutlet UILabel *SuggestLabel;
@property (weak, nonatomic) IBOutlet UITextField *exTextField;

@property(nonatomic, strong) LFExamineViewModel *examineViewModel;
@property (weak, nonatomic) IBOutlet UIButton *refreshButton;

@property(nonatomic, strong) LFExamineDetailModel *detailModel;

@end

@implementation LFExamineDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self loadData];
}

- (IBAction)refreshClick:(UIBarButtonItem *)sender {
    [self.view endEditing:YES];
    [self loadData];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}

#pragma mark -
#pragma mark - 审核
- (IBAction)examine:(UIButton *)sender {
    NSString *msg = [self.exTextField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    if (!msg.length) {
        return [LFNotification autoHideWithText:@"请先填写审核说明"];
    }
    
    [LFNotification manuallyHideIndicatorWithText:@"审核中"];
    [self.examineViewModel examineWithId:self.detailModel.RepairID msg:msg success:^{
        [LFNotification manuallyHideWithText:@"审核成功"];
        [LFNotificationCenter postNotificationName:LFExamineSuccessNotification object:nil];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self.navigationController popToRootViewControllerAnimated:YES];
        });
    } failure:^{
        [LFNotification autoHideWithText:@"操作失败，请重试"];
    }];
}

- (void)loadData
{
    [self.examineViewModel getExamineDetailWithId:self.ID success:^(LFExamineDetailModel *detailM) {
        self.refreshButton.hidden = YES;
        [self fillData:detailM];
        self.detailModel = detailM;
    } failure:^{
        self.refreshButton.hidden = NO;
        [LFNotification autoHideWithText:@"请求失败，请重试"];
    }];
}

- (void)fillData:(LFExamineDetailModel *)detailModel
{
    self.FaultCategoryLabel.text = [NSString stringWithFormat:@"%ld", (long)detailModel.FaultCategory];
//    self.ServiceManLabel.text =
    self.ArriveTimeLabel.text = detailModel.ArriveTime;
    self.LeaveTimeLabel.text = detailModel.LeaveTime;
    self.MaintResultLabel.text = detailModel.MaintResult;
    self.FaultReasonLabel.text = detailModel.FaultReason;
    self.SolveWayLabel.text = detailModel.SolveWay;
    self.SuggestLabel.text = detailModel.Suggest;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [self.view endEditing:YES];
    return YES;
}

#pragma mark -
#pragma mark - lazy懒加载
- (LFExamineViewModel *)examineViewModel
{
    if (!_examineViewModel) {
        _examineViewModel = [[LFExamineViewModel alloc] init];
    }
    return _examineViewModel;
}

@end
