//
//  XMGMainViewController.m
//  LGchengmi
//
//  Created by 甘延娇 on 2019/5/28.
//  Copyright © 2019 tencent. All rights reserved.
//
#import "XMGMainViewController.h"
#import "XMGLeftView.h"
#import "XMGTabBarController.h"

@interface XMGMainViewController ()<XMGLeftViewDelegate>

@property (strong, nonatomic) XMGTabBarController *tabbarVC;

@end

@implementation XMGMainViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //添加左侧View
    [self addLeftView];
    //添加中间控制器
    [self addChildVC];
    //监听通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(openDrager) name:@"OpenDrager" object:nil];
}

/**
 *  添加左侧View
 */
- (void)addLeftView
{
    XMGLeftView *leftView = [XMGLeftView leftView];
    leftView.frame = self.leftV.bounds;
    leftView.delegate = self;
    [self.leftV addSubview:leftView];
}

/**
 *  添加中间控制器
 */
- (void)addChildVC
{
    XMGTabBarController *tabbarVC = [[XMGTabBarController alloc] init];
    self.tabbarVC = tabbarVC;
    tabbarVC.view.frame = self.mainV.bounds;
    [self.mainV addSubview:tabbarVC.view];
}

/**
 *  当接收到打开抽屉通知时调用
 */
- (void)openDrager
{
    [self open];
}

#pragma -mark XMGLeftView代理方法
//切换控制器
- (void)leftView:(XMGLeftView *)leftView curBtnIndex:(NSInteger)curIndex preBtnIndex:(NSInteger)preBtnIndex
{
    //切换tabBarVc的子控制器
    self.tabbarVC.selectedIndex = curIndex;
    //关闭抽屉
    [self close];
}

/**
 *  选择了城市
 */
- (void)leftViewDidClickCity:(XMGLeftView *)leftView
{
    [self close];
}

- (void)dealloc
{
    //移除通知
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end

