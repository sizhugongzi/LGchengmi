//
//  XMGSectionView.m
//  LGchengmi
//
//  Created by 甘延娇 on 2019/5/28.
//  Copyright © 2019 tencent. All rights reserved.
//

#import "XMGSectionView.h"
#import "XMGSectionItem.h"
#import "UIColor+XQColor.h"

@interface XMGSectionView ()

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *desLabel;

@end

@implementation XMGSectionView

+ (instancetype)sectionView
{
    return [[NSBundle mainBundle] loadNibNamed:@"XMGSectionView" owner:nil options:nil][0];
}

- (void)setSecItem:(XMGSectionItem *)secItem
{
    _secItem = secItem;
    
    self.titleLabel.text = secItem.tag_name;
    self.desLabel.text = [NSString stringWithFormat:@"%@",secItem.section_count];
    
    UIColor *bgColor = [UIColor colorWithHexString:secItem.color alpha:1];
    self.backgroundColor = bgColor;
}

@end
