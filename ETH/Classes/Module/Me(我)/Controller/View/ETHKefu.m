//
//  ETHKefu.m
//  ETH
//
//  Created by weiming zhang on 2019/5/21.
//  Copyright © 2019 admin. All rights reserved.
//

#import "ETHKefu.h"
#import "UIImageView+WebCache.h"
@interface ETHKefu()
@property (nonatomic, strong)UIButton *qq;
@property (nonatomic, strong)UIButton *wexin;
@property (nonatomic, strong)UIImageView *imageView;
@property (nonatomic, strong)UIButton *cancelButton;
@end
@implementation ETHKefu

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self setup];
    }return self;
}

- (void)setup{
    self.layer.cornerRadius = 5;
    self.backgroundColor = [UIColor whiteColor];
    [self addSubview:self.qq];
    [self addSubview:self.wexin];
    [self addSubview:self.imageView];
    UIView *lineView= [[UIView alloc]init];
    lineView.backgroundColor = RGBColorHex(0xcccccc);
    [self addSubview:lineView];
    
    UIView *lineView1 = [[UIView alloc]init];
    lineView1.backgroundColor = RGBColorHex(0xcccccc);
    [self addSubview:lineView1];
    UIView *lineView2 = [[UIView alloc]init];
    lineView2.backgroundColor = RGBColorHex(0xcccccc);
    [self addSubview:lineView2];
    [self addSubview:self.cancelButton];
    
    [_qq mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.equalTo(self);
        make.height.mas_equalTo(25);
        make.width.mas_equalTo(self.frame.size.width/2);
    }];
    
    [_wexin mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.top.equalTo(self);
        make.height.mas_equalTo(25);
        make.width.mas_equalTo(self.frame.size.width/2);
    }];
    
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self);
        make.width.mas_equalTo(1);
        make.height.mas_equalTo(25);
        make.centerX.equalTo(self.mas_centerX);
    }];
    
    [lineView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self);
        make.height.mas_equalTo(1);
        make.top.equalTo(self.qq.mas_bottom);
    }];
    
    [_imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.mas_centerX);
        make.centerY.equalTo(self.mas_centerY);
        make.width.height.mas_equalTo(100);
    }];

    
    [_cancelButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.left.right.equalTo(self);
        make.height.mas_equalTo(25);
    }];
    
    [lineView2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.cancelButton.mas_top);
        make.left.right.equalTo(self);
        make.height.mas_equalTo(1);
    }];
}

- (UIButton *)qq{
    if (_qq == nil) {
        _qq = [[UIButton alloc]init];
        [_qq setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [_qq setTitleColor:[UIColor blackColor] forState:UIControlStateSelected];
        [_qq setTitle:@"QQ客服" forState:UIControlStateNormal];
        _qq.tag =10;
        [_qq addTarget:self action:@selector(changeClick:) forControlEvents:UIControlEventTouchUpInside];
    }return _qq;
}

- (UIButton *)wexin{
    if (_wexin == nil) {
        _wexin = [[UIButton alloc]init];
        [_wexin setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [_wexin setTitleColor:[UIColor blackColor] forState:UIControlStateSelected];
        [_wexin setTitle:@"微信客服" forState:UIControlStateNormal];
        _wexin.tag = 100;
        [_wexin addTarget:self action:@selector(changeClick:) forControlEvents:UIControlEventTouchUpInside];
    }return _wexin;
}

- (UIImageView *)imageView{
    if (_imageView == nil) {
        _imageView = [[UIImageView alloc]init];
    
    }return _imageView;
}

- (void)setModel:(UserkefuModel *)model{
    _model = model;
    [self changeClick:self.qq];
    
}

- (UIButton *)cancelButton{
    if (_cancelButton == nil) {
        _cancelButton = [[UIButton alloc]init];
        [_cancelButton setTitle:@"关闭" forState:UIControlStateNormal];
        [_cancelButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_cancelButton addTarget:self action:@selector(cancelClick) forControlEvents:UIControlEventTouchUpInside];
    }return _cancelButton;
}

- (void)changeClick: (UIButton *)btn{
    if (btn.tag == 10) {
        self.wexin.selected = NO;
        self.qq.selected = YES;
        
        if (!kStringIsEmpty(_model.kefufile))
        {
            NSString* str = [NSString stringWithFormat:@"%@%@",ImageUrl,_model.kefufile];
            [_imageView sd_setImageWithURL:[NSURL URLWithString:str]];
        }
    }else{
        self.qq.selected = NO;
        self.wexin.selected = YES;
        
        if (!kStringIsEmpty(_model.wxkffile))
        {
            NSString* str = [NSString stringWithFormat:@"%@%@",ImageUrl,_model.wxkffile];
            [_imageView sd_setImageWithURL:[NSURL URLWithString:str]];
        }
    }
}

- (void)cancelClick{
    [[self currentViewController] dismissViewControllerAnimated:YES completion:nil];
}

//获取当前控制器
- (UIViewController *)currentViewController{
    UIViewController *vc = [UIApplication sharedApplication].keyWindow.rootViewController;
    while (1) {
        if ([vc isKindOfClass:[UITabBarController class]]) {
            vc = ((UITabBarController *)vc).selectedViewController;
        }
        if ([vc isKindOfClass:[UINavigationController class]]) {
            vc = ((UINavigationController *)vc).visibleViewController;
        }
        if (vc.presentedViewController) {
            vc = vc.presentedViewController;
        }else{
            break;
        }
    }
    return vc;
}


@end
