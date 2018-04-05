//
//  LFUserViewController.h
//  DeviceMaintain
//
//  Created by 刘丰 on 2018/4/5.
//  Copyright © 2018年 liufeng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LFUserModel.h"

@interface LFUserViewController : UITableViewController

@property(nonatomic, copy) NSString *tid;
@property(nonatomic, copy) NSString *rid;

@property(nonatomic, copy) void(^callback)(NSString *usersID, NSString *name);

@end
