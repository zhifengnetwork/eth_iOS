//
//  ETHListWinnersTableCell.m
//  ETH
//
//  Created by admin on 2019/4/12.
//  Copyright © 2019 admin. All rights reserved.
//

#import "ETHListWinnersTableCell.h"
#import "UIButton+LXMImagePosition.h"

@interface ETHListWinnersTableCell()

@property (nonatomic, strong) UIView *bgView;
@property (nonatomic, strong) UIButton* rankingButton;
@property (nonatomic, strong) UILabel* numberLabel;
@property (nonatomic, strong) UIButton* numberButton;
@property (nonatomic, strong) UIButton* ruleButton;

@end

@implementation ETHListWinnersTableCell

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
    self.contentView.backgroundColor = RGBColorHex(0xf4f4f4);
    [self.contentView addSubview:self.bgView];
    [self.contentView addSubview:self.rankingButton];
    [self.contentView addSubview:self.numberLabel];
    [self.contentView addSubview:self.numberButton];
    [self.contentView addSubview:self.ruleButton];
    
    [_bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.mas_equalTo(0);
        make.height.mas_equalTo(40);
    }];
    
    [_rankingButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->_bgView.mas_left).offset(36);
        make.centerY.equalTo(self->_bgView);
    }];
    
    [_numberLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->_bgView.mas_top).offset(3);
        make.centerX.equalTo(self->_bgView);
    }];
    
    [_numberButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->_numberLabel.mas_bottom).offset(3);
        make.centerX.equalTo(self->_bgView);
        make.width.mas_equalTo(100);
        make.height.mas_equalTo(15);
    }];
    
    [_ruleButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self->_bgView.mas_right).offset(-36);
        make.centerY.equalTo(self->_bgView);
    }];
    
}

- (void)rankingButtonDidClick
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(ETHListWinnersTableCellDidClick:)])
    {
        [self.delegate ETHListWinnersTableCellDidClick:1];
    }
}

- (void)ruleButtonDidClick
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(ETHListWinnersTableCellDidClick:)])
    {
        [self.delegate ETHListWinnersTableCellDidClick:2];
    }
}

- (void)numberButtonDidClick
{
    
}

-(UIView *)bgView
{
    if(_bgView==nil)
    {
        _bgView = [[UIView alloc]initWithFrame:CGRectZero];
        _bgView.backgroundColor = RGBColorHex(0xf4f4f4);
        _bgView.layer.borderWidth = 1.0f;
        _bgView.layer.borderColor = RGBColorHex(0x9a9a9a).CGColor;
    }
    return _bgView;
}

- (UIButton *)rankingButton {
    if (_rankingButton == nil) {
        _rankingButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_rankingButton setTitle:@"中奖名单 排行" forState:UIControlStateNormal];
        [_rankingButton setTitleColor:RGBColorHex(0x5e636d) forState:UIControlStateNormal];
        _rankingButton.titleLabel.font = [UIFont systemFontOfSize:10];
        [_rankingButton addTarget:self action:@selector(rankingButtonDidClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _rankingButton;
}

- (UILabel *)numberLabel {
    if (_numberLabel == nil) {
        _numberLabel = [[UILabel alloc] init];
        _numberLabel.textColor = RGBColorHex(0x5e636d);
        _numberLabel.font = [UIFont systemFontOfSize:10];
        _numberLabel.text = @"期号   开奖号";
    }
    return _numberLabel;
}

- (UIButton *)numberButton {
    if (_numberButton == nil) {
        _numberButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_numberButton setTitle:@"2019/03/22  567" forState:UIControlStateNormal];
        [_numberButton setImage:[UIImage imageNamed:@"drop down"] forState:UIControlStateNormal];
        [_numberButton setTitleColor:RGBColorHex(0x5e636d) forState:UIControlStateNormal];
        _numberButton.titleLabel.font = [UIFont systemFontOfSize:10];
        [_numberButton setImagePosition:LXMImagePositionRight spacing:5];
        _numberButton.layer.borderWidth = 1.0f;
        _numberButton.layer.borderColor = RGBColorHex(0xdadada).CGColor;
        [_numberButton addTarget:self action:@selector(numberButtonDidClick) forControlEvents:UIControlEventTouchUpInside];
        _numberButton.userInteractionEnabled = NO;
    }
    return _numberButton;
}

- (UIButton *)ruleButton {
    if (_ruleButton == nil) {
        _ruleButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_ruleButton setTitle:@"游戏规则" forState:UIControlStateNormal];
        [_ruleButton setTitleColor:RGBColorHex(0x5e636d) forState:UIControlStateNormal];
        _ruleButton.titleLabel.font = [UIFont systemFontOfSize:10];
        [_ruleButton addTarget:self action:@selector(ruleButtonDidClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _ruleButton;
}

@end
