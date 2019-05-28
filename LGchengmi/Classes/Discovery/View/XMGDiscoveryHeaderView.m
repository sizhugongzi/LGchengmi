//
//  XMGDiscoveryHeaderView.m
//  LGchengmi
//
//  Created by 甘延娇 on 2019/5/28.
//  Copyright © 2019 tencent. All rights reserved.
//

#import "XMGDiscoveryHeaderView.h"
#import "XqDiscoveryHeaderItem.h"

@interface XMGDiscoveryHeaderView ()

@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *desLabel;

@end

@implementation XMGDiscoveryHeaderView

- (void)awakeFromNib
{
    [super awakeFromNib];
    // Initialization code
}

- (void)setHeaderItem:(XqDiscoveryHeaderItem *)headerItem
{
    _headerItem = headerItem;
    
    self.iconImageView.image = [UIImage imageNamed:headerItem.image];
    self.nameLabel.text = headerItem.feeltitle;
    self.desLabel.text = headerItem.title;
}


@end
