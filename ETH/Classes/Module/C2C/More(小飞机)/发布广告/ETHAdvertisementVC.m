//
//  ETHAdvertisementVC.m
//  ETH
//
//  Created by weiming zhang on 2019/4/5.
//  Copyright © 2019 admin. All rights reserved.
//

#import "ETHAdvertisementVC.h"
#import "ETHTitleView.h"
#import "ETHDealVC.h"

@interface ETHAdvertisementVC ()
@property (nonatomic, strong)ETHTitleView *titleView;
@property (nonatomic, strong)UIImageView *backImg;
@property (nonatomic, strong)ETHDealVC *vc1;
@property (nonatomic, strong)ETHDealVC *vc2;

@end

@implementation ETHAdvertisementVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setup];
}

- (void)setup{
    [self.view addSubview:self.titleView];
    [self.view addSubview:self.backImg];
    [_titleView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(self.view);
        make.height.mas_equalTo(LL_StatusBarAndNavigationBarHeight +55);
    }];
    [_backImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleView.mas_bottom).with.offset(-60);
        make.left.right.bottom.equalTo(self.view);
    }];
    
}
- (UIView *)titleView{
    if (_titleView == nil) {
        _titleView = [[ETHTitleView alloc]init];
        [_titleView hideRightBtn:YES];
    }
    return _titleView;
}
- (UIImageView *)backImg{
    if (_backImg == nil) {
        _backImg = [[UIImageView alloc]init];
        self.backImg.image = [UIImage imageNamed:@"BG-M"];
    }
    return _backImg;
}
- (void)viewWillAppear:(BOOL)animated{
    [self.view bringSubviewToFront:self.menuView];
    self.menuView.layer.cornerRadius = 4;
    self.menuView.layer.borderWidth = 1;
    self.menuView.layer.borderColor = [RGBColorHex(0x6a82f4) CGColor];
    [self.vc1 addObserver:self forKeyPath:@"ccount" options:NSKeyValueObservingOptionNew context:nil];
    [self.vc2 addObserver:self forKeyPath:@"ccount" options:NSKeyValueObservingOptionNew context:nil];
    
}
- (CGFloat)menuView:(WMMenuView *)menu titleSizeForState:(WMMenuItemState)state atIndex:(NSInteger)index{
    return 14;
}

- (UIColor *)menuView:(WMMenuView *)menu titleColorForState:(WMMenuItemState)state atIndex:(NSInteger)index{
    if (state == WMMenuItemStateSelected) {
        return [UIColor whiteColor];
    }else{
        return RGBColorHex(0xbbbcc1);
    }
}

- (NSString *)titleFontName{
    return @"PingFangSC-Semibold";
}
- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    //    [LKTool isHiddenNavigationBarSeparatorLine:YES vc:self];
    [self.vc1 removeObserver:self forKeyPath:@"ccount" context:nil];
    [self.vc2 removeObserver:self forKeyPath:@"ccount" context:nil];
}
- (NSInteger)numbersOfChildControllersInPageController:(WMPageController *)pageController{
    return 2;
}
- (NSString *)pageController:(WMPageController *)pageController titleAtIndex:(NSInteger)index{
    if (index==0)
    {
        return @"买入ETH";
    }
    else
    {
        return @"卖出ETH";
    }
}
- (UIViewController *)pageController:(WMPageController *)pageController viewControllerAtIndex:(NSInteger)index{
    if (index==0)
    {
        return self.vc1;
    }
    else
    {
        return self.vc2;
    }
}
- (CGFloat)menuView:(WMMenuView *)menu widthForItemAtIndex:(NSInteger)index
{
    CGFloat width = (LL_ScreenWidth - 32)/2-4;
    return width;
}

- (CGRect)pageController:(WMPageController *)pageController preferredFrameForMenuView:(WMMenuView *)menuView
{
    CGFloat originY = LL_StatusBarAndNavigationBarHeight +55;
    return CGRectMake(16, originY, LL_ScreenWidth - 32, 29);
}

- (CGRect)pageController:(WMPageController *)pageController preferredFrameForContentView:(WMScrollView *)contentView
{
    
    CGFloat originY = 0;
    return CGRectMake(0, originY,LL_ScreenWidth, LL_ScreenHeight - originY);
}

-(ETHDealVC *)vc1
{
    if (_vc1==nil)
    {
        _vc1 = [[ETHDealVC alloc]init];
//        _vc1.type = 0;
    }
    return _vc1;
}

-(ETHDealVC *)vc2
{
    if (_vc2==nil)
    {
        _vc2 = [[ETHDealVC alloc]init];
//        _vc2.type = 1;
    }
    return _vc2;
}

@end
