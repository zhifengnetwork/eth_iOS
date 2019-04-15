//
//  ETHPayBounceView.m
//  ETH
//
//  Created by weiming zhang on 2019/4/13.
//  Copyright © 2019 admin. All rights reserved.
//

#import "ETHPayBounceView.h"
#import "ETHDropDownButton.h"
@interface ETHPayBounceView()
@property (nonatomic, strong)UILabel *freeAccountLabel;
@property (nonatomic, strong)UILabel *reinstateAccountLabel;
@property (nonatomic, strong)UILabel *priceLabel;
@property (nonatomic, strong)UILabel *countLabel;
@property (nonatomic, strong)UIButton *agreeButton;
@property (nonatomic, strong)UIButton *cancelButton;
@end
@implementation ETHPayBounceView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}
- (void)setup{
    self.layer.cornerRadius = 2;
    self.backgroundColor = [UIColor whiteColor];
    [self addSubview:self.freeAccountLabel];
    [self addSubview:self.reinstateAccountLabel];
    [self addSubview:self.priceLabel];
    [self addSubview:self.countLabel];
    [self addSubview:self.agreeButton];
    [self addSubview:self.cancelButton];
    
    ETHDropDownButton *button = [[ETHDropDownButton alloc] init];
    [self addSubview:button];
    [button setupDefaultTable];
    [button setTitle:@"选择支付方式" List:@[@"自由账户", @"复投账户"]];
    
    [_freeAccountLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).with.offset(10);
        make.centerX.equalTo(self.mas_centerX);
    }];
    [_reinstateAccountLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.freeAccountLabel.mas_bottom).with.offset(8);
        make.centerX.equalTo(self.mas_centerX);
    }];
    [_priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.reinstateAccountLabel.mas_bottom).with.offset(8);
        make.centerX.equalTo(self.mas_centerX);
    }];
    [_countLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.priceLabel.mas_bottom).with.offset(8);
        make.centerX.equalTo(self.mas_centerX);
    }];
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.countLabel.mas_bottom).with.offset(10);
        make.left.equalTo(self).with.offset(25);
        make.right.equalTo(self).with.offset(-25);
        make.height.mas_equalTo(27);
    }];
    [_agreeButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(button.mas_bottom).with.offset(55);
        make.left.equalTo(self).with.offset(25);
        make.width.mas_equalTo(125);
        make.height.mas_equalTo(27);
    }];
    [_cancelButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(button.mas_bottom).with.offset(55);
        make.right.equalTo(self).with.offset(-25);
        make.width.mas_equalTo(125);
        make.height.mas_equalTo(27);
    }];
}
- (UILabel *)freeAccountLabel{
    if (_freeAccountLabel == nil) {
        _freeAccountLabel = [[UILabel alloc]init];
        _freeAccountLabel.font = [UIFont systemFontOfSize:12];
        _freeAccountLabel.textColor = RGBColorHex(0x1e2128);
        _freeAccountLabel.text = @"自由账户：638.284274";
    }return _freeAccountLabel;
}
- (UILabel *)reinstateAccountLabel{
    if (_reinstateAccountLabel == nil) {
        _reinstateAccountLabel = [[UILabel alloc]init];
        _reinstateAccountLabel.font = [UIFont systemFontOfSize:12];
        _reinstateAccountLabel.textColor = RGBColorHex(0x1e2128);
        _reinstateAccountLabel.text = @"复投账户：7.284274";
    }return _reinstateAccountLabel;
}
- (UILabel *)priceLabel{
    if (_priceLabel == nil) {
        _priceLabel = [[UILabel alloc]init];
        _priceLabel.font = [UIFont systemFontOfSize:12];
        _priceLabel.textColor = RGBColorHex(0x1e2128);
        _priceLabel.text = @"下注金额：0.010000";
    }return _priceLabel;
}
- (UILabel *)countLabel{
    if (_countLabel == nil) {
        _countLabel = [[UILabel alloc]init];
        _countLabel.font = [UIFont systemFontOfSize:12];
        _countLabel.textColor = RGBColorHex(0x1e2128);
        _countLabel.text = @"下注总数：1注";
    }return _countLabel;
}
- (UIButton *)agreeButton{
    if (_agreeButton == nil) {
        _agreeButton = [[UIButton alloc]init];
        _agreeButton.layer.cornerRadius = 1;
        _agreeButton.backgroundColor = RGBColorHex(0xfc0124);
        [_agreeButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_agreeButton setTitle:@"确定" forState:UIControlStateNormal];
        _agreeButton.titleLabel.font = [UIFont systemFontOfSize:12];
    }return _agreeButton;
}
- (UIButton *)cancelButton{
    if (_cancelButton == nil) {
        _cancelButton = [[UIButton alloc]init];
        _cancelButton.layer.cornerRadius = 1;
        _cancelButton.backgroundColor = RGBColorHex(0x039702);
        [_cancelButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_cancelButton setTitle:@"取消" forState:UIControlStateNormal];
        _cancelButton.titleLabel.font = [UIFont systemFontOfSize:12];
    }return _cancelButton;
}
@end
