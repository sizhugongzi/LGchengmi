//
//  XMGDiscoveryVC.m
//  LGchengmi
//
//  Created by 甘延娇 on 2019/5/28.
//  Copyright © 2019 tencent. All rights reserved.

#import "XMGDiscoveryVC.h"
#import "XqDiscoveryItem.h"
#import "XqDiscoveryThemeItem.h"
#import "XqDiscoveryHeaderItem.h"
#import "XMGCollectionViewCell.h"
#import "XMGDiscoveryHeaderView.h"

@interface XMGDiscoveryVC ()

@property (nonatomic ,strong) NSArray *discoveryArray;

@end

/**
 *  1.创建UICollectionViewController时,必须得要指定布局参数.
 *  2.UICollectionViewCell必须得要注册才能使用
 *  3.想要让CollectViewCell内部展示内容,必须得要自定义Cell,去添加子控件.它内部是没有自带子控件的.
*/

@implementation XMGDiscoveryVC


- (NSArray *)discoveryArray
{
    if (_discoveryArray == nil) {
        _discoveryArray = [XqDiscoveryItem getDiscoveryList];
    }
    return _discoveryArray;
}

- (instancetype)init {
    //在tableViewController中self.view就是tableView.
    //在CollectionVeiwController当中,self.view并不是collectionView.
    //创建流水布局
    UICollectionViewFlowLayout *flowL = [[UICollectionViewFlowLayout alloc] init];
    CGFloat margin = 10;
    //每个格子的大小
    CGFloat width = (kScreenW - 3 * margin) * 0.5;
    
    flowL.itemSize = CGSizeMake(width, 135);
    
    //设置最小行间距
    flowL.minimumLineSpacing = 10;
    //设置最小间隔值.
    flowL.minimumInteritemSpacing = 0;
    
    flowL.sectionInset = UIEdgeInsetsMake(margin, margin, margin, margin);
    
    //设置辅助视图的宽高
    flowL.headerReferenceSize = CGSizeMake(kScreenW, 200);
    
    
    return [super initWithCollectionViewLayout:flowL];
}

static NSString *ID = @"collectionViewID";
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"发现";
    self.collectionView.backgroundColor = [UIColor grayColor];
    
    //UICollectionViewCell必须得要注册才能使用
    //注册
    //[self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:ID];
    
    //从nib当中创建Cell
    [self.collectionView registerNib:[UINib nibWithNibName:@"XMGCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:ID];
    
    //想要使用辅助视图必须得要注册才行
    //ViewOfKind:
    //UICollectionElementKindSectionFooter
    //UICollectionElementKindSectionHeader
    
    [self.collectionView registerNib:[UINib nibWithNibName:@"XMGDiscoveryHeaderView" bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"discoveryHeaderID"];
}

//- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
//    
//}

//有多少组
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return self.discoveryArray.count;
}

//每一组当中有多少格子(item)
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    //取出当前是哪一组
    XqDiscoveryItem *sectionItem = self.discoveryArray[section];
    return sectionItem.themes.count;
}

//每一行展示什么内容
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    //创建Cell
    XMGCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ID forIndexPath:indexPath];
    cell.backgroundColor = [UIColor whiteColor];
    //取出数据
    //取出当前是哪一组
    XqDiscoveryItem *sectionItem = self.discoveryArray[indexPath.section];
    XqDiscoveryThemeItem *themeItem = sectionItem.themes[indexPath.row];
    //把数据传给Cell
    cell.themeItem = themeItem;
    
    return cell;
};

//每一个辅助视图展示什么内容
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    //判断是否为头部
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        
        XMGDiscoveryHeaderView *headerV = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"discoveryHeaderID" forIndexPath:indexPath];
        //取出数据
          XqDiscoveryItem *sectionItem = self.discoveryArray[indexPath.section];
        XqDiscoveryHeaderItem *headerItem = sectionItem.header;
        headerV.headerItem = headerItem;
        
        return headerV;
    }
    return nil;
}

@end
