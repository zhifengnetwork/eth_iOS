//
//  ETHCurrentInvestmentTableCell.m
//  ETH
//
//  Created by admin on 2019/4/9.
//  Copyright © 2019 admin. All rights reserved.
//

#import "ETHCurrentInvestmentTableCell.h"
#import "PPNumberButton.h"


@interface ETHCurrentInvestmentTableCell()

@property (nonatomic, strong) UIView *bgView;
@property (nonatomic, strong) UILabel* titleLabel;
@property (nonatomic, strong) UILabel* moneyLabel;

@property (nonatomic, strong) PPNumberButton* numberButton;

@end

@implementation ETHCurrentInvestmentTableCell

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
    [self.contentView addSubview:self.moneyLabel];
    
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
    
    [_moneyLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self->_bgView.mas_right).offset(-22);
        make.centerY.equalTo(self->_bgView);
    }];
    
}

-(void)setTitle:(NSString *)title
{
    _title = title;
    _titleLabel.text = _title;
}

-(void)setName:(NSString *)name
{
    _name = name;
    _moneyLabel.text = _name;
}

-(void)setIsLeftName:(BOOL)isLeftName
{
    _isLeftName = isLeftName;
    if (_isLeftName)
    {
        [_moneyLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self->_titleLabel.mas_right).offset(10);
            make.centerY.equalTo(self->_bgView);
        }];
    }
    else
    {
        [_moneyLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self->_bgView.mas_right).offset(-22);
            make.centerY.equalTo(self->_bgView);
        }];
    }
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
        _titleLabel.text = @"当前投资额：";
    }
    return _titleLabel;
}

- (UILabel *)moneyLabel{
    if (_moneyLabel == nil) {
        _moneyLabel = [[UILabel alloc] init];
        _moneyLabel.textColor = RGBColorHex(0x232833);
        _moneyLabel.font = [UIFont systemFontOfSize:12];
        _moneyLabel.text = @"1.000.00";
    }
    return _moneyLabel;
}

-(PPNumberButton* )numberButton
{
    if (_numberButton==nil)
    {
        _numberButton = [PPNumberButton numberButtonWithFrame:CGRectMake(0, 0, 110, 30)];
        // 开启抖动动画
        _numberButton.shakeAnimation = YES;
        // 设置最小值
        _numberButton.minValue = 1;
        // 设置最大值
        _numberButton.maxValue = 10;
        // 设置输入框中的字体大小
        _numberButton.inputFieldFont = 23;
        _numberButton.increaseTitle = @"＋";
        _numberButton.decreaseTitle = @"－";
        
    }
    
    return _numberButton;
}

@end
