//
//  XMGHomeCell.h
//  LGchengmi
//
//  Created by 甘延娇 on 2019/5/28.
//  Copyright © 2019 tencent. All rights reserved.
//

#import <UIKit/UIKit.h>

@class XMGHomeCellItem;
@interface XMGHomeCell : UITableViewCell


+ (instancetype)homeCell;

@property (nonatomic, strong) XMGHomeCellItem *cellItem;


@end
