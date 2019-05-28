//
//  XMGSettingBaseVC.m
//  LGchengmi
//
//  Created by 甘延娇 on 2019/5/28.
//  Copyright © 2019 tencent. All rights reserved.
//

#import "XMGSettingBaseVC.h"


@interface XMGSettingBaseVC ()

@end

@implementation XMGSettingBaseVC



- (NSMutableArray *)groupArray {
    
    if (_groupArray == nil) {
        _groupArray = [NSMutableArray array];
    }
    return _groupArray;
}

- (instancetype)init {
    
    return [super initWithStyle:UITableViewStyleGrouped];
}



#pragma -mark 数据源代理方法
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return self.groupArray.count;
}

//每一组有多少行
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    XMGGroupItem *groupItem = self.groupArray[section];
    return groupItem.rowItemArray.count;
}

//展示什么内容
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    //1.创建Cell.
    XMGSettingCell *cell = [XMGSettingCell cellWithTableView:tableView style:UITableViewCellStyleSubtitle];
    //2.取出数据.
    XMGGroupItem *groupItem = self.groupArray[indexPath.section];
    XMGSettingRowItem *rowItem =  groupItem.rowItemArray[indexPath.row];
    //3.把数据传给Cell,让Cell负责显示.
    cell.rowItem = rowItem;
    return cell;
}


//点击一行
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    //取出行模型
    XMGGroupItem *groupItem = self.groupArray[indexPath.section];
    XMGSettingRowItem *rowItem = groupItem.rowItemArray[indexPath.row];
    
    //判断模型是否为箭头
    if ([rowItem isKindOfClass:[XMGArrowItem class]]) {
        
        XMGArrowItem *item = (XMGArrowItem *)rowItem;
        if (item.desTask) {
            //执行Block
            item.desTask(indexPath);
            
            return;
        }
        
        //判断行模型当中有没有要跳转的控制器
        if (item.desClass) {
            UIViewController *vc = [[item.desClass alloc] init];
            //如果有,进行跳转
            [self.navigationController pushViewController:vc animated:YES];
        }
        
    }
    
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    
    //取出组
    XMGGroupItem *groupItem = self.groupArray[section];
    return groupItem.headerT;
    
    
}

- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section {
    XMGGroupItem *groupItem = self.groupArray[section];
    return groupItem.footerT;
}








@end
