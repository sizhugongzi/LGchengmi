//
//  XMGCollectionViewCell.m
//  LGchengmi
//
//  Created by 甘延娇 on 2019/5/28.
//  Copyright © 2019 tencent. All rights reserved.
//

#import "XMGCollectionViewCell.h"
#import "XqDiscoveryThemeItem.h"

@interface XMGCollectionViewCell ()

@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *desLabel;

@end

@implementation XMGCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];

}

- (void)setThemeItem:(XqDiscoveryThemeItem *)themeItem {
    _themeItem = themeItem;
    
    self.iconImageView.image = [UIImage imageNamed:themeItem.img];
    self.nameLabel.text = themeItem.title;
    self.desLabel.text = themeItem.keywords;
}
@end
