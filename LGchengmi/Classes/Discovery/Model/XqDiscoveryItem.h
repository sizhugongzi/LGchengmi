//
//  XqMessageItem.h
//  LGchengmi
//
//  Created by 甘延娇 on 2019/5/28.
//  Copyright © 2019 tencent. All rights reserved.
//

#import <Foundation/Foundation.h>

@class XqDiscoveryHeaderItem;
@interface XqDiscoveryItem : NSObject

@property (nonatomic, strong) XqDiscoveryHeaderItem *header;
//头部
@property (nonatomic, strong) NSArray *themes;

+ (NSArray *)getDiscoveryList;


@end
