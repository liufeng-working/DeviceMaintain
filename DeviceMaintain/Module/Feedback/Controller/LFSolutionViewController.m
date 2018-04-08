//
//  LFSolutionViewController.m
//  DeviceMaintain
//
//  Created by 刘丰 on 2018/4/6.
//  Copyright © 2018年 liufeng. All rights reserved.
//

#import "LFSolutionViewController.h"
#import "LFSolutionCell.h"

static NSString *const identifier = @"LFSolutionCell";
@interface LFSolutionViewController ()<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, LFSolutionCellDelegate>

@property(nonatomic, strong) LFFeedbackViewModel *feedbackViewModel;

@property(nonatomic, strong) NSArray<LFSolutionModel *> *solutions;

@end

@implementation LFSolutionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.collectionView registerNib:[UINib nibWithNibName:identifier bundle:nil] forCellWithReuseIdentifier:identifier];
    
    [LFNotification manuallyHideWithIndicator];
    [self.feedbackViewModel faultSolution:^(NSArray<LFSolutionModel *> *solutions) {
        self.solutions = solutions;
        [self.collectionView reloadData];
    } failure:^{
        [LFNotification autoHideWithText:@"加载失败，请重试"];
    }];
}

#pragma mark <UICollectionViewDataSource>
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.solutions.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    LFSolutionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    cell.contentView.backgroundColor = LF_color_efeff4();
    cell.indexPath = indexPath;
    cell.solutionModel = self.solutions[indexPath.row];
    cell.delegate = self;
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return self.view.bounds.size;
}

- (void)solutionCellDidSelect:(LFSolutionCell *)cell
{
    if (self.callback) {
        self.callback(cell.solutionModel);
        [self.navigationController popViewControllerAnimated:YES];
    }
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

@end
