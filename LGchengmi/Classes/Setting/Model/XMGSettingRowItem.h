//
//  XMGSettingRowItem.h
//  LGchengmi
//
//  Created by 甘延娇 on 2019/5/28.
//  Copyright © 2019 tencent. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface XMGSettingRowItem : NSObject

//图片
@property (nonatomic, strong) UIImage *image;
//标题
@property (nonatomic, strong) NSString *title;

//子标题
@property (nonatomic, strong) NSString *subTitle;



+ (instancetype)itemWithImage:(UIImage *)image title:(NSString *)title;

@end
