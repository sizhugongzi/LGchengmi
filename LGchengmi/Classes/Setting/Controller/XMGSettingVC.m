//
//  XMGSettingVC.m
//  LGchengmi
//
//  Created by 甘延娇 on 2019/5/28.
//  Copyright © 2019 tencent. All rights reserved.
//

#import "XMGSettingVC.h"


#import "XMGPushViewController.h"
#import "XMGTestViewController.h"
#import "XMGChooseVC.h"


@interface XMGSettingVC ()


@end

@implementation XMGSettingVC


- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"设置";
    
    [self setUpGroup1];
    [self setUpGroup2];
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    
    UIView *footV = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 44)];
    
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.backgroundColor = [UIColor blueColor];
    [btn setTitle:@"退出登录" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    btn.x = 10;
    btn.width = kScreenW - 2 * btn.x;
    btn.height = 44;
    btn.layer.cornerRadius = 8;
    [footV addSubview:btn];
    
    self.tableView.tableFooterView = footV;
    
}

//描述一组
- (void)setUpGroup1 {
    
    XMGArrowItem *row1 = [XMGArrowItem itemWithImage:[UIImage imageNamed:@"handShake"] title:@"个人中心"];
    
    //要跳转到的控制器
    row1.desClass = [XMGPushViewController class];
    
    XMGArrowItem *row2 = [XMGArrowItem itemWithImage:nil title:@"进入选择"];
    row2.desClass = [XMGChooseVC class];
   
    XMGSwitchItem *row3 = [XMGSwitchItem itemWithImage:nil title:@"推送"];


    
    //一组当中有多少行.
    NSArray *array = @[row1,row2,row3];
    
    XMGGroupItem *groupItem =  [XMGGroupItem itemWithRowItemArray:array];
    groupItem.headerT = @"关联账号";
   
    [self.groupArray addObject:groupItem];

}

//描述一组
- (void)setUpGroup2 {
    XMGArrowItem *row1 = [XMGArrowItem itemWithImage:nil title:@"反馈好评"];
    XMGArrowItem *row2 = [XMGArrowItem itemWithImage:nil title:@"清理缓存"];
    
    //一组当中有多少行.
    NSArray *array = @[row1,row2];
    XMGGroupItem *groupItem =  [XMGGroupItem itemWithRowItemArray:array];
    [self.groupArray addObject:groupItem];
    
}





@end
