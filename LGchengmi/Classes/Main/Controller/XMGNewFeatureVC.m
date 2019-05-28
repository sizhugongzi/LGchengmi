//
//  XMGNewFeatureVC.m
//  LGchengmi
//
//  Created by 甘延娇 on 2019/5/28.
//  Copyright © 2019 tencent. All rights reserved.
//

#import "XMGNewFeatureVC.h"
#import "XMGMainViewController.h"

@interface XMGNewFeatureVC ()

@end

@implementation XMGNewFeatureVC

//自定义控制器View
- (void)loadView
{
    UIImageView *imageV = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"guide"]];
    imageV.userInteractionEnabled = YES;
    self.view = imageV;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setImage:[UIImage imageNamed:@"startIcon"] forState:UIControlStateNormal];
    
    btn.bounds = CGRectMake(0, 0, 150, 50);
    btn.center = CGPointMake(kScreenW * 0.5, kScreenH * 0.8);
    
    [self.view addSubview:btn];
    
    [btn addTarget:self action:@selector(startBtnClick) forControlEvents:UIControlEventTouchUpInside];
}

/**
 *  开始按钮点击
 */
- (void)startBtnClick
{
    //跳转以程序的主框架
    //modal出来的控制器是被当前控制器的self.presentedViewController强引用.
    XMGMainViewController *mainVC = [[XMGMainViewController alloc] init];
    //[self presentViewController:mainVC animated:NO completion:nil];
    [UIApplication sharedApplication].keyWindow.rootViewController = mainVC;
}

- (void)dealloc
{
    NSLog(@"%s",__func__);
}


@end
