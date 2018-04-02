//
//  LFMessageCell.h
//  DeviceMaintain
//
//  Created by 刘丰 on 2018/4/2.
//  Copyright © 2018年 liufeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LFMessageModel;
@interface LFMessageCell : UITableViewCell

LFCell_interface(messageCell);

@property(nonatomic, strong) LFMessageModel *messageModel;

@end
