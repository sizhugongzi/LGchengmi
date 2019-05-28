//
//  DrawerViewController.m
//  LGchengmi
//
//  Created by 甘延娇 on 2019/5/28.
//  Copyright © 2019 tencent. All rights reserved.
//

#import "DrawerViewController.h"

#define screenW [UIScreen mainScreen].bounds.size.width
#define target screenW * 0.8

@interface DrawerViewController ()<UIGestureRecognizerDelegate>

@end

@implementation DrawerViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //初始化工作
    [self addChildView];
    //添加手势
    UIPanGestureRecognizer *panGes = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
    [self.mainV addGestureRecognizer:panGes];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(close)];
    tap.delegate = self;
    [self.leftV addGestureRecognizer:tap];
}

- (void)pan:(UIPanGestureRecognizer *)pan
{
    //让中间红色View平移
    //获取偏移量
    CGPoint transP = [pan translationInView:self.mainV];
    //根据偏移量,计算当前的位置大小
    [self positionWithOffset:transP.x];
    
    //判断手势的状态
    if (pan.state == UIGestureRecognizerStateEnded) {
        //如果当前x值大于屏幕宽度一半时,自动定位到右侧
        if (self.mainV.frame.origin.x > screenW * 0.5) {
            
            //计算偏移
            [UIView animateWithDuration:0.25 animations:^{
                CGFloat offset = target - self.mainV.frame.origin.x;
                [self positionWithOffset:offset];
            }];
        }else {
            //否则,关闭抽屉(复位)
            [self close];
        }
    }
    //清0
    [pan setTranslation:CGPointZero inView:self.mainV];
}

//打开抽屉
- (void)open
{
    [UIView animateWithDuration:0.25 animations:^{
        
        [self positionWithOffset:target];
        CGRect frame = self.mainV.frame;
        frame.origin.x = target;
        self.mainV.frame = frame;
    }];
}

//关闭抽屉
- (void)close
{
    [UIView animateWithDuration:0.25 animations:^{
        //清空形变
        self.mainV.transform = CGAffineTransformIdentity;
        //位置复位
        self.mainV.frame = self.view.bounds;
    }];
}

//根据偏移量,计算当前的位置大小
- (void)positionWithOffset:(CGFloat)offset
{
    //平移
    CGRect frame = self.mainV.frame;
    frame.origin.x += offset;
    self.mainV.frame = frame;
    
    if (self.mainV.frame.origin.x <= 0) {
        self.mainV.frame = self.view.bounds;
    }
    
    if (self.mainV.frame.origin.x >= target) {
        CGRect frame = self.mainV.frame;
        frame.origin.x = target;
        self.mainV.frame = frame;
    }
    
    CGFloat scale = self.mainV.frame.origin.x *  0.3 / screenW;
    scale = 1 - scale;
    //形变
    self.mainV.transform = CGAffineTransformMakeScale(scale, scale);
}

- (void)addChildView
{
    //添加子控件
    UIView *leftV = [[UIView alloc] init];
    leftV.backgroundColor = [UIColor orangeColor];
    leftV.frame = self.view.bounds;
    [self.view addSubview:leftV];
    _leftV = leftV;
    
    UIView *mainV = [[UIView alloc] init];
    mainV.backgroundColor = [UIColor purpleColor];
    mainV.frame = self.view.bounds;
    [self.view addSubview:mainV];
    _mainV = mainV;
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch {
    if ([NSStringFromClass([touch.view class]) isEqualToString: @"UITableViewCellContentView"]) {
        return NO;
    }else {
        return YES;
    };
}
@end
