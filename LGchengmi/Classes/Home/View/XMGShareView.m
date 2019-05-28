//
//  XMGShareView.m
//  LGchengmi
//
//  Created by 甘延娇 on 2019/5/28.
//  Copyright © 2019 tencent. All rights reserved.
//

#import "XMGShareView.h"
#import "XMGCoverView.h"

@implementation XMGShareView

+ (instancetype)shareView
{
    XMGShareView *shareView = [[NSBundle mainBundle] loadNibNamed:@"XMGShareView" owner:nil options:nil][0];
    
    CGRect frame = shareView.frame;
    frame.size.width = [UIScreen mainScreen].bounds.size.width;
    frame.origin.y = [UIScreen mainScreen].bounds.size.height;
    shareView.frame = frame;
    [[UIApplication sharedApplication].keyWindow addSubview:shareView];
    [UIView animateWithDuration:0.25 animations:^{
        
        CGRect frame = shareView.frame;
        frame.origin.y = [UIScreen mainScreen].bounds.size.height - frame.size.height;
        shareView.frame = frame;
    }];
    return shareView;
}

- (void)hiddenShareView
{
    [UIView animateWithDuration:0.25 animations:^{
        
        CGRect frame = self.frame;
        frame.origin.y = [UIScreen mainScreen].bounds.size.height;
        self.frame = frame;

    }completion:^(BOOL finished) {
        
        [self removeFromSuperview];
        
        for (UIView *view in [UIApplication sharedApplication].keyWindow.subviews) {
            //判断是否为遮盖
            if ([view isKindOfClass:[XMGCoverView class]]) {
                [view removeFromSuperview];
            }
        }
    }];
}

@end
