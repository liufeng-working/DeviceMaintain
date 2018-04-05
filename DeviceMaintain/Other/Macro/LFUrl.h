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

// 维修
#define LFRepairUrl LF_appendUrl(/api/RepairOrder/GetRepairOrderListAll)

// 维修详情
#define LFRepairDetailUrl LF_appendUrl(/api/RepairOrder/GetRepairOrderDetail)

// 消息
#define LFMessageUrl LF_appendUrl(/api/Msg/GetUserMsgList)

// 消息详情
#define LFMessageDetailUrl LF_appendUrl(/api/Msg/GetMsgDetail)

// 获取报修单号
#define LFGetRepairCodeUrl LF_appendUrl(/api/CodeRule/GetRepairCode)

// 获取设备列表
#define LFGetDeviceUrl LF_appendUrl(/api/Device/GetGridJson)

// 获取设备列表
#define LFGetUserUrl LF_appendUrl(/api/ClientUser/GetClientUserOnlyJson)

// 获取设备列表
#define LFSubmitUrl LF_appendUrl(/api/RepairOrder/SubmitRepairOrder)

#define LF_appendUrl(path) [NSString stringWithFormat:@"http://%@%@", LFLoginTool.getIP, @#path]

#endif /* LFUrl_h */
