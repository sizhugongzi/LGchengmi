//
//  XqMessageThemeItem.h
//  LGchengmi
//
//  Created by 甘延娇 on 2019/5/28.
//  Copyright © 2019 tencent. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XqDiscoveryThemeItem : NSObject

//开始时间
@property (nonatomic, copy) NSString *begin_time;
//图片
@property (nonatomic, copy) NSString *img;
//关键字
@property (nonatomic, copy) NSString *keywords;
//描述
@property (nonatomic, copy) NSString *text;
//分享地址
@property (nonatomic, copy) NSString *themeurl;
//标题
@property (nonatomic, copy) NSString *title;

@end
