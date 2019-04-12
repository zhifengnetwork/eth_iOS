//
//  ETHChessCardVC.m
//  ETH
//
//  Created by admin on 2019/4/3.
//  Copyright © 2019 admin. All rights reserved.
//

#import "ETHChessCardVC.h"
#import "RefreshGifHeader.h"
#import "ETHChessCardCollectionCell.h"
#import "ETHRecreationVC.h"

@interface ETHChessCardVC ()<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

/* collectionView */
@property (strong , nonatomic)UICollectionView *collectionView;

@end

@implementation ETHChessCardVC


/* cell */
static NSString *const ETHChessCardCollectionCellID = @"ETHChessCardCollectionCellID";


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"游戏大全";
    [self setupUI];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
//    [self.navigationController setNavigationBarHidden:YES animated:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
//    [self.navigationController setNavigationBarHidden:NO animated:animated];
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
    return 3;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 2;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *gridcell = nil;
    ETHChessCardCollectionCell *oell = [collectionView dequeueReusableCellWithReuseIdentifier:ETHChessCardCollectionCellID forIndexPath:indexPath];
    if (indexPath.section==0)
    {
        if (indexPath.row==0)
        {
            oell.iconName = @"Welfare";
        }
        else if (indexPath.row==1)
        {
            oell.iconName = @"3d";
        }
    }
    else if (indexPath.section==1)
    {
        if (indexPath.row==0)
        {
            oell.iconName = @"Leisure";
        }
        else if (indexPath.row==1)
        {
            oell.iconName = @"Leisure1";
        }
    }
    else if (indexPath.section==2)
    {
        if (indexPath.row==0)
        {
            oell.iconName = @"Bullfighting";
        }
        else if (indexPath.row==1)
        {
            oell.iconName = @"Bullfighting2";
        }
    }
    
    gridcell = oell;
    
    return gridcell;
}


//分组的头部尾部
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    
    UICollectionReusableView *reusableview = nil;
    
    //头部
    if (kind == UICollectionElementKindSectionHeader)
    {
        
    }
    
    return reusableview;
}

//这里我为了直观的看出每组的CGSize设置用if 后续我会用简洁的三元表示
#pragma mark - item宽高
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section==0)
    {
        if (indexPath.row==0)
        {
            return CGSizeMake(193, 105);
        }
        else if (indexPath.row==1)
        {
            return CGSizeMake(113, 105);
        }
    }
    else if (indexPath.section==1)
    {
        if (indexPath.row==0)
        {
            return CGSizeMake(193, 105);
        }
        else if (indexPath.row==1)
        {
            return CGSizeMake(113, 105);
        }
    }
    else if (indexPath.section==2)
    {
        if (indexPath.row==0)
        {
            return CGSizeMake(193, 105);
        }
        else if (indexPath.row==1)
        {
            return CGSizeMake(113, 105);
        }
    }
    
    return CGSizeZero;
}

//返回rect中的所有的元素的布局属性
- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewLayoutAttributes *layoutAttributes = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    if (indexPath.section == 4)
    {
        
    }
    return layoutAttributes;
}

#pragma mark - head宽高
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
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
    return 20;
}

#pragma mark - Y间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 20;
}

//点击事件
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section==0)
    {
        if (indexPath.row==0)
        {
            ETHRecreationVC* vc = [[ETHRecreationVC alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
        }
//        else if (indexPath.row==3)
//        {
//            ETHWalletBalanceVC* vc = [[ETHWalletBalanceVC alloc]init];
//            [self.navigationController pushViewController:vc animated:YES];
//        }
//        else if (indexPath.row==4)
//        {
//            ETHInvestmentPurchaseVC* vc = [[ETHInvestmentPurchaseVC alloc]init];
//            [self.navigationController pushViewController:vc animated:YES];
//        }
//        else if (indexPath.row==5)
//        {
//            ETHSubordinateVC* vc = [[ETHSubordinateVC alloc]init];
//            [self.navigationController pushViewController:vc animated:YES];
//        }
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
        layout.scrollDirection = UICollectionViewScrollDirectionVertical;
        layout.sectionInset = UIEdgeInsetsMake(10, 25, 10, 20);
        _collectionView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:layout];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.frame = CGRectMake(0, 0, LL_ScreenWidth, LL_ScreenHeight);
        _collectionView.showsVerticalScrollIndicator = NO;
        //首页
        [_collectionView registerClass:[ETHChessCardCollectionCell class] forCellWithReuseIdentifier:ETHChessCardCollectionCellID];
        
        [self.view addSubview:_collectionView];
    }
    return _collectionView;
}

@end
