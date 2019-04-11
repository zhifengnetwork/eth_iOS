//
//  ETHDupAccountTableCell.m
//  ETH
//
//  Created by admin on 2019/4/11.
//  Copyright © 2019 admin. All rights reserved.
//

#import "ETHDupAccountTableCell.h"

@interface ETHDupAccountTableCell()

@property (nonatomic, strong) UIView *bg1View;
@property (nonatomic, strong) UILabel* titleLabel;
@property (nonatomic, strong) UILabel* tipsLabel;

@end

@implementation ETHDupAccountTableCell

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
    [self.contentView addSubview:self.titleLabel];
    [self.contentView addSubview:self.tipsLabel];
    
    [_bg1View mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.right.mas_equalTo(-10);
        make.top.mas_equalTo(0);
        make.height.mas_equalTo(58);
    }];
    
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->_bg1View.mas_left).offset(10);
        make.top.equalTo(self->_bg1View.mas_top).offset(15);
    }];
    
    [_tipsLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->_bg1View.mas_left).offset(10);
        make.top.equalTo(self->_titleLabel.mas_bottom).offset(10);
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

- (UILabel *)titleLabel {
    if (_titleLabel == nil) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.textColor = RGBColorHex(0x232833);
        _titleLabel.font = [UIFont systemFontOfSize:12];
        _titleLabel.text = @"当前可用复投账户余额： ¥0.20";
    }
    return _titleLabel;
}

- (UILabel *)tipsLabel {
    if (_tipsLabel == nil) {
        _tipsLabel = [[UILabel alloc] init];
        _tipsLabel.textColor = RGBColorHex(0xf40415);
        _tipsLabel.font = [UIFont systemFontOfSize:9];
        _tipsLabel.text = @"注：复投账户不可以转账，不可以提现，不可以提到余额。";
    }
    return _tipsLabel;
}


@end
