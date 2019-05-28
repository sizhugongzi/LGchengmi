//
//  DrawerViewController.h
//  LGchengmi
//
//  Created by 甘延娇 on 2019/5/28.
//  Copyright © 2019 tencent. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface DrawerViewController : UIViewController

@property (nonatomic, weak, readonly)  UIView *mainV;
@property (nonatomic, weak, readonly)  UIView *leftV;

//打开抽屉
- (void)open;
//关闭抽屉
- (void)close;

@end

NS_ASSUME_NONNULL_END
