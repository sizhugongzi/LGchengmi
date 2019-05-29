//
//  XMGCityBtn.m
//  LGchengmi
//
//  Created by 甘延娇 on 2019/5/28.
//  Copyright © 2019 tencent. All rights reserved.
//

#import "XMGCityBtn.h"

@implementation XMGCityBtn


- (void)awakeFromNib
{
    [super awakeFromNib];
    
    //设置圆角
    self.layer.cornerRadius = 8;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    if (self.titleLabel.x > self.imageView.x) {
        self.titleLabel.x = self.imageView.x;
        self.imageView.x = CGRectGetMaxX(self.titleLabel.frame) + 10;
    }
}

@end
