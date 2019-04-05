//
//  ETHC2C.m
//  ETH
//
//  Created by admin on 2019/4/3.
//  Copyright © 2019 admin. All rights reserved.
//

#import "ETHC2C.h"
#import "ETHBuyVC.h"
@interface ETHC2C ()
@property (nonatomic, strong)ETHBuyVC *vc1;
@property (nonatomic, strong)ETHBuyVC *vc2;
@property (nonatomic, strong)UIView *titleView;
@property (nonatomic, strong)UIImageView *backImg;
//@property (nonatomic, strong)UIView *MenuView;
@end

@implementation ETHC2C

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setup];
}
- (void)setup{
    self.navigationController.navigationBar.hidden = YES;
    [self.view addSubview:self.titleView];
    [_titleView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(self.view);
        make.height.mas_equalTo(108);
    }];
    [self.view addSubview:self.backImg];
    [_backImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleView.mas_bottom).with.offset(-49);
        make.left.right.bottom.equalTo(self.view);
    }];
}
- (UIView *)titleView{
    if (_titleView == nil) {
        _titleView = [[UIView alloc]init];
        _titleView.backgroundColor = [UIColor redColor];
    }
    return _titleView;
}
- (UIImageView *)backImg{
    if (_backImg == nil) {
        _backImg = [[UIImageView alloc]init];
    }
    return _backImg;
}
- (void)viewWillAppear:(BOOL)animated{
    [self.view bringSubviewToFront:self.menuView];
    self.menuViewStyle = WMMenuViewStyleLine;
    self.titleSizeNormal = 20;
    self.titleSizeSelected = 20;
    self.titleFontName = @"UIFontWeightBold";
    self.progressWidth = 20;
    //    [LKTool isHiddenNavigationBarSeparatorLine:NO vc:self];
    [self.vc1 addObserver:self forKeyPath:@"ccount" options:NSKeyValueObservingOptionNew context:nil];
    [self.vc2 addObserver:self forKeyPath:@"ccount" options:NSKeyValueObservingOptionNew context:nil];
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
        self.backImg.image =[UIImage imageNamed:@"BG2"];
        return self.vc1;
    }
    else
    {
        self.backImg.image =[UIImage imageNamed:@"BG3"];
        return self.vc2;
    }
}
- (CGFloat)menuView:(WMMenuView *)menu widthForItemAtIndex:(NSInteger)index
{
    CGFloat width = [super menuView:menu widthForItemAtIndex:index];
    return width + 20;
}

- (CGRect)pageController:(WMPageController *)pageController preferredFrameForMenuView:(WMMenuView *)menuView
{
    CGFloat originY = 64;
    return CGRectMake(0, originY, LL_ScreenWidth, 44);
}

- (CGRect)pageController:(WMPageController *)pageController preferredFrameForContentView:(WMScrollView *)contentView
{
    CGFloat originY = 64;
    return CGRectMake(0, originY,LL_ScreenWidth, LL_ScreenHeight - originY);
}

-(ETHBuyVC *)vc1
{
    if (_vc1==nil)
    {
        _vc1 = [[ETHBuyVC alloc]init];
//        _vc1.type = 0;
    }
    return _vc1;
}

-(ETHBuyVC *)vc2
{
    if (_vc2==nil)
    {
        _vc2 = [[ETHBuyVC alloc]init];
//        _vc2.type = 1;
    }
    return _vc2;
}
- (void)rightButtonDidClick
{
    //更多
}

@end
