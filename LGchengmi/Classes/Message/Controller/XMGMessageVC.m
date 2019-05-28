//
//  XMGMessageVC.m
//  LGchengmi
//
//  Created by 甘延娇 on 2019/5/28.
//  Copyright © 2019 tencent. All rights reserved.
//

#import "XMGMessageVC.h"

@interface XMGMessageVC ()

@property (weak, nonatomic) UIView *nearView;

@end

@implementation XMGMessageVC

- (UIView *)nearView
{
    if (_nearView == nil) {
        
        UIView *nearVeiw = [[UIView alloc] initWithFrame:self.view.bounds];
        
        UIImageView *bg = [[UIImageView alloc] initWithFrame:nearVeiw.bounds];
        bg.image = [UIImage imageNamed:@"wnxBG"];
        [nearVeiw addSubview:bg];
        
        //在tableViewController中self.view就是tableView.
        [self.view addSubview:nearVeiw];
        
        _nearView = nearVeiw;
    }
    return _nearView;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"消息";
    self.view.backgroundColor = [UIColor whiteColor];
    
    UISegmentedControl *segV = [[UISegmentedControl alloc] initWithItems:@[@"推荐",@"附近"]];
    segV.tintColor = [UIColor colorWithRed:20 / 255.0 green:149 / 255.0 blue:128 / 255.0 alpha:1];
    //设置宽度
    segV.width = kScreenW * 0.5;
    
    //设置默认选中第0个
    segV.selectedSegmentIndex = 0;
    
    //设置字体颜色
    [segV setTitleTextAttributes:@{ NSForegroundColorAttributeName : [UIColor whiteColor] } forState:UIControlStateNormal];
    
    //监听点击
    [segV addTarget:self action:@selector(change:) forControlEvents:UIControlEventValueChanged];
    
    self.navigationItem.titleView = segV;
    
}

//UISegmentedControl改变时调用
- (void)change:(UISegmentedControl *)segV
{
    NSString *subType = nil;
    if (segV.selectedSegmentIndex == 1) {
        self.nearView.hidden = NO;
        subType = @"fromLeft";
    }else {
        self.nearView.hidden = YES;
        subType = @"fromRight";
    }
    
    //添加动画
    //在View上添加核心动画,要去添加给它的父控件.
    CATransition *anim = [CATransition animation];
    anim.type = @"oglFlip";
    anim.duration = 0.5;
    anim.subtype = subType;
    [self.view.layer addAnimation:anim forKey:@"anim"];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"cityCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:ID];
    }
    
    cell.textLabel.text = @"xmg";
    return cell;
}

@end
