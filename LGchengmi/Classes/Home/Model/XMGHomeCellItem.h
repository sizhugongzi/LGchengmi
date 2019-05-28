//
//  XMGHomeCellItem.h
//  LGchengmi
//
//  Created by 甘延娇 on 2019/5/28.
//  Copyright © 2019 tencent. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XMGHomeCellItem : NSObject

/**
 *  标题
 */
@property (nonatomic, copy) NSString *section_title;
/**
 *  图片地址
 */
@property (nonatomic, copy) NSString *imageURL;
/**
 *  浏览次数
 */
@property (nonatomic, copy) NSString *fav_count;
/**
 *  底部名称
 */
@property (nonatomic, copy) NSString *poi_name;


@end
