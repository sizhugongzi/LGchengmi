//
//  XMGCoverView.m
//  LGchengmi
//
//  Created by 甘延娇 on 2019/5/28.
//  Copyright © 2019 tencent. All rights reserved.
//

#import "XMGCoverView.h"

@implementation XMGCoverView

+ (instancetype)show
{
    //创建View,添加到窗口上面
    XMGCoverView *cover = [[self alloc] init];
    cover.frame = [UIScreen mainScreen].bounds;
    cover.backgroundColor = [UIColor blackColor];
    cover.alpha = 0.3;
    
    [[UIApplication sharedApplication].keyWindow addSubview:cover];
    
    return cover;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    //通知外界
    if ([self.delegate respondsToSelector:@selector(coverViewDidClose:)]) {
        [self.delegate coverViewDidClose:self];
    }
}

@end
