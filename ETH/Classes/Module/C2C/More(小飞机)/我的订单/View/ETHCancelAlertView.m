
//
//  ETHCancelAlertView.m
//  ETH
//
//  Created by weiming zhang on 2019/4/9.
//  Copyright © 2019 admin. All rights reserved.
//

#import "ETHCancelAlertView.h"
#import "http_c2c.h"
#import "SVProgressHUD.h"
#import "ETHNoTransactionVC.h"
#import "UIView+TYAlertView.h"
@interface ETHCancelAlertView()
@property (nonatomic, strong)UILabel *titleLabel;
@property (nonatomic, strong)UIView *lineView;
@property (nonatomic, strong)UIButton *agreeButton;
@end
@implementation ETHCancelAlertView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)setup{
    self.layer.cornerRadius = 10;
    self.backgroundColor = RGBColorHex(0xf0f2f8);
    [self addSubview:self.titleLabel];
    [self addSubview:self.lineView];
    [self addSubview:self.agreeButton];
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).with.offset(25);
        make.centerX.equalTo(self.mas_centerX);
    }];
    [_lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleLabel.mas_bottom).with.offset(25);
        make.left.right.equalTo(self);
        make.height.mas_equalTo(1);
    }];
    [_agreeButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.lineView.mas_bottom);
        make.left.right.bottom.equalTo(self);
    }];
}
- (UILabel *)titleLabel{
    if (_titleLabel == nil) {
        _titleLabel = [[UILabel alloc]init];
        _titleLabel.font = [UIFont boldSystemFontOfSize:14];
        _titleLabel.textColor = RGBColorHex(0x5b5c62);
        _titleLabel.text = @"未交易是否取消";
    }
    return _titleLabel;
}
- (UIView *)lineView{
    if (_lineView == nil) {
        _lineView = [[UIView alloc]init];
        _lineView.backgroundColor = RGBColorHex(0xe3e6f0);
    }
    return _lineView;
}
- (UIButton *)agreeButton{
    if (_agreeButton == nil) {
        _agreeButton = [[UIButton alloc]init];
        _agreeButton.titleLabel.font = [UIFont boldSystemFontOfSize:14];
        [_agreeButton setTitle:@"确定" forState:UIControlStateNormal];
        [_agreeButton setTitleColor:RGBColorHex(0x30323a) forState:UIControlStateNormal];
        [_agreeButton addTarget:self action:@selector(agreeClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _agreeButton;
}
- (UIViewController*)viewController {
    for (UIView* next = [self superview]; next; next = next.superview) {
        UIResponder* nextResponder = [next nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController
                                          class]]) {
            return (UIViewController*)nextResponder;
        }
    }
    return nil;
}
- (void)agreeClick{


    if (self.isNOApi)
    {
        [self cancelButtonDidClick];
        return;
    }
    
    [http_c2c sellout_tab_con:_viewID success:^(id responseObject){
        [[self viewController] dismissViewControllerAnimated:YES completion:nil];
    }failure:^(NSError *error) {
        [SVProgressHUD showErrorWithStatus:error.domain];
    }];
    
}
- (void)setTitle:(NSString *)title{
    self.titleLabel.text = title;
}

- (void)cancelButtonDidClick
{
    [[self currentViewController]dismissViewControllerAnimated:YES completion:nil];
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
