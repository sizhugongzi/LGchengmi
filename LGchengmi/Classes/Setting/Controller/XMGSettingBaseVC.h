//
//  XMGSettingBaseVC.h
//  LGchengmi
//
//  Created by 甘延娇 on 2019/5/28.
//  Copyright © 2019 tencent. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XMGSettingRowItem.h"
#import "XMGGroupItem.h"
#import "XMGArrowItem.h"
#import "XMGSwitchItem.h"
#import "XMGSettingCell.h"

@interface XMGSettingBaseVC : UITableViewController

/**
 *  共有多少组
 */
@property (nonatomic, strong) NSMutableArray *groupArray;


@end
