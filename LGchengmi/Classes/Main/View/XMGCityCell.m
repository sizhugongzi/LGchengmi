//
//  XMGCityCell.m
//  LGchengmi
//
//  Created by 甘延娇 on 2019/5/28.
//  Copyright © 2019 tencent. All rights reserved.
//

#import "XMGCityCell.h"

@implementation XMGCityCell

+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"cityCell";
    XMGCityCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[XMGCityCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:ID];
        cell.backgroundColor = [UIColor clearColor];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        [cell.textLabel setTextColor:[UIColor whiteColor]];
    }
    
    return cell;
}

- (void)setFrame:(CGRect)frame
{
    frame.size.width -= 15;
    [super setFrame:frame];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.textLabel.x = (self.width - self.textLabel.width) * 0.5 - 5;
}

@end
