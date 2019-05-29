//
//  XMGScoreVC.m
//  LGchengmi
//
//  Created by 甘延娇 on 2019/5/28.
//  Copyright © 2019 tencent. All rights reserved.
//

#import "XMGScoreVC.h"

@interface XMGScoreVC ()

@property (nonatomic, assign) int a;

@end

@implementation XMGScoreVC

- (void)viewDidLoad
{
    [super viewDidLoad];
   
    //设置数据
    [self setUpGroup1];
    [self setUpGroup2];
    [self setUpGroup2];
    [self setUpGroup2];
    [self setUpGroup2];
    [self setUpGroup2];
    [self setUpGroup2];
    _a = 10;
}


//描述一组
- (void)setUpGroup1
{
    XMGSwitchItem *row1 = [XMGSwitchItem itemWithImage:[UIImage imageNamed:@"handShake"] title:@"使用兑换码"];
    //一组当中有多少行.
    NSArray *array = @[row1];
    XMGGroupItem *groupItem =  [XMGGroupItem itemWithRowItemArray:array];
    [self.groupArray addObject:groupItem];
}

//描述一组
- (void)setUpGroup2
{
    XMGArrowItem *row1 = [XMGArrowItem itemWithImage:[UIImage imageNamed:@"handShake"] title:@"使用兑换码"];
    row1.subTitle = @"23:00";
    
    //Block会对代码块当中的强指针进行强引用.
    //__weak XMGScoreVC *weakSelf = self;
    __weak typeof(self)weakSelf  = self;
    
    row1.desTask = ^(NSIndexPath *indexPath){
        
        //弹出键盘
        UITextField *textF = [[UITextField alloc] init];
        [textF becomeFirstResponder];
        //添加到另一个View上.(当前点击的cell);
        //获取当前点击的cell
        UITableViewCell *cell = [weakSelf.tableView cellForRowAtIndexPath:indexPath];
        [cell addSubview:textF];
    
    };
    //一组当中有多少行.
    NSArray *array = @[row1];
    XMGGroupItem *groupItem =  [XMGGroupItem itemWithRowItemArray:array];
    [self.groupArray addObject:groupItem];
}

//展示什么内容
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //1.创建Cell.
    XMGSettingCell *cell = [XMGSettingCell cellWithTableView:tableView style:UITableViewCellStyleValue1];
    //2.取出数据.
    XMGGroupItem *groupItem = self.groupArray[indexPath.section];
    XMGSettingRowItem *rowItem =  groupItem.rowItemArray[indexPath.row];
    //3.把数据传给Cell,让Cell负责显示.
    cell.rowItem = rowItem;
    return cell;
}

- (void)dealloc
{
    NSLog(@"%s",__func__);
}

@end
