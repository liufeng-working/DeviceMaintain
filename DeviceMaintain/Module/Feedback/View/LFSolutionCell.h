//
//  LFSolutionCell.h
//  DeviceMaintain
//
//  Created by 刘丰 on 2018/4/6.
//  Copyright © 2018年 liufeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol LFSolutionCellDelegate;
@class LFSolutionModel;
@interface LFSolutionCell : UICollectionViewCell

@property(nonatomic, strong) LFSolutionModel *solutionModel;

@property(nonatomic, strong) NSIndexPath *indexPath;

@property(nonatomic,weak) id<LFSolutionCellDelegate> delegate;

@end

@protocol LFSolutionCellDelegate <NSObject>

@optional
- (void)solutionCellDidSelect:(LFSolutionCell *)cell;

@end
