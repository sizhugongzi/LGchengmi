//
//  XMGSettingCell.m
//  LGchengmi
//
//  Created by 甘延娇 on 2019/5/28.
//  Copyright © 2019 tencent. All rights reserved.
//

#import "XMGSettingCell.h"
#import "XMGSettingRowItem.h"
#import "XMGArrowItem.h"
#import "XMGSwitchItem.h"

@implementation XMGSettingCell


+ (instancetype)cellWithTableView:(UITableView *)tableView style:(UITableViewCellStyle)style
{
    static NSString *ID = @"settingCell";
    
    XMGSettingCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[XMGSettingCell alloc] initWithStyle:style reuseIdentifier:ID];
        cell.layer.cornerRadius = 8;
    }
    
    return cell;
}

- (void)setRowItem:(XMGSettingRowItem *)rowItem {
    _rowItem = rowItem;
    
    //1.设置数据
    [self setUpData:rowItem];
    
    //2.设置辅助视图
    [self setCellAccessoryView:rowItem];
}

//设置数据
- (void)setUpData:(XMGSettingRowItem *)rowItem
{
    //设置数据
    self.imageView.image = rowItem.image;
    self.textLabel.text = rowItem.title;
    self.detailTextLabel.text = rowItem.subTitle;
}

//设置辅助视图
- (void)setCellAccessoryView:(XMGSettingRowItem *)rowItem
{
    //根据模型的类型,判断辅助视图的类型
    if ([rowItem isKindOfClass:[XMGArrowItem class]]) {
        
        self.accessoryView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"arrow_right"]];
        
    }else if ([rowItem isKindOfClass:[XMGSwitchItem class]] ) {
        
        self.accessoryView = [[UISwitch alloc] init];
        
    }else {
        self.accessoryView = nil;
    }
}

- (void)setFrame:(CGRect)frame {
    CGFloat margin = 10;
    
    frame.origin.x = margin;
    frame.size.width -= 2 * margin;
    frame.size.height -= 5;
    
    [super setFrame:frame];
}




@end
