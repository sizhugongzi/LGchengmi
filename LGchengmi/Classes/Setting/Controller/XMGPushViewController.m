//
//  XMGPushViewController.m
//  LGchengmi
//
//  Created by 甘延娇 on 2019/5/28.
//  Copyright © 2019 tencent. All rights reserved.
//

#import "XMGPushViewController.h"
#import "XMGAwardVC.h"
#import "XMGScoreVC.h"

@interface XMGPushViewController ()


@end

@implementation XMGPushViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
     self.title = @"推送提醒";
    
    [self setUpGroup1];
}

- (void)setUpGroup1
{
    XMGArrowItem *row1 = [XMGArrowItem itemWithImage:[UIImage imageNamed:@"handShake"] title:@"开奖推送"];
    
    //要跳转到的控制器
    row1.desClass = [XMGAwardVC class];
    
    XMGSwitchItem *row2 = [XMGSwitchItem itemWithImage:[UIImage imageNamed:@"handShake"] title:@"比分直播"];
    
    XMGArrowItem *row3 = [XMGArrowItem itemWithImage:[UIImage imageNamed:@"handShake"] title:@"比分直播1"];
    row3.desClass = [XMGScoreVC class];
    
    XMGArrowItem *row4 = [XMGArrowItem itemWithImage:[UIImage imageNamed:@"handShake"] title:@"比分直播2"];
    
    //一组当中有多少行.
    NSArray *array = @[row1,row2,row3,row4];
    
    XMGGroupItem *groupItem =  [XMGGroupItem itemWithRowItemArray:array];
    groupItem.headerT = @"第0组头";
    groupItem.footerT = @"第0组尾部";
    [self.groupArray addObject:groupItem];
}




@end
