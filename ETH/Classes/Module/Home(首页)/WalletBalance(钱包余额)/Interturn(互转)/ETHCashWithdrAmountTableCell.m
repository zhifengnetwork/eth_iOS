//
//  ETHCashWithdrAmountTableCell.m
//  ETH
//
//  Created by admin on 2019/4/11.
//  Copyright © 2019 admin. All rights reserved.
//

#import "ETHCashWithdrAmountTableCell.h"

@interface ETHCashWithdrAmountTableCell()

@property (nonatomic, strong) UIView *bg1View;
@property (nonatomic, strong) UIView *bg2View;
@property (nonatomic, strong) UIView *bg3View;
@property (nonatomic, strong) UILabel* titleLabel;
@property (nonatomic, strong) UILabel* moneyLabel;
@property (nonatomic, strong) UITextField* moneyTextField;
@property (nonatomic, strong) UILabel* idLabel;
@property (nonatomic, strong) UITextField* idTextField;
@property (nonatomic, strong) UILabel* serviceLabel;

@end

@implementation ETHCashWithdrAmountTableCell

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
    self.contentView.backgroundColor = RGBColorHex(0xffffff);
    [self.contentView addSubview:self.bg1View];
    [self.contentView addSubview:self.bg2View];
    [self.contentView addSubview:self.bg3View];
    [self.contentView addSubview:self.titleLabel];
    [self.contentView addSubview:self.moneyLabel];
    [self.contentView addSubview:self.moneyTextField];
    [self.contentView addSubview:self.idLabel];
    [self.contentView addSubview:self.idTextField];
    [self.contentView addSubview:self.serviceLabel];
    
    [_bg1View mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.right.mas_equalTo(-10);
        make.top.mas_equalTo(10);
        make.bottom.mas_equalTo(-10);
    }];
    
    [_bg2View mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->_bg1View.mas_left).offset(10);
        make.top.equalTo(self->_titleLabel.mas_bottom).offset(25);
        make.width.mas_equalTo(225);
        make.height.mas_equalTo(20);
    }];
    
    [_bg3View mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->_bg1View.mas_left).offset(10);
        make.top.equalTo(self->_bg2View.mas_bottom).offset(5);
        make.width.mas_equalTo(225);
        make.height.mas_equalTo(20);
    }];
    
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->_bg1View.mas_left).offset(10);
        make.top.equalTo(self->_bg1View.mas_top).offset(15);
    }];
    
    [_moneyLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->_bg2View.mas_left).offset(10);
        make.centerY.equalTo(self->_bg2View);
    }];
    
    [_moneyTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->_moneyLabel.mas_right).offset(10);
        make.centerY.equalTo(self->_bg2View);
        make.width.mas_equalTo(200);
    }];
    
    [_idLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->_bg3View.mas_left).offset(10);
        make.centerY.equalTo(self->_bg3View);
    }];
    
    [_idTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->_idLabel.mas_right).offset(10);
        make.centerY.equalTo(self->_bg3View);
        make.width.mas_equalTo(195);
    }];
    
    [_serviceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->_bg3View.mas_bottom).offset(18);
        make.left.equalTo(self->_bg1View.mas_left).offset(10);
        make.bottom.equalTo(self->_bg1View.mas_bottom).offset(-10);
    }];
}

-(UIView *)bg1View
{
    if(_bg1View==nil)
    {
        _bg1View = [[UIView alloc]initWithFrame:CGRectZero];
        _bg1View.backgroundColor = RGBColorHex(0xf4f4f4);
        _bg1View.clipsToBounds = YES;
        _bg1View.layer.cornerRadius = 3.0f;
        _bg1View.layer.borderWidth = 1.0f;
        _bg1View.layer.borderColor = RGBColorHex(0xdadada).CGColor;
    }
    return _bg1View;
}

-(UIView *)bg2View
{
    if(_bg2View==nil)
    {
        _bg2View = [[UIView alloc]initWithFrame:CGRectZero];
        _bg2View.backgroundColor = RGBColorHex(0xffffff);
        _bg2View.clipsToBounds = YES;
        _bg2View.layer.cornerRadius = 3.0f;
        _bg2View.layer.borderWidth = 1.0f;
        _bg2View.layer.borderColor = RGBColorHex(0x3d3d3d).CGColor;
    }
    return _bg2View;
}

-(UIView *)bg3View
{
    if(_bg3View==nil)
    {
        _bg3View = [[UIView alloc]initWithFrame:CGRectZero];
        _bg3View.backgroundColor = RGBColorHex(0xffffff);
        _bg3View.clipsToBounds = YES;
        _bg3View.layer.cornerRadius = 3.0f;
        _bg3View.layer.borderWidth = 1.0f;
        _bg3View.layer.borderColor = RGBColorHex(0x3d3d3d).CGColor;
    }
    return _bg3View;
}

- (UILabel *)titleLabel {
    if (_titleLabel == nil) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.textColor = RGBColorHex(0x232833);
        _titleLabel.font = [UIFont systemFontOfSize:12];
        _titleLabel.text = @"当前可提现额度： ¥43808";
    }
    return _titleLabel;
}

- (UILabel *)moneyLabel {
    if (_moneyLabel == nil) {
        _moneyLabel = [[UILabel alloc] init];
        _moneyLabel.textColor = RGBColorHex(0xf80000);
        _moneyLabel.font = [UIFont systemFontOfSize:10];
        _moneyLabel.text = @"¥";
    }
    return _moneyLabel;
}

- (UITextField *)moneyTextField {
    if (_moneyTextField == nil) {
        _moneyTextField = [[UITextField alloc] init];
        _moneyTextField.placeholder = @"";
        _moneyTextField.font = [UIFont systemFontOfSize:12];
        _moneyTextField.textColor = RGBColorHex(0x232833);
        _moneyTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
    }
    return _moneyTextField;
}

- (UILabel *)idLabel {
    if (_idLabel == nil) {
        _idLabel = [[UILabel alloc] init];
        _idLabel.textColor = RGBColorHex(0x232833);
        _idLabel.font = [UIFont systemFontOfSize:12];
        _idLabel.text = @"ID";
    }
    return _idLabel;
}

- (UITextField *)idTextField {
    if (_idTextField == nil) {
        _idTextField = [[UITextField alloc] init];
        _idTextField.placeholder = @"请输入对方ID";
        _idTextField.font = [UIFont systemFontOfSize:10];
        _idTextField.textColor = RGBColorHex(0x232833);
        [_idTextField sizeToFit];
        _idTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
    }
    return _idTextField;
}

- (UILabel *)serviceLabel {
    if (_serviceLabel == nil) {
        _serviceLabel = [[UILabel alloc] init];
        _serviceLabel.textColor = RGBColorHex(0x232833);
        _serviceLabel.font = [UIFont systemFontOfSize:12];
        _serviceLabel.text = @"交易手续费为0.30%";
    }
    return _serviceLabel;
}

@end
