//
//  ETHHomeVC.m
//  ETH
//
//  Created by admin on 2019/4/3.
//  Copyright © 2019 admin. All rights reserved.
//

#import "ETHHomeVC.h"
#import "RefreshGifHeader.h"
#import "ETHBannerHeadView.h"
#import "ETHHomePageTitleHeadView.h"
#import "ETHHomeCollectionCell.h"
#import "PYSearchViewController.h"
#import "ETHInvestmentRecordVC.h"
#import "ETHInvestmentPurchaseVC.h"
#import "ETHSubordinateVC.h"
#import "ETHWalletBalanceWMVC.h"
#import "ETHTodayEarningMVVC.h"

@interface ETHHomeVC ()<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

/* collectionView */
@property (strong , nonatomic)UICollectionView *collectionView;

@property (strong , nonatomic)NSMutableArray *imageUrls;

@end

@implementation ETHHomeVC


/* cell */
static NSString *const ETHHomeCollectionCellID = @"ETHHomeCollectionCellID";
/* head */
static NSString *const ETHBannerHeadViewID = @"ETHBannerHeadViewID";
static NSString *const ETHHomePageTitleHeadViewID = @"ETHHomePageTitleHeadViewID";


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setupUI];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:animated];
//    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleDefault;
}


- (void)setupUI
{
    self.view.backgroundColor = RGBColorHex(0x080e2c);
    self.collectionView.backgroundColor = RGBColorHex(0x080e2c);
    
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
    
    self.collectionView.mj_header = [RefreshGifHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadData)];
    
}

-(void)loadData
{
    
}



#pragma mark - <UICollectionViewDataSource>
//有多少分组
- (NSInteger) numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 2;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    if (section==0) {
        return 0;
    }
    return 6;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *gridcell = nil;
    if (indexPath.section == 1)
    {
        ETHHomeCollectionCell *oell = [collectionView dequeueReusableCellWithReuseIdentifier:ETHHomeCollectionCellID forIndexPath:indexPath];
        
        if (indexPath.row==0)
        {
            oell.backgroundName = @"Rectangle5";
            oell.iconName = @"Assets";
            oell.title = @"投资总额";
            oell.number = @"26004.00";
        }
        else if (indexPath.row==1)
        {
            oell.backgroundName = @"Rectangle6";
            oell.iconName = @"Profit";
            oell.title = @"总收益";
            oell.number = @"266.00";
        }
        else if (indexPath.row==2)
        {
            oell.backgroundName = @"Rectangle7";
            oell.iconName = @"Today's earnings";
            oell.title = @"今日收益";
            oell.number = @"35.00";
        }
        else if (indexPath.row==3)
        {
            oell.backgroundName = @"Rectangle8";
            oell.iconName = @"Wallet";
            oell.title = @"钱包余额";
            oell.number = @"135.00";
        }
        else if (indexPath.row==4)
        {
            oell.backgroundName = @"Rectangle9";
            oell.iconName = @"activation";
            oell.title = @"激活账户";
        }
        else if (indexPath.row==5)
        {
            oell.backgroundName = @"Rectangle10";
            oell.iconName = @"Team";
            oell.title = @"团队";
            oell.number = @"35";
        }
        
        gridcell = oell;
    }
    
    return gridcell;
}


//分组的头部尾部
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    
    UICollectionReusableView *reusableview = nil;
    
    //头部
    if (kind == UICollectionElementKindSectionHeader)
    {
        if (indexPath.section == 0)
        {
            ETHBannerHeadView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:ETHBannerHeadViewID forIndexPath:indexPath];
            headerView.imageUrls = self.imageUrls;
            reusableview = headerView;
        }
        else if (indexPath.section == 1)
        {
            ETHHomePageTitleHeadView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:ETHHomePageTitleHeadViewID forIndexPath:indexPath];
            reusableview = headerView;
        }
        
    }
    
    return reusableview;
}

//这里我为了直观的看出每组的CGSize设置用if 后续我会用简洁的三元表示
#pragma mark - item宽高
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 1)
    {
        //9宫格组
        return CGSizeMake((LL_ScreenWidth - 4)/2, (LL_ScreenWidth - 4)/2 - 85);
    }
   
    return CGSizeZero;
}

