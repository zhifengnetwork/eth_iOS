//
//  ETHAmountInvesTableCell.m
//  ETH
//
//  Created by admin on 2019/4/10.
//  Copyright © 2019 admin. All rights reserved.
//

#import "ETHAmountInvesTableCell.h"

@interface ETHAmountInvesTableCell()

@property (nonatomic, strong) UIView *bgView;
@property (nonatomic, strong) UILabel* titleLabel;
@property (nonatomic, strong) UITextField* moneyTextField;

@end

@implementation ETHAmountInvesTableCell

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
    [self.contentView addSubview:self.bgView];
    [self.contentView addSubview:self.titleLabel];
    [self.contentView addSubview:self.moneyTextField];
    
    [_bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.right.mas_equalTo(-10);
        make.top.mas_equalTo(0);
        make.height.mas_equalTo(40);
    }];
    
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->_bgView.mas_left).offset(10);
        make.centerY.equalTo(self->_bgView);
    }];
    
    [_moneyTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self->_bgView.mas_right).offset(-22);
        make.centerY.equalTo(self->_bgView);
        make.width.mas_equalTo(165);
        make.height.mas_equalTo(20);
        
    }];
    
}

-(UIView *)bgView
{
    if(_bgView==nil)
    {
        _bgView = [[UIView alloc]initWithFrame:CGRectZero];
        _bgView.backgroundColor = RGBColorHex(0xf4f4f4);
        _bgView.clipsToBounds = YES;
        _bgView.layer.cornerRadius = 3.0f;
        _bgView.layer.borderWidth = 1.0f;
        _bgView.layer.borderColor = RGBColorHex(0x232833).CGColor;
    }
    return _bgView;
}

- (UILabel *)titleLabel {
    if (_titleLabel == nil) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.textColor = RGBColorHex(0x232833);
        _titleLabel.font = [UIFont systemFontOfSize:12];
        _titleLabel.text = @"复投金额：";
    }
    return _titleLabel;
}

- (UITextField *)moneyTextField {
    if (_moneyTextField == nil) {
        _moneyTextField = [[UITextField alloc] init];
        _moneyTextField.placeholder = @"";
        _moneyTextField.font = [UIFont systemFontOfSize:12];
        _moneyTextField.textColor = RGBColorHex(0xf00606);
        _moneyTextField.backgroundColor = RGBColorHex(0xffffff);
        _moneyTextField.layer.borderWidth = 1.0f;
        _moneyTextField.layer.borderColor = RGBColorHex(0x00aa00).CGColor;
        _moneyTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
    }
    return _moneyTextField;
}

@end
