//
//  LFUserCell.h
//  DeviceMaintain
//
//  Created by 刘丰 on 2018/4/5.
//  Copyright © 2018年 liufeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LFUserModel;
@interface LFUserCell : UITableViewCell

LFCell_interface(user);

@property(nonatomic, strong) LFUserModel *userModel;

@end