//返回rect中的所有的元素的布局属性
- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewLayoutAttributes *layoutAttributes = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    if (indexPath.section == 4)
    {
        //        if (indexPath.row == 0)
        //        {
        //            layoutAttributes.size = CGSizeMake(ScreenW, ScreenW * 0.38);
        //        }
        //        else if (indexPath.row == 1 || indexPath.row == 2 || indexPath.row == 3 || indexPath.row == 4)
        //        {
        //            layoutAttributes.size = CGSizeMake(ScreenW * 0.5, ScreenW * 0.24);
        //        }
        //        else
        //        {
        //            layoutAttributes.size = CGSizeMake(ScreenW * 0.25, ScreenW * 0.35);
        //        }
    }
    return layoutAttributes;
}

#pragma mark - head宽高
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    if (section == 0)
    {
        return CGSizeMake(LL_ScreenWidth, 100+110); //图片滚动的宽高
    }
    else if (section == 1)
    {
        return CGSizeMake(LL_ScreenWidth, 40);
    }
    return CGSizeZero;
}

#pragma mark - foot宽高
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section
{
    return CGSizeZero;
}

#pragma mark - <UICollectionViewDelegateFlowLayout>
#pragma mark - X间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return (section == 5) ? 4 : 0;
}

#pragma mark - Y间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return (section == 5) ? 4 : 0;
}

//点击事件
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section==1)
    {
        if (indexPath.row==0)
        {
            ETHInvestmentRecordVC* vc = [[ETHInvestmentRecordVC alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
        }
        else if (indexPath.row==1)
        {
            ETHTodayEarningMVVC* vc = [[ETHTodayEarningMVVC alloc]init];
            vc.index = 0;
            [self.navigationController pushViewController:vc animated:YES];
        }
        else if (indexPath.row==2)
        {
            ETHTodayEarningMVVC* vc = [[ETHTodayEarningMVVC alloc]init];
            vc.index = 1;
            [self.navigationController pushViewController:vc animated:YES];
        }
        else if (indexPath.row==3)
        {
            ETHWalletBalanceWMVC* vc = [[ETHWalletBalanceWMVC alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
        }
        else if (indexPath.row==4)
        {
            ETHInvestmentPurchaseVC* vc = [[ETHInvestmentPurchaseVC alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
        }
        else if (indexPath.row==5)
        {
            ETHSubordinateVC* vc = [[ETHSubordinateVC alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
        }
    }
}

#pragma mark - <UIScrollViewDelegate>
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (scrollView.contentOffset.y > 44)
    {
        [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleDefault;
        [[NSNotificationCenter defaultCenter] postNotificationName:UserShowTopToolViewNotification object:nil];
    }else
    {
        [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
        [[NSNotificationCenter defaultCenter] postNotificationName:UserHideTopToolViewNotification object:nil];
    }
}


-(void)updateTimeInVisibleCells
{
    //重新刷新section，防止闪烁
    [UIView performWithoutAnimation:^{
        [self.collectionView reloadSections:[NSIndexSet indexSetWithIndex:1]];
    }];
    
    //    [self.collectionView reloadSections:[NSIndexSet indexSetWithIndex:1]];
    //    NSIndexPath* indexPath = [NSIndexPath indexPathForRow:0 inSection:1];
    //    ZFHomeSpikeHeadView *headerView = [self.collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:ZFHomeSpikeHeadViewID forIndexPath:indexPath];
    //    if (headerView!=nil)
    //    {
    //        headerView.timeString = [self getNowTimeWithString:SpikeHeadTime];
    //    }
}


- (UICollectionView *)collectionView
{
    if (!_collectionView) {
        UICollectionViewFlowLayout *layout = [UICollectionViewFlowLayout new];
        _collectionView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:layout];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.frame = CGRectMake(0, 0, LL_ScreenWidth, LL_ScreenHeight);
        _collectionView.showsVerticalScrollIndicator = NO;
        //首页
        [_collectionView registerClass:[ETHHomeCollectionCell class] forCellWithReuseIdentifier:ETHHomeCollectionCellID];
        
        [_collectionView registerClass:[ETHBannerHeadView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:ETHBannerHeadViewID];
        [_collectionView registerClass:[ETHHomePageTitleHeadView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:ETHHomePageTitleHeadViewID];
        
        [self.view addSubview:_collectionView];
    }
    return _collectionView;
}

-(NSMutableArray*)imageUrls
{
    if (_imageUrls==nil) {
        _imageUrls = [[NSMutableArray alloc]init];
        [_imageUrls addObject:@"http://gfs5.gomein.net.cn/T1obZ_BmLT1RCvBVdK.jpg"];
        [_imageUrls addObject:@"http://gfs9.gomein.net.cn/T1C3J_B5LT1RCvBVdK.jpg"];
        [_imageUrls addObject:@"http://gfs5.gomein.net.cn/T1CwYjBCCT1RCvBVdK.jpg"];
    }
    return _imageUrls;
}


@end
