//
//  XMGAwardVC.m
//  LGchengmi
//
//  Created by 甘延娇 on 2019/5/28.
//  Copyright © 2019 tencent. All rights reserved.
//

#import "XMGAwardVC.h"

@interface XMGAwardVC ()

@end

@implementation XMGAwardVC



- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUpGroup1];
}


//描述一组
- (void)setUpGroup1 {

    XMGSwitchItem *row1 = [XMGSwitchItem itemWithImage:[UIImage imageNamed:@"handShake"] title:@"使用兑换码"];
    row1.subTitle = @"每周,二,四,日开奖";
    XMGSwitchItem *row2 = [XMGSwitchItem itemWithImage:[UIImage imageNamed:@"handShake"] title:@"优惠"];

    //一组当中有多少行.
    NSArray *array = @[row1,row2];
    XMGGroupItem *groupItem =  [XMGGroupItem itemWithRowItemArray:array];
    [self.groupArray addObject:groupItem];
    
}




@end
