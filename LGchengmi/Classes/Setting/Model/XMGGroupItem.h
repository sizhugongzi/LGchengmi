//
//  XMGGroupItem.h
//  LGchengmi
//
//  Created by 甘延娇 on 2019/5/28.
//  Copyright © 2019 tencent. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XMGGroupItem : NSObject

/**
 *  头部标题
 */
@property (nonatomic, copy) NSString *headerT;
/**
 *  尾部标题
 */
@property (nonatomic, copy) NSString *footerT;

/**
 *  每一组当中有多少行.放的都是行模型
 */
@property (nonatomic, strong) NSArray *rowItemArray;
+ (instancetype)itemWithRowItemArray:(NSArray *)rowItemArray;

@end
