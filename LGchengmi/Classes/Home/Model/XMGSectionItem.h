//
//  XMGSectionItem.h
//  LGchengmi
//
//  Created by 甘延娇 on 2019/5/28.
//  Copyright © 2019 tencent. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XMGSectionItem : NSObject
/**
 *  headView的颜色
 */
@property (nonatomic, copy) NSString *color;
/**
 *  headView的标题
 */
@property (nonatomic, copy) NSString *tag_name;
/**
 *  headView的子标题
 */
@property (nonatomic, copy) NSString *section_count;
/**
 *  cell模型
 */
@property (nonatomic, strong) NSArray *body;

+ (NSArray *)getSectionItemList;
@end
