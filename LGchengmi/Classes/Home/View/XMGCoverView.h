//
//  XMGCoverView.h
//  LGchengmi
//
//  Created by 甘延娇 on 2019/5/28.
//  Copyright © 2019 tencent. All rights reserved.
//

#import <UIKit/UIKit.h>

@class XMGCoverView;
@protocol XMGCoverViewDelegate <NSObject>

- (void)coverViewDidClose:(XMGCoverView *)coverView;

@end

@interface XMGCoverView : UIView


@property (nonatomic , weak) id<XMGCoverViewDelegate> delegate;

/**
 *  弹出一个遮盖
 */
+ (instancetype)show;

@end
