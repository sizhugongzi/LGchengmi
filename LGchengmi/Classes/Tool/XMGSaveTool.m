//
//  XMGSaveTool.m
//  LGchengmi
//
//  Created by 甘延娇 on 2019/5/28.
//  Copyright © 2019 tencent. All rights reserved.
//

#import "XMGSaveTool.h"

@implementation XMGSaveTool

//存
+ (void)setObject:(id)value forKey:(NSString *)defaultName
{
    [[NSUserDefaults standardUserDefaults] setValue:value forKey:defaultName];
}

//取
+ (id)objectForKey:(NSString *)defaultName
{
    return  [[NSUserDefaults standardUserDefaults] objectForKey:defaultName];
}

@end
