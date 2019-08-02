//
//  ETHQuitView.m
//  ETH
//
//  Created by weiming zhang on 2019/4/27.
//  Copyright © 2019 admin. All rights reserved.
//

#import "ETHQuitView.h"
#import "http_mine.h"
#import "SVProgressHUD.h"
#import "AppDelegate.h"

@interface ETHQuitView()
@property (nonatomic, strong)UIImageView *iconImageView;
@property (nonatomic, strong)UILabel *titleLabel;
@property (nonatomic, strong)UILabel *label1;
@property (nonatomic, strong)UILabel *label2;
@property (nonatomic, strong)UIView *lineView;
@property (nonatomic, strong)UILabel *InvestmentLabal;
@property (nonatomic, strong)UILabel *refundableLabel;
@property (nonatomic, strong)UIButton *cancelButton;
@property (nonatomic, strong)UIButton *confirmButton;
@property (nonatomic, strong)UIView *lineView2;
@property (nonatomic, strong)UIView *lineView3;
@end
@implementation ETHQuitView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}
- (void)setup{
    self.backgroundColor = [UIColor whiteColor];
    self.layer.cornerRadius = 5;
    [self addSubview:self.iconImageView];
    [self addSubview:self.titleLabel];
    [self addSubview:self.label1];
    [self addSubview:self.label2];
    [self addSubview:self.lineView];
    [self addSubview:self.InvestmentLabal];
    [self addSubview:self.refundableLabel];
    [self addSubview:self.cancelButton];
    [self addSubview:self.confirmButton];
    [self addSubview:self.lineView2];
    [self addSubview:self.lineView3];
    
    [_iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).with.offset(17);
        make.left.equalTo(self).with.offset(65);
    }];
    
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.iconImageView.mas_centerY);
        make.left.equalTo(self.iconImageView.mas_right).with.offset(2);
    }];
    
    [_label1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleLabel.mas_bottom).with.offset(25);
        make.left.equalTo(self).with.offset(25.5);
        make.right.equalTo(self).with.offset(-25.5);
    }];
    [_label2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.label1.mas_bottom).with.offset(8.5);
        make.left.equalTo(self).with.offset(25.5);
        make.right.equalTo(self).with.offset(-25.5);
    }];
    [_lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.label2.mas_bottom).with.offset(10);
        make.left.equalTo(self).with.offset(25.5);
        make.right.equalTo(self).with.offset(-25.5);
        make.height.mas_equalTo(1);
    }];
    [_InvestmentLabal mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.lineView.mas_bottom).with.offset(10);
        make.left.equalTo(self.lineView.mas_left);
    }];
    [_refundableLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.InvestmentLabal.mas_bottom).with.offset(5);
        make.left.equalTo(self.lineView.mas_left);
    }];
    [_lineView2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.refundableLabel.mas_bottom).with.offset(80);
        make.left.right.equalTo(self);
        make.height.mas_equalTo(1);
    }];
    [_cancelButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.lineView2.mas_bottom);
        make.left.bottom.equalTo(self);
        make.width.mas_equalTo(128);
    }];
    [_lineView3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(1);
        make.top.equalTo(self.lineView2.mas_bottom);
        make.bottom.equalTo(self);
        make.centerX.equalTo(self.mas_centerX);
    }];
    [_confirmButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(129);
        make.right.bottom.equalTo(self);
        make.top.equalTo(self.cancelButton.mas_top);
    }];
}

- (UIImageView *)iconImageView{
    if (_iconImageView == nil) {
        _iconImageView = [[UIImageView alloc]init];
        _iconImageView.image = [UIImage imageNamed:@"tishi-1"];
    }return _iconImageView;
}

- (UILabel *)titleLabel{
    if (_titleLabel == nil) {
        _titleLabel = [[UILabel alloc]init];
        _titleLabel.font = [UIFont boldSystemFontOfSize:12];
        _titleLabel.textColor = RGBColorHex(0xff0000);
        _titleLabel.text = @"提示： 该操作有风险！";
    }return _titleLabel;
}

- (UILabel *)label1{
    if (_label1 == nil) {
        _label1 = [[UILabel alloc]init];
        _label1.font = [UIFont boldSystemFontOfSize:10];
        _label1.textColor = RGBColorHex(0x666666);
        _label1.numberOfLines = 0;
        _label1.text = @"该操作将锁定您的账户,不能再进行投资和收益，不能解锁账户";
    }return _label1;
}

