//
//  XMGRootTool.m
//  LGchengmi
//
//  Created by 甘延娇 on 2019/5/28.
//  Copyright © 2019 tencent. All rights reserved.
//

#import "XMGRootTool.h"
#import "XMGSaveTool.h"
#import "XMGMainViewController.h"
#import "XMGNewFeatureVC.h"
#define kVersion @"curVersion"

@implementation XMGRootTool

+ (UIViewController *)choosRootVC
{
    //获取当前的版本号
    NSString *curV = [NSBundle mainBundle].infoDictionary[@"CFBundleShortVersionString"];
    
    //获取上一次版本
    //从沙盒当中获取上一次的版本
    NSString *preV = [XMGSaveTool objectForKey:kVersion];
    
    //判断当前版本是否与上一次版本相同
    if ([curV isEqualToString:preV]) {
        //如果相同,进入程序的主框架
        XMGMainViewController *mainVC = [[XMGMainViewController alloc] init];
        return mainVC;
    }else {
        //不同,进入到新特性
        XMGNewFeatureVC *newFeatureVC = [[XMGNewFeatureVC alloc] init];
        //保存当前的版本号
        [XMGSaveTool setObject:curV forKey:kVersion];
        return newFeatureVC;
    }
}

@end
