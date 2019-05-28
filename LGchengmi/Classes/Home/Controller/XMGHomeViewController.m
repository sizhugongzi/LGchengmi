//
//  XMGHomeViewController.m
//  LGchengmi
//
//  Created by 甘延娇 on 2019/5/28.
//  Copyright © 2019 tencent. All rights reserved.
//

#import "XMGHomeViewController.h"
#import "XMGSectionItem.h"
#import "XMGHomeCell.h"
#import "XMGHomeCellItem.h"
#import "XMGSectionView.h"
#import "XMGHomeDeatilVC.h"

@interface XMGHomeViewController ()

@property (nonatomic , strong) NSArray *dataArray;

@end

@implementation XMGHomeViewController

- (NSArray *)dataArray {
    
    if (_dataArray == nil) {
        _dataArray = [XMGSectionItem getSectionItemList];
    }
    return _dataArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"首页";
    self.tableView.backgroundColor = [UIColor grayColor];
    
    //监听城市改变通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(cityChange:) name:@"cityChange" object:nil];
}

- (void)cityChange:(NSNotification *)notice
{
    //设置右侧的内容
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:notice.object style:0 target:nil action:nil];
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.dataArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //获取组模型
    XMGSectionItem *item = self.dataArray[section];
    return item.body.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    XMGHomeCell *cell = [tableView dequeueReusableCellWithIdentifier:@"homeCellID"];
    if (cell == nil) {
        cell = [XMGHomeCell homeCell];
        cell.backgroundColor = [UIColor clearColor];
    }
    
    //获取组模型
    XMGSectionItem *item = self.dataArray[indexPath.section];
    XMGHomeCellItem *cellItem = item.body[indexPath.row];
    //把模型传给View
    cell.cellItem = cellItem;
    
    return cell;
}

//必须得要指定高度
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    XMGSectionView *secView = [XMGSectionView sectionView];
    //获取组模型
    XMGSectionItem *item = self.dataArray[section];
    secView.secItem  = item;
    return secView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 50;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 161;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    XMGHomeDeatilVC *detailVC = [[XMGHomeDeatilVC alloc] init];
    [self.navigationController pushViewController:detailVC animated:YES];
    
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
