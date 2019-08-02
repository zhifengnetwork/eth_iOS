//
//  ETHOrderVC.m
//  ETH
//
//  Created by weiming zhang on 2019/4/5.
//  Copyright © 2019 admin. All rights reserved.
//

#import "ETHOrderVC.h"
#import "ETHTitleView.h"
#import "ETHTradeVC.h"
@interface ETHOrderVC ()<UIScrollViewDelegate>
@property (nonatomic, strong)ETHTitleView *titleView;
@property (nonatomic, strong)UIImageView *backImg;
@property (nonatomic, strong)UIView *kindView;
@property (nonatomic, strong)UIButton *one;
@property (nonatomic, strong)UIButton *two;
@property (nonatomic, strong)UIButton *three;
@property (nonatomic, strong)UIButton *four;
@property (nonatomic, strong)UIButton *selectBtn;
@property (nonatomic, strong)UIView *mainView;
@property (nonatomic, strong)ETHTradeVC *vc1;
@property (nonatomic, strong)ETHTradeVC *vc2;
@property (nonatomic, strong)ETHTradeVC *vc3;
@property (nonatomic, strong)ETHTradeVC *vc4;
@end

@implementation ETHOrderVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setup];
    self.view.backgroundColor = RGBColorHex(0x3c3f51);
}

- (void)setup{
    [self.view addSubview:self.titleView];
    [self.view addSubview:self.backImg];
    [_titleView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(self.view);
        make.height.mas_equalTo(LL_StatusBarAndNavigationBarHeight +55);
    }];
    [_backImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleView.mas_bottom).with.offset(-50);
        make.left.right.bottom.equalTo(self.view);
    }];
    [self.view addSubview:self.kindView];
    [self.kindView addSubview:self.one];
    [self.kindView addSubview:self.two];
    [self.kindView addSubview:self.three];
    [self.kindView addSubview:self.four];
    [self.view addSubview:self.mainView];
    [_kindView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleView.mas_bottom).with.offset(10);
        make.left.equalTo(self.view).with.offset(16);
        make.right.equalTo(self.view).with.offset(-16);
        make.height.mas_equalTo(29);
    }];
    [_one mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.equalTo(self.kindView).with.offset(+1);
        make.bottom.equalTo(self.kindView);
        make.width.mas_equalTo((LL_ScreenWidth-32)/4-1);
    }];
    [_two mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.one.mas_right).with.offset(+1);
        make.bottom.equalTo(self.kindView);
        make.top.equalTo(self.kindView);
        make.width.mas_equalTo((LL_ScreenWidth-32)/4-1);
    }];
    [_three mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.two.mas_right).with.offset(+1);
        make.bottom.equalTo(self.kindView);
        make.top.equalTo(self.kindView);
        make.width.mas_equalTo((LL_ScreenWidth-32)/4-1);
    }];
    [_four mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.three.mas_right).with.offset(+1);
        make.top.equalTo(self.kindView);
        make.bottom.equalTo(self.kindView);
        make.width.mas_equalTo((LL_ScreenWidth-32)/4-2);
    }];
    [_mainView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.kindView.mas_bottom);
        make.left.right.bottom.equalTo(self.view);
    }];
    [self setupChildViewController];
    [self btnClick:_one];
    
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
        self.backImg.image = [UIImage imageNamed:@"BG"];
    }
    return _backImg;
}
- (UIView *)kindView{
    if (_kindView == nil) {
        _kindView = [[UIView alloc]init];
        _kindView.layer.cornerRadius = 5;
        _kindView.layer.borderWidth = 1;
        _kindView.layer.borderColor = [RGBColorHex(0x6a82f4) CGColor];
        _kindView.backgroundColor = RGBColorHex(0x6a82f4);
    }
    return _kindView;
}
- (UIButton *)one{
    if (_one == nil) {
        _one = [[UIButton alloc]init];
        _one.tag =1;
        _one.titleLabel.font = [UIFont systemFontOfSize:14];
        [_one setTitle:@"未交易" forState:UIControlStateNormal];
        [_one setTitleColor:RGBColorHex(0xffffff) forState:UIControlStateSelected];
        [_one setTitleColor:RGBColorHex(0xa0a2a8) forState:UIControlStateNormal];
        [_one setBackgroundColor:RGBColorHex(0x36394a)];
        [_one addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _one;
}
- (UIButton *)two{
    if (_two == nil) {
        _two = [[UIButton alloc]init];
        _two.tag = 2;
        _two.titleLabel.font = [UIFont systemFontOfSize:14];
        [_two setTitle:@"交易中" forState:UIControlStateNormal];
        [_two setTitleColor:RGBColorHex(0xffffff) forState:UIControlStateSelected];
        [_two setTitleColor:RGBColorHex(0xa0a2a8) forState:UIControlStateNormal];
        _two.backgroundColor =RGBColorHex(0x36394a);
        [_two addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _two;
}
- (UIButton *)three{
    if (_three == nil) {
        _three = [[UIButton alloc]init];
        _three.tag = 3;
        _three.titleLabel.font = [UIFont systemFontOfSize:14];
        [_three setTitle:@"交易完成" forState:UIControlStateNormal];
        [_three setTitleColor:RGBColorHex(0xffffff) forState:UIControlStateSelected];
        [_three setTitleColor:RGBColorHex(0xa0a2a8) forState:UIControlStateNormal];
        _three.backgroundColor =RGBColorHex(0x36394a);
        [_three addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _three;
}
- (UIButton *)four{
    if (_four == nil) {
        _four = [[UIButton alloc]init];
        _four.tag = 4;
        _four.titleLabel.font = [UIFont systemFontOfSize:14];
        [_four setTitle:@"交易失败" forState:UIControlStateNormal];
        [_four setTitleColor:RGBColorHex(0xffffff) forState:UIControlStateSelected];
        [_four setTitleColor:RGBColorHex(0xa0a2a8) forState:UIControlStateNormal];
        _four.backgroundColor =RGBColorHex(0x36394a);
        [_four addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _four;
}
- (UIView *)mainView{
    if (_mainView == nil) {
        _mainView = [[UIView alloc]init];
    }
    return _mainView;
}
#pragma mark --方法
- (void)btnClick:(UIButton *)btn{
    if (btn!= self.selectBtn) {
        self.selectBtn.selected = NO;
        self.selectBtn.backgroundColor = RGBColorHex(0x36394a);
        btn.selected = YES;
        btn.backgroundColor = [UIColor clearColor];
        self.selectBtn = btn;
        NSInteger index = btn.tag -1;
        [self showVC:index];
    }else{
        self.selectBtn.selected = YES;
    }
}
- (void)setupChildViewController{
    _vc1 = [[ETHTradeVC alloc]init];
    [self addChildViewController:_vc1];
    _vc1.type = 0;
    [self.mainView addSubview:_vc1.view];
    [self.view insertSubview:self.mainView belowSubview:self.kindView];
    _vc2 = [[ETHTradeVC alloc]init];
    _vc2.type =1;
    [self addChildViewController:_vc2];
    _vc3 = [[ETHTradeVC alloc]init];
    _vc3.type =2;
    [self addChildViewController:_vc3];
    _vc4 = [[ETHTradeVC alloc]init];
    _vc4.type =3;
    [self addChildViewController:_vc4];
}
- (void)showVC:(NSInteger)index{
    ETHTradeVC *vc = self.childViewControllers[index];
    [self.mainView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    [self.mainView addSubview:vc.view];
    [vc.view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.left.right.equalTo(self.mainView);
    }];
}
@end
