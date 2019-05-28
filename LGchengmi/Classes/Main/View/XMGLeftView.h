//
//  XMGLeftView.h
//  LGchengmi
//
//  Created by 甘延娇 on 2019/5/28.
//  Copyright © 2019 tencent. All rights reserved.
//

#import <UIKit/UIKit.h>

//1.定义协议
@class XMGLeftView;
@protocol XMGLeftViewDelegate <NSObject>

- (void)leftView:(XMGLeftView *)leftView curBtnIndex:(NSInteger)curIndex preBtnIndex:(NSInteger)preBtnIndex;
- (void)leftViewDidClickCity:(XMGLeftView *)leftView;

@end

//3.调用代理方法

@interface XMGLeftView : UIView

+ (instancetype)leftView;

//2.定义代理属性
@property (weak, nonatomic) id<XMGLeftViewDelegate> delegate;

@end

