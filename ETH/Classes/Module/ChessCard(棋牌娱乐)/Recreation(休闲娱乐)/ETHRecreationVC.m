//
//  ETHRecreationVC.m
//  ETH
//
//  Created by admin on 2019/4/11.
//  Copyright © 2019 admin. All rights reserved.
//

#import "ETHRecreationVC.h"
#import "RefreshGifHeader.h"
#import "ETHRecreationCollectionCell.h"

@interface ETHRecreationVC ()<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

/* collectionView */
@property (strong , nonatomic)UICollectionView *collectionView;

@end

@implementation ETHRecreationVC


/* cell */
static NSString *const ETHRecreationCollectionCellID = @"ETHRecreationCollectionCellID";


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"休闲娱乐";
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
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 10;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *gridcell = nil;
    if (indexPath.section == 0)
    {
        ETHRecreationCollectionCell *oell = [collectionView dequeueReusableCellWithReuseIdentifier:ETHRecreationCollectionCellID forIndexPath:indexPath];
        
        if (indexPath.row==0)
        {
            oell.iconName = @"Texas";
            oell.title = @"德州扑克";
        }
        else if (indexPath.row==1)
        {
            oell.iconName = @"2048image";
            oell.title = @"2048";
        }
        else if (indexPath.row==2)
        {
            oell.iconName = @"white";
            oell.title = @"别踩白块";
        }
        else if (indexPath.row==3)
        {
            oell.iconName = @"Tetris";
            oell.title = @"俄罗斯方块";
        }
        else if (indexPath.row==4)
        {
            oell.iconName = @"StickmanLeague";
            oell.title = @"火柴人联盟";
        }
        else if (indexPath.row==5)
        {
            oell.iconName = @"cut fruit";
            oell.title = @"切水果";
        }
        else if (indexPath.row==6)
        {
            oell.iconName = @"Crazyracing";
            oell.title = @"疯狂赛车";
        }
        else if (indexPath.row==7)
        {
            oell.iconName = @"Snake";
            oell.title = @"贪吃蛇";
        }
        else if (indexPath.row==8)
        {
            oell.iconName = @"Birdpig";
            oell.title = @"小鸟与猪";
        }
        else if (indexPath.row==9)
        {
            oell.iconName = @"Eliminatemusic";
            oell.title = @"消消乐";
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
        
    }
    
    return reusableview;
}

//这里我为了直观的看出每组的CGSize设置用if 后续我会用简洁的三元表示
#pragma mark - item宽高
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0)
    {
        //9宫格组
        return CGSizeMake((LL_ScreenWidth - 80)/3, (LL_ScreenWidth - 80)/3 + 20);
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
            //            ETHInvestmentRecordVC* vc = [[ETHInvestmentRecordVC alloc]init];
            //            [self.navigationController pushViewController:vc animated:YES];
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
        layout.sectionInset = UIEdgeInsetsMake(10, 20, 10, 20);
        _collectionView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:layout];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.frame = CGRectMake(0, 0, LL_ScreenWidth, LL_ScreenHeight);
        _collectionView.showsVerticalScrollIndicator = NO;
        //首页
        [_collectionView registerClass:[ETHRecreationCollectionCell class] forCellWithReuseIdentifier:ETHRecreationCollectionCellID];
        
        [self.view addSubview:_collectionView];
    }
    return _collectionView;
}

@end
