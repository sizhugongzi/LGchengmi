//
//  XqMessageItem.m
//  LGchengmi
//
//  Created by 甘延娇 on 2019/5/28.
//  Copyright © 2019 tencent. All rights reserved.
//

#import "XqDiscoveryItem.h"
#import "MJExtension.h"
@implementation XqDiscoveryItem

//描述数组当中存放的是什么模型
+ (NSDictionary *)objectClassInArray {
    return @{
             @"themes" : @"XqDiscoveryThemeItem"
             };
}

+ (NSArray *)getDiscoveryList
{
    return  [XqDiscoveryItem mj_objectArrayWithFilename:@"message.plist"];
}


@end
