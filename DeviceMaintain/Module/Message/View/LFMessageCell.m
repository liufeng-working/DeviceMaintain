//
//  LFMessageCell.m
//  DeviceMaintain
//
//  Created by 刘丰 on 2018/4/2.
//  Copyright © 2018年 liufeng. All rights reserved.
//

#import "LFMessageCell.h"
#import "LFMessageModel.h"

@interface LFMessageCell ()

@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UILabel *contentLabel;

@end

@implementation LFMessageCell

LFCell_implementation(messageCell, LFMessageCell);

- (void)setMessageModel:(LFMessageModel *)messageModel
{
    _messageModel = messageModel;
    
    self.iconImageView.image = [UIImage imageNamed:messageModel.Status ? @"ic_new_read" : @"ic_new_unread"];
    self.titleLabel.text = messageModel.MessageTypeString;
    self.dateLabel.text = messageModel.CreateTime;
    self.contentLabel.text = messageModel.Content;
}
@end
