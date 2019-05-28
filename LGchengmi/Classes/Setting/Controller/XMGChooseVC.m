//
//  XMGChooseVC.m
//  LGchengmi
//
//  Created by 甘延娇 on 2019/5/28.
//  Copyright © 2019 tencent. All rights reserved.
//

#import "XMGChooseVC.h"
#import "XMGChooseCell.h"

@interface XMGChooseVC ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

//记录当前点击的是哪一行
@property (nonatomic,assign) NSInteger curRow;

@property (nonatomic,assign) BOOL isOpen;

@end

@implementation XMGChooseVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    self.curRow = -1;
    

    
}





//每一组有多少行
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

//展示什么内容
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    XMGChooseCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ChooseCell"];
    if (cell == nil) {
        cell = [[NSBundle mainBundle] loadNibNamed:@"XMGChooseCell" owner:nil options:nil][0];
    }
    
    return  cell;
}


//点击一行
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    self.isOpen = !self.isOpen;
    
    if (self.curRow != indexPath.row) {
        self.isOpen = YES;
    }
    self.curRow = indexPath.row;
    
    //更新数据(当更新tableView时会自动加一个序列帧动画)
    [tableView beginUpdates];
    [tableView endUpdates];
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return self.curRow == indexPath.row && self.isOpen ? 230 : 44;
}




@end
