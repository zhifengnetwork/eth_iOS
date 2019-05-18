//
//  ETHC2C.m
//  ETH
//
//  Created by admin on 2019/4/3.
//  Copyright © 2019 admin. All rights reserved.
//

#import "ETHC2C.h"
#import "ETHBuyVC.h"
#import "ETHTitleView.h"
@interface ETHC2C ()
@property (nonatomic, strong)ETHBuyVC *vc1;
@property (nonatomic, strong)ETHBuyVC *vc2;

@end

@implementation ETHC2C

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setup];
}
- (void)setup{
    self.navigationController.navigationBar.hidden = YES;
}

- (void)viewWillAppear:(BOOL)animated{
    self.menuViewStyle = WMMenuViewStyleLine;
    self.titleFontName = @"ArialRoundedMTBold";
    self.progressWidth = 20;
    //    [LKTool isHiddenNavigationBarSeparatorLine:NO vc:self];
    [self.vc1 addObserver:self forKeyPath:@"ccount" options:NSKeyValueObservingOptionNew context:nil];
    [self.vc2 addObserver:self forKeyPath:@"ccount" options:NSKeyValueObservingOptionNew context:nil];
    
}
- (CGFloat)menuView:(WMMenuView *)menu titleSizeForState:(WMMenuItemState)state atIndex:(NSInteger)index{
    return 20;
}
- (UIColor *)menuView:(WMMenuView *)menu titleColorForState:(WMMenuItemState)state atIndex:(NSInteger)index{
    if (state == WMMenuItemStateSelected) {
        return [UIColor redColor];
    }else{
        return [UIColor whiteColor];
    }
}
- (WMMenuViewStyle)menuViewStyle{
    return WMMenuViewStyleLine;
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
        return @"买入";
    }
    else
    {
        return @"卖出";
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
    CGFloat width = LL_ScreenWidth/2;
    return width;
    
}

- (CGRect)pageController:(WMPageController *)pageController preferredFrameForMenuView:(WMMenuView *)menuView
{
    CGFloat originY = LL_StatusBarAndNavigationBarHeight;
    return CGRectMake(0, originY, LL_ScreenWidth, 44);
}

- (CGRect)pageController:(WMPageController *)pageController preferredFrameForContentView:(WMScrollView *)contentView
{
    [self.view insertSubview:self.menuView aboveSubview:contentView];
    CGFloat originY = 0;
    return CGRectMake(0, originY,LL_ScreenWidth, LL_ScreenHeight - originY);
}

-(ETHBuyVC *)vc1
{
    if (_vc1==nil)
    {
        _vc1 = [[ETHBuyVC alloc]init];
        _vc1.type = 0;
        _vc1.name = self.name;
    }
    return _vc1;
}

-(ETHBuyVC *)vc2
{
    if (_vc2==nil)
    {
        _vc2 = [[ETHBuyVC alloc]init];
        _vc2.type = 1;
        _vc1.name = self.name;
    }
    return _vc2;
}

@end
