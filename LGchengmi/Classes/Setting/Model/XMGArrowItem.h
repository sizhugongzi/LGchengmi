//
//  XMGArrowItem.h
//  LGchengmi
//
//  Created by 甘延娇 on 2019/5/28.
//  Copyright © 2019 tencent. All rights reserved.
//

#import "XMGSettingRowItem.h"

@interface XMGArrowItem : XMGSettingRowItem

/**
 *  要跳转控制器的名称
 */
@property (nonatomic, assign) Class desClass;

/**
 *  点击每一行要执行什么任务
 */
@property (nonatomic, copy) void(^desTask)(NSIndexPath *indexPath);

@end
