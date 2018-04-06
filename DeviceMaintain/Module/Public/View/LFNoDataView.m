//
//  LFNoDataView.m
//  DeviceMaintain
//
//  Created by 刘丰 on 2018/4/6.
//  Copyright © 2018年 liufeng. All rights reserved.
//

#import "LFNoDataView.h"

@interface LFNoDataView ()

@property (weak, nonatomic) IBOutlet UIView *propmtView;

@end

@implementation LFNoDataView

+ (instancetype)noDataView
{
    return [[NSBundle mainBundle] loadNibNamed:@"LFNoDataView" owner:nil options:nil].firstObject;
}

- (void)show
{
    self.propmtView.hidden = NO;
}

- (void)hide
{
    self.propmtView.hidden = YES;
}

@end
