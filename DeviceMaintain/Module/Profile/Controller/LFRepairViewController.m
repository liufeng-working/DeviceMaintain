//
//  LFRepairViewController.m
//  DeviceMaintain
//
//  Created by 刘丰 on 2018/4/2.
//  Copyright © 2018年 liufeng. All rights reserved.
//

#import "LFRepairViewController.h"
#import "LFHistoryRepairViewModel.h"

@interface LFRepairViewController ()

@property (weak, nonatomic) IBOutlet UIButton *refreshButton;

@property (weak, nonatomic) IBOutlet UILabel *CodeLabel;
@property (weak, nonatomic) IBOutlet UILabel *RecordSourceLabel;
@property (weak, nonatomic) IBOutlet UILabel *ClientNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *FactoryNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *WorkShopNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *RepairDateLabel;
@property (weak, nonatomic) IBOutlet UILabel *ClientCodeLabel;
@property (weak, nonatomic) IBOutlet UILabel *RepairManLabel;
@property (weak, nonatomic) IBOutlet UILabel *ContactWayLabel;
@property (weak, nonatomic) IBOutlet UILabel *OfficeNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *FaultDescriptionLabel;

@property (weak, nonatomic) IBOutlet UIButton *operationButton;

@property(nonatomic, strong) LFHistoryRepairViewModel *repaireViewModel;

@end

@implementation LFRepairViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self loadData];
    
    self.operationButton.hidden = YES;
}

- (IBAction)refreshClick:(UIBarButtonItem *)sender {
    [self loadData];
}

- (IBAction)operationClick:(UIButton *)sender {
    
}

- (void)loadData
{
    [LFNotification manuallyHideWithIndicator];
    [self.repaireViewModel repairDetail:self.repairM.ID success:^(LFRepairDetailModel *detail) {
        [self fillData:detail];
        self.refreshButton.hidden = YES;
    } failure:^{
        self.refreshButton.hidden = NO;
        [LFNotification autoHideWithText:@"请求失败，请重试"];
    }];
}

- (void)fillData:(LFRepairDetailModel *)detail
{
    self.CodeLabel.text = [NSString stringWithFormat:@"%@%@", self.CodeLabel.text, detail.Code];
    self.RecordSourceLabel.text = [NSString stringWithFormat:@"%@%@", self.RecordSourceLabel.text, detail.RecordSourceString];
    self.ClientNameLabel.text = [NSString stringWithFormat:@"%@%@", self.ClientNameLabel.text, detail.ClientName];
    self.FactoryNameLabel.text = [NSString stringWithFormat:@"%@%@", self.FactoryNameLabel.text, detail.FactoryName];
    self.WorkShopNameLabel.text = [NSString stringWithFormat:@"%@%@", self.WorkShopNameLabel.text, detail.WorkShopName];
    self.RepairDateLabel.text = [NSString stringWithFormat:@"%@%@", self.RepairDateLabel.text, detail.RepairDate];
    self.ClientCodeLabel.text = [NSString stringWithFormat:@"%@%@", self.ClientCodeLabel.text, detail.ClientCode];
    self.RepairManLabel.text = [NSString stringWithFormat:@"%@%@", self.RepairManLabel.text, detail.RepairMan];
    self.ContactWayLabel.text = [NSString stringWithFormat:@"%@%@", self.ContactWayLabel.text, detail.ContactWay ?: @"无"];
    self.OfficeNameLabel.text = [NSString stringWithFormat:@"%@%@", self.OfficeNameLabel.text, detail.OfficeName];
    self.FaultDescriptionLabel.text = [NSString stringWithFormat:@"%@%@", self.FaultDescriptionLabel.text, detail.FaultDescription];
}

#pragma mark -
#pragma mark - private私有方法
- (LFHistoryRepairViewModel *)repaireViewModel
{
    if (!_repaireViewModel) {
        _repaireViewModel = [LFHistoryRepairViewModel new];
    }
    return _repaireViewModel;
}

@end


