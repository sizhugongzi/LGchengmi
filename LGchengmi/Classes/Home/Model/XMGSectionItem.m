//
//  XMGSectionItem.m
//  LGchengmi
//
//  Created by 甘延娇 on 2019/5/28.
//  Copyright © 2019 tencent. All rights reserved.
//

#import "XMGSectionItem.h"
#import "MJExtension.h"

@implementation XMGSectionItem


+ (NSDictionary *)objectClassInArray
{
    
    return @{
             @"body" : @"XMGHomeCellItem"
             };
}

+ (NSArray *)getSectionItemList
{
    
    return  [XMGSectionItem mj_objectArrayWithFilename:@"HomeDatas.plist"];
}


//+ (instancetype)homeSectionItemWithDict:(NSDictionary *)dict {
//    
//    XMGSectionItem *item = [[self alloc] init];
//    //将字典转成模型
//    [item setKeyValues:dict];
//    return item;
//}


@end
