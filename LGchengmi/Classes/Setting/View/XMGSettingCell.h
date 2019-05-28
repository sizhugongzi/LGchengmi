//
//  XMGSettingCell.h
//  LGchengmi
//
//  Created by 甘延娇 on 2019/5/28.
//  Copyright © 2019 tencent. All rights reserved.
//

#import <UIKit/UIKit.h>

@class XMGSettingRowItem;
@interface XMGSettingCell : UITableViewCell


+ (instancetype)cellWithTableView:(UITableView *)tableView style:(UITableViewCellStyle)style;


@property (nonatomic, strong)XMGSettingRowItem *rowItem;

@end
