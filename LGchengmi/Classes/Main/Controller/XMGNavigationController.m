//
//  XMGNavigationController.m
//  LGchengmi
//
//  Created by 甘延娇 on 2019/5/28.
//  Copyright © 2019 tencent. All rights reserved.
//

#import "XMGNavigationController.h"
#import "UIImage+image.h"

@interface XMGNavigationController ()

@end

@implementation XMGNavigationController

+ (void)initialize
{
    UINavigationBar *bar = [UINavigationBar appearanceWhenContainedInInstancesOfClasses:@[
                                                                                          [self class]
                                                                                          ]
                                                                            ];
    
    
    [bar setBackgroundImage:[UIImage imageNamed:@"navBg"] forBarMetrics:UIBarMetricsDefault];
    
    NSDictionary *dict= @{
                          NSForegroundColorAttributeName : [UIColor whiteColor],
                          NSFontAttributeName : [UIFont boldSystemFontOfSize:20]
                          };
    
    [bar setTitleTextAttributes:dict];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (self.childViewControllers.count == 0) {
        //viewController是根控制器
        //设置左侧内容
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageOriginalWithName:@"menuIcon"] style:0 target:self action:@selector(menuClick)];
    }else {
        //设置左侧内容
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageOriginalWithName:@"NavBack"] style:0 target:self action:@selector(back)];
    }
    [super pushViewController:viewController animated:animated];
}

- (void)menuClick
{
    //打开抽屉
    //发通知
    [[NSNotificationCenter defaultCenter] postNotificationName:@"OpenDrager" object:nil];
}

- (void)back
{
    [self popViewControllerAnimated:YES];
}

@end
