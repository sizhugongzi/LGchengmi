//
//  UIView+frame.h
//  LGchengmi
//
//  Created by 甘延娇 on 2019/5/28.
//  Copyright © 2019 tencent. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (frame)


//一般情况下, 在分类当中不能直接添加属性
//如果说非得要添加属性,必须得要实现该属性的set与get方法
//如果自己不去实现,可以使用@dynamic加属性名称,让它自己生成.


//在分类当中添加的属性,不会生成还有下划线的成员属性.
//会声明该属性的set与get方法

@property (assign, nonatomic) CGFloat x;
@property (assign, nonatomic) CGFloat y;
@property (assign, nonatomic) CGFloat width;
@property (assign, nonatomic) CGFloat height;

@end
 
