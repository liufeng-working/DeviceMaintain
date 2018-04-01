//
//  LFUrl.h
//  DeviceMaintain
//
//  Created by 刘丰 on 2018/4/1.
//  Copyright © 2018年 liufeng. All rights reserved.
//

#ifndef LFUrl_h
#define LFUrl_h

// 登录
#define LFLoginUrl LF_appendUrl(/api/User)

// 历史维修
#define LFHistoryRepairUrl LF_appendUrl(/api/RepairOrder/GetRepairOrderListAll)

#define LF_appendUrl(path) [NSString stringWithFormat:@"http://%@%@", LFLoginTool.getIP, @#path]

#endif /* LFUrl_h */
