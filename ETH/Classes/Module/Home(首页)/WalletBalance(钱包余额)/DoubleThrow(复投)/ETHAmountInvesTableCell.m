//
//  ETHAmountInvesTableCell.m
//  ETH
//
//  Created by admin on 2019/4/10.
//  Copyright © 2019 admin. All rights reserved.
//

#import "ETHAmountInvesTableCell.h"
#import "PPNumberButton.h"

@interface ETHAmountInvesTableCell()<PPNumberButtonDelegate>

@property (nonatomic, strong) UIView *bgView;
@property (nonatomic, strong) UILabel* titleLabel;
@property (nonatomic, strong) PPNumberButton* numberButton;

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
    [self.contentView addSubview:self.numberButton];
    
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
    
    [_numberButton mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self->_bgView.mas_right).offset(-22);
        make.centerY.equalTo(self->_bgView);
        make.width.mas_equalTo(120);
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

-(PPNumberButton* )numberButton
{
    if (_numberButton==nil)
    {
        _numberButton = [PPNumberButton numberButtonWithFrame:CGRectMake(0, 0, 110, 30)];
        // 开启抖动动画
        _numberButton.shakeAnimation = YES;
        _numberButton.currentNumber = 0;
        // 设置最小值
        _numberButton.minValue = 0;
        // 设置最大值
        _numberButton.maxValue = 1000;
        // 设置输入框中的字体大小
        _numberButton.inputFieldFont = 12;
        _numberButton.increaseTitle = @"＋";
        _numberButton.decreaseTitle = @"－";
        _numberButton.delegate = self;
    }
    
    return _numberButton;
}

/**
 加减代理回调
 
 @param numberButton 按钮
 @param number 结果
 @param increaseStatus 是否为加状态
 */
- (void)pp_numberButton:(PPNumberButton *)numberButton number:(NSInteger)number increaseStatus:(BOOL)increaseStatus
{
    if ([self.delegate respondsToSelector:@selector(ETHAmountInvesTableCellInputing: indexPath:)])
    {
        [self.delegate ETHAmountInvesTableCellInputing:[NSString stringWithFormat:@"%ld",number] indexPath:nil];
    }
}

@end