- (UILabel *)label2{
    if (_label2 == nil) {
        _label2 = [[UILabel alloc]init];
        _label2.font = [UIFont boldSystemFontOfSize:10];
        _label2.textColor = RGBColorHex(0x666666);
        _label2.numberOfLines = 0;
        NSMutableAttributedString *attr = [[NSMutableAttributedString alloc] initWithString:@"退出规则：进行该操作，交易日退出投资的50%，剩下的50% 分5个月退还!取消操作点击不退出"];
        [attr addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:NSMakeRange(37, 9)];
        [_label2 setAttributedText:attr];
    }return _label2;
}

- (UIView *)lineView{
    if (_lineView == nil) {
        _lineView = [[UIView alloc]init];
        _lineView.backgroundColor = RGBColorHex(0x999999);
    }return _lineView;
}

- (UILabel *)InvestmentLabal{
    if (_InvestmentLabal == nil) {
        _InvestmentLabal = [[UILabel alloc]init];
        _InvestmentLabal.font = [UIFont systemFontOfSize:12];
        _InvestmentLabal.textColor = RGBColorHex(0x333333);
        _InvestmentLabal.text = @"投资金额：587.00";
    }return _InvestmentLabal;
}

- (UILabel *)refundableLabel{
    if (_refundableLabel == nil) {
        _refundableLabel = [[UILabel alloc]init];
        _refundableLabel.font = [UIFont systemFontOfSize:12];
        _refundableLabel.textColor = RGBColorHex(0x333333);
        _refundableLabel.text = @"可退金额：587.00";
    }return _refundableLabel;
}

- (UIView *)lineView2{
    if (_lineView2 == nil) {
        _lineView2 = [[UIView alloc]init];
        _lineView2.backgroundColor = RGBColorHex(0x999999);
    }return _lineView2;
}

- (UIView *)lineView3{
    if (_lineView3 == nil) {
        _lineView3 = [[UIView alloc]init];
        _lineView3.backgroundColor = RGBColorHex(0x999999);
    }return _lineView3;
}

- (UIButton *)cancelButton{
    if (_cancelButton == nil) {
        _cancelButton = [[UIButton alloc]init];
        _cancelButton.titleLabel.font = [UIFont systemFontOfSize:12];
        [_cancelButton setTitle:@"不退出" forState:UIControlStateNormal];
        [_cancelButton setTitleColor:RGBColorHex(0x333333) forState:UIControlStateNormal];
        [_cancelButton addTarget:self action:@selector(cancelClick) forControlEvents:UIControlEventTouchUpInside];
    }return _cancelButton;
}

- (UIButton *)confirmButton{
    if (_confirmButton == nil) {
        _confirmButton = [[UIButton alloc]init];
        _confirmButton.titleLabel.font = [UIFont systemFontOfSize:12];
        [_confirmButton setTitle:@"确认退出" forState:UIControlStateNormal];
        [_confirmButton setTitleColor:RGBColorHex(0x333333) forState:UIControlStateNormal];
         [_confirmButton addTarget:self action:@selector(confirmClick) forControlEvents:UIControlEventTouchUpInside];
    }return _confirmButton;
}

#pragma mark --方法

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
- (void)setMoney:(NSString *)money{
    _money = money;
    _InvestmentLabal.text = [NSString stringWithFormat:@"投资金额：%@",money];
    NSLog(@"monney%@",money);

    _refundableLabel.text = [NSString stringWithFormat:@"可退金额：%f",money.floatValue *0.5];
}
- (void)cancelClick{
    [[self currentViewController] dismissViewControllerAnimated:YES completion:nil];
}

- (void)confirmClick{
    [http_mine out:_refundableLabel.text success:^(id responseObject)
     {
         [SVProgressHUD showSuccessWithStatus:@"退出成功"];
         
         AppDelegate * app = (AppDelegate *)[[UIApplication sharedApplication] delegate];
         [app to_LoginVC];
         
     } failure:^(NSError *error) {
         
         [SVProgressHUD showInfoWithStatus:error.domain];
     }];
}
@end
