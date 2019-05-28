//
//  XMGSaveTool.h
//  LGchengmi
//
//  Created by 甘延娇 on 2019/5/28.
//  Copyright © 2019 tencent. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XMGSaveTool : NSObject

//存
+ (void)setObject:(id)value forKey:(NSString *)defaultName;

//取
+ (id)objectForKey:(NSString *)defaultName;

@end
