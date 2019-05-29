//
//  XMGSectionView.h
//  LGchengmi
//
//  Created by 甘延娇 on 2019/5/28.
//  Copyright © 2019 tencent. All rights reserved.
//

#import <UIKit/UIKit.h>


@class XMGSectionItem;
@interface XMGSectionView : UIView

+ (instancetype)sectionView;

@property (nonatomic ,strong) XMGSectionItem *secItem;

@end
