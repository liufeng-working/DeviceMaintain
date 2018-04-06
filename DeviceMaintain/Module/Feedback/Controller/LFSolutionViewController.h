//
//  LFSolutionViewController.h
//  DeviceMaintain
//
//  Created by 刘丰 on 2018/4/6.
//  Copyright © 2018年 liufeng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LFFeedbackViewModel.h"

@interface LFSolutionViewController : UICollectionViewController

@property(nonatomic, copy) void(^callback)(LFSolutionModel *solutionModel);

@end
