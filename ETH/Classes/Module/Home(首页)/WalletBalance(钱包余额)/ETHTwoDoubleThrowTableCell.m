//
//  ETHTwoDoubleThrowTableCell.m
//  ETH
//
//  Created by admin on 2019/4/10.
//  Copyright © 2019 admin. All rights reserved.
//

#import "ETHTwoDoubleThrowTableCell.h"

@interface ETHTwoDoubleThrowTableCell ()

@property (nonatomic, strong) UIView *bgView;
@property (nonatomic, strong) UIButton* doubleButton;
@property (nonatomic, strong) UIButton* cashButton;
@property (nonatomic, strong) UIButton* c2cButton;
@property (nonatomic, strong) UIButton* entertainButton;
@property (nonatomic, strong) UIButton* interturnButton;

@end

@implementation ETHTwoDoubleThrowTableCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        [self setup];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return self;
}

- (void)setup
{
    self.contentView.backgroundColor = RGBColorHex(0x080e2c);
    [self.contentView addSubview:self.bgView];
    [self.contentView addSubview:self.doubleButton];
    [self.contentView addSubview:self.cashButton];
    [self.contentView addSubview:self.c2cButton];
    [self.contentView addSubview:self.entertainButton];
    [self.contentView addSubview:self.interturnButton];
    
    [_bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.right.mas_equalTo(-10);
        make.top.mas_equalTo(0);
        make.height.mas_equalTo(60);
    }];
    
    [_doubleButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->_bgView.mas_left).offset(10);
        make.top.equalTo(self->_bgView.mas_top).offset(15);
        make.width.mas_equalTo(75);
        make.height.mas_equalTo(30);
    }];
    
    [_cashButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->_doubleButton.mas_right).offset(12);
        make.top.equalTo(self->_bgView.mas_top).offset(15);
        make.width.mas_equalTo(45);
        make.height.mas_equalTo(30);
    }];
    
    [_c2cButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->_cashButton.mas_right).offset(12);
        make.top.equalTo(self->_bgView.mas_top).offset(15);
        make.width.mas_equalTo(45);
        make.height.mas_equalTo(30);
    }];
    
    [_entertainButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->_c2cButton.mas_right).offset(12);
        make.top.equalTo(self->_bgView.mas_top).offset(15);
        make.width.mas_equalTo(75);
        make.height.mas_equalTo(30);
    }];
    
    [_interturnButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->_entertainButton.mas_right).offset(12);
        make.top.equalTo(self->_bgView.mas_top).offset(15);
        make.width.mas_equalTo(45);
        make.height.mas_equalTo(30);
    }];
    
}

- (void)doubleButtonDidClick
{
    
}

- (void)cashButtonDidClick
{
    
}

- (void)c2cButtonDidClick
{
    
}

- (void)entertainButtonDidClick
{
    
}

- (void)interturnButtonDidClick
{
    
}

-(UIView *)bgView
{
    if(_bgView==nil)
    {
        _bgView = [[UIView alloc]initWithFrame:CGRectZero];
        _bgView.backgroundColor = RGBColorHex(0x475065);
    }
    return _bgView;
}

- (UIButton *)doubleButton {
    if (_doubleButton == nil) {
        _doubleButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_doubleButton setTitle:@"一键复投" forState:UIControlStateNormal];
        [_doubleButton setTitleColor:RGBColorHex(0xffffff) forState:UIControlStateNormal];
        _doubleButton.titleLabel.font = [UIFont systemFontOfSize:15];
        _doubleButton.backgroundColor = RGBColorHex(0xce1717);
        [_doubleButton addTarget:self action:@selector(doubleButtonDidClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _doubleButton;
}

- (UIButton *)cashButton {
    if (_cashButton == nil) {
        _cashButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_cashButton setTitle:@"提现" forState:UIControlStateNormal];
        [_cashButton setTitleColor:RGBColorHex(0xffffff) forState:UIControlStateNormal];
        _cashButton.titleLabel.font = [UIFont systemFontOfSize:15];
        _cashButton.backgroundColor = RGBColorHex(0xce1717);
        [_cashButton addTarget:self action:@selector(cashButtonDidClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _cashButton;
}

- (UIButton *)c2cButton {
    if (_c2cButton == nil) {
        _c2cButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_c2cButton setTitle:@"C2C" forState:UIControlStateNormal];
        [_c2cButton setTitleColor:RGBColorHex(0xffffff) forState:UIControlStateNormal];
        _c2cButton.titleLabel.font = [UIFont systemFontOfSize:15];
        _c2cButton.backgroundColor = RGBColorHex(0xce1717);
        [_c2cButton addTarget:self action:@selector(c2cButtonDidClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _c2cButton;
}

- (UIButton *)entertainButton {
    if (_entertainButton == nil) {
        _entertainButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_entertainButton setTitle:@"棋牌娱乐" forState:UIControlStateNormal];
        [_entertainButton setTitleColor:RGBColorHex(0xffffff) forState:UIControlStateNormal];
        _entertainButton.titleLabel.font = [UIFont systemFontOfSize:15];
        _entertainButton.backgroundColor = RGBColorHex(0xce1717);
        [_entertainButton addTarget:self action:@selector(entertainButtonDidClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _entertainButton;
}

- (UIButton *)interturnButton {
    if (_interturnButton == nil) {
        _interturnButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_interturnButton setTitle:@"互转" forState:UIControlStateNormal];
        [_interturnButton setTitleColor:RGBColorHex(0xffffff) forState:UIControlStateNormal];
        _interturnButton.titleLabel.font = [UIFont systemFontOfSize:15];
        _interturnButton.backgroundColor = RGBColorHex(0xce1717);
        [_interturnButton addTarget:self action:@selector(interturnButtonDidClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _interturnButton;
}


@end
