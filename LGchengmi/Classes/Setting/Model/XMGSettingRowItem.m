//
//  XMGSettingRowItem.m
//  LGchengmi
//
//  Created by 甘延娇 on 2019/5/28.
//  Copyright © 2019 tencent. All rights reserved.
//

#import "XMGSettingRowItem.h"

@implementation XMGSettingRowItem

+ (instancetype)itemWithImage:(UIImage *)image title:(NSString *)title
{
   XMGSettingRowItem *item  =  [[self alloc] init];
    item.image = image;
    item.title = title;
    return item;
}
@end
