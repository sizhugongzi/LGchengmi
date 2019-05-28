//
//  XMGTabBarController.m
//  LGchengmi
//
//  Created by 甘延娇 on 2019/5/28.
//  Copyright © 2019 tencent. All rights reserved.
//

#import "XMGTabBarController.h"
#import "XMGNavigationController.h"

@interface XMGTabBarController ()

@end

@implementation XMGTabBarController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.tabBar.hidden = YES;
    NSArray *childClassName = @[@"XMGHomeViewController",
                                @"XMGDiscoveryVC",
                                @"XMGMessageVC",
                                @"XMGSettingVC",
                                ];
    
    for (NSString *className in childClassName) {
        //把字符串转成类名,创建类
        UIViewController *vc = [[NSClassFromString(className) alloc] init];
        
        //创建导航控制器
        XMGNavigationController *nav = [[XMGNavigationController alloc] initWithRootViewController:vc];
        
        //添加控制器
        [self addChildViewController:nav];
    }
}

@end
