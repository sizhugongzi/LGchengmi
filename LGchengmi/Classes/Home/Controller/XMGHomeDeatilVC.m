//
//  XMGHomeDeatilVC.m
//  LGchengmi
//
//  Created by 甘延娇 on 2019/5/28.
//  Copyright © 2019 tencent. All rights reserved.
//

#import "XMGHomeDeatilVC.h"
#import "UIImage+image.h"
#import "XMGCoverView.h"
#import "XMGShareView.h"

@interface XMGHomeDeatilVC ()<XMGCoverViewDelegate>

@property (nonatomic, weak)XMGShareView *shareView;

@end

@implementation XMGHomeDeatilVC

- (void)viewDidLoad
{
    [super viewDidLoad];
        
    //设置右侧内容
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageOriginalWithName:@"share"] style:0 target:self action:@selector(shareClick)];
}

/**
 *  点击左侧分享按钮
 */
- (void)shareClick
{
    //弹出遮盖
    XMGCoverView *cover = [XMGCoverView show];
    cover.delegate = self;
    
    //弹出分享View
    self.shareView =  [XMGShareView shareView];
}

//关闭遮盖时调用
- (void)coverViewDidClose:(XMGCoverView *)coverView
{
    [self.shareView  hiddenShareView];
}


@end
