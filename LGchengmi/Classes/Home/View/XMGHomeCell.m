//
//  XMGHomeCell.m
//  LGchengmi
//
//  Created by 甘延娇 on 2019/5/28.
//  Copyright © 2019 tencent. All rights reserved.
//

#import "XMGHomeCell.h"
#import "XMGHomeCellItem.h"

@interface XMGHomeCell ()

@property (weak, nonatomic) IBOutlet UIImageView *bgImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *desLabel;
@property (weak, nonatomic) IBOutlet UILabel *supportLabel;

@end

@implementation XMGHomeCell

+ (instancetype)homeCell
{
    return [[NSBundle mainBundle] loadNibNamed:@"XMGHomeCell" owner:nil options:nil][0];
}

- (void)setCellItem:(XMGHomeCellItem *)cellItem
{
    _cellItem = cellItem;

    self.bgImageView.image = [UIImage imageNamed:cellItem.imageURL];
    self.titleLabel.text = cellItem.section_title;
    self.desLabel.text = cellItem.poi_name;
    self.supportLabel.text = cellItem.fav_count;
}

@end
