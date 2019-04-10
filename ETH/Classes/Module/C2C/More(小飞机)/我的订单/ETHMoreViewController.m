//
//  ETHMoreViewController.m
//  ETH
//
//  Created by weiming zhang on 2019/4/5.
//  Copyright © 2019 admin. All rights reserved.
//

#import "ETHMoreViewController.h"
#import "ETHOrderVC.h"
#import "ETHAdvertisementVC.h"
#import "ETHComplaintVC.h"
@interface ETHMoreViewController ()
@property (nonatomic, strong)ETHOrderVC *vc1;
@property (nonatomic, strong)ETHAdvertisementVC *vc2;
@property (nonatomic, strong)ETHComplaintVC *vc3;
@end

@implementation ETHMoreViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}
- (void)viewWillAppear:(BOOL)animated{
    self.menuViewStyle = WMMenuViewStyleLine;
    self.titleFontName = @"PingFangSC-Semibold";
    self.progressWidth = 20;
    //    [LKTool isHiddenNavigationBarSeparatorLine:NO vc:self];
    [self.vc1 addObserver:self forKeyPath:@"ccount" options:NSKeyValueObservingOptionNew context:nil];
    [self.vc2 addObserver:self forKeyPath:@"ccount" options:NSKeyValueObservingOptionNew context:nil];
    [self.vc3 addObserver:self forKeyPath:@"ccount" options:NSKeyValueObservingOptionNew context:nil];
    
}
- (UIColor *)menuView:(WMMenuView *)menu titleColorForState:(WMMenuItemState)state atIndex:(NSInteger)index{
    return RGBColorHex(0xffffff);
}
- (WMMenuViewStyle)menuViewStyle{
    return WMMenuViewStyleLine;
}
- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    //    [LKTool isHiddenNavigationBarSeparatorLine:YES vc:self];
    [self.vc1 removeObserver:self forKeyPath:@"ccount" context:nil];
    [self.vc2 removeObserver:self forKeyPath:@"ccount" context:nil];
    [self.vc3 removeObserver:self forKeyPath:@"ccount" context:nil];
}
- (NSInteger)numbersOfChildControllersInPageController:(WMPageController *)pageController{
    return 3;
}
- (NSString *)pageController:(WMPageController *)pageController titleAtIndex:(NSInteger)index{
    if (index==0)
    {
        return @"我的订单";
    }
    else if(index==1)
    {
        return @"发布广告";
    }
    else{
        return @"我的申诉";
    }
}
- (UIViewController *)pageController:(WMPageController *)pageController viewControllerAtIndex:(NSInteger)index{
    if (index==0)
    {
        return self.vc1;
    }
    else if(index==1)
    {
        return self.vc2;
    }else{
        return self.vc3;
    }
}
- (CGFloat)menuView:(WMMenuView *)menu widthForItemAtIndex:(NSInteger)index
{
    CGFloat width = LL_ScreenWidth/3;
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

-(ETHOrderVC *)vc1
{
    if (_vc1==nil)
    {
        _vc1 = [[ETHOrderVC alloc]init];
    }
    return _vc1;
}

-(ETHAdvertisementVC *)vc2
{
    if (_vc2==nil)
    {
        _vc2 = [[ETHAdvertisementVC alloc]init];
    }
    return _vc2;
}
- (ETHComplaintVC *)vc3{
    if (_vc3==nil)
    {
        _vc3 = [[ETHComplaintVC alloc]init];
    }
    return _vc3;
}
    
- (void)backClick{
    [self.navigationController popViewControllerAnimated:YES];
}


@end
