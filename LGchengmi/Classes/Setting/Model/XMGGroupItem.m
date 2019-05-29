//
//  XMGGroupItem.m
//  LGchengmi
//
//  Created by 甘延娇 on 2019/5/28.
//  Copyright © 2019 tencent. All rights reserved.
//

#import "XMGGroupItem.h"

@implementation XMGGroupItem

+ (instancetype)itemWithRowItemArray:(NSArray *)rowItemArray
{
    XMGGroupItem *groupItem = [[self alloc] init];
    groupItem.rowItemArray = rowItemArray;
    return groupItem;
}

@end
