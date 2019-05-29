//
//  XMGLeftView.m
//  LGchengmi
//
//  Created by 甘延娇 on 2019/5/28.
//  Copyright © 2019 tencent. All rights reserved.
//

#import "XMGLeftView.h"
#import "XMGMenuBtn.h"
#import "XMGCityBtn.h"
#import "XMGCityCell.h"

@interface XMGLeftView ()<UITableViewDataSource,UITableViewDelegate>

/**
 *   上一个选中的按钮
 */
@property (weak, nonatomic) IBOutlet XMGMenuBtn *preSelectBtn;
/**
 *  城市按钮
 */
@property (weak, nonatomic) IBOutlet XMGCityBtn *cityBtn;
/**
 *  城市列表tableView
 */
@property (weak, nonatomic) UITableView *tableView;
/**
 *  记录当前城市为打开还是关闭
 */
@property (assign, nonatomic) BOOL isOpen;
@property (strong, nonatomic) NSArray *cityArray;

@end

@implementation XMGLeftView

- (NSArray *)cityArray
{
    if (_cityArray == nil) {
        _cityArray = @[@"北京",@"上海",@"广州",@"南京",@"杭州"];
    }
    return _cityArray;
}

- (UITableView *)tableView
{
    if (_tableView == nil) {
        
        UITableView *talbeView = [[UITableView alloc] init];
        talbeView.x = self.cityBtn.x;
        talbeView.y = CGRectGetMaxY(self.cityBtn.frame);
        talbeView.width = self.cityBtn.width;
        talbeView.backgroundColor = [UIColor blackColor];
        talbeView.alpha = 0.9;
        talbeView.layer.cornerRadius = 8;
        
        //talbeView.separatorInset = UIEdgeInsetsMake(0, 0, 0, 15);
        
        //设置数据源
        talbeView.dataSource = self;
        //设置代理
        talbeView.delegate = self;
        
        [self addSubview:talbeView];
        _tableView = talbeView;
    }
    return _tableView;
}

+ (instancetype)leftView
{
    return  [[NSBundle mainBundle] loadNibNamed:@"XMGLeftView" owner:nil options:nil][0];
}

/**
 *  菜单按钮点击
 *
 *  @param btn 当前点击的按钮
 */
- (IBAction)menuClick:(XMGMenuBtn *)btn
{
    //3.调用代理方法
    if ([self.delegate respondsToSelector:@selector(leftView:curBtnIndex:preBtnIndex:)]) {
        [self.delegate leftView:self curBtnIndex:btn.tag preBtnIndex:self.preSelectBtn.tag];
    }
    
    //1.取消上一个选中状态
    self.preSelectBtn.selected = NO;
    //2.当前点击的按钮成为选中状态
    btn.selected = YES;
    //3.当前点击的按钮成为上一个选中状态按钮
    self.preSelectBtn = btn;
}

- (IBAction)cityClick:(id)sender
{
    if (self.isOpen) {
        //城市列表
        self.tableView.height = 0;
    }else {
        self.tableView.height = 170;
    }
    self.isOpen = !self.isOpen;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.cityArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    //创建Cell
    XMGCityCell *cell = [XMGCityCell cellWithTableView:tableView];
    //获取数据
    NSString *city = self.cityArray[indexPath.row];
    
    //让Cell数据
    cell.textLabel.text = city;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //取出当前选中的城市
    NSString *city = self.cityArray[indexPath.row];
    [self.cityBtn setTitle:city forState:UIControlStateNormal];
    
    if ([self.delegate respondsToSelector:@selector(leftViewDidClickCity:)]) {
        [self.delegate leftViewDidClickCity:self];
    }
    
    //关闭城市列表
    [self cityClick:self.cityBtn];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"cityChange" object:city];
}
@end
