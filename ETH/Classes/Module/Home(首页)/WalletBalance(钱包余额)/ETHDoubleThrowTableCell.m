//
//  ETHDoubleThrowTableCell.m
//  ETH
//
//  Created by admin on 2019/4/9.
//  Copyright © 2019 admin. All rights reserved.
//

#import "ETHDoubleThrowTableCell.h"

@interface ETHDoubleThrowTableCell()

@property (nonatomic, strong) UIView *bgView;
@property (nonatomic, strong) UIButton* doubleButton;
@property (nonatomic, strong) UIButton* entertainButton;

@end

@implementation ETHDoubleThrowTableCell

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
    [self.contentView addSubview:self.entertainButton];
    
    [_bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.right.mas_equalTo(-10);
        make.top.mas_equalTo(0);
        make.height.mas_equalTo(60);
    }];
    
    [_doubleButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->_bgView.mas_left).offset(10);
        make.top.equalTo(self->_bgView.mas_top).offset(12);
        make.width.mas_equalTo(75);
        make.height.mas_equalTo(30);
    }];
    
    [_entertainButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self->_bgView.mas_right).offset(-10);
        make.top.equalTo(self->_bgView.mas_top).offset(12);
        make.width.mas_equalTo(75);
        make.height.mas_equalTo(30);
        
    }];
    
}

- (void)doubleButtonDidClick
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(ETHDoubleThrowTableCellDidClick:)])
    {
        [self.delegate ETHDoubleThrowTableCellDidClick:1];
    }
}

- (void)entertainButtonDidClick
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(ETHDoubleThrowTableCellDidClick:)])
    {
        [self.delegate ETHDoubleThrowTableCellDidClick:2];
    }
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

- (UIButton *)entertainButton {
    if (_entertainButton == nil) {
        _entertainButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_entertainButton setTitle:@" 棋牌娱乐 " forState:UIControlStateNormal];
        [_entertainButton setTitleColor:RGBColorHex(0xffffff) forState:UIControlStateNormal];
        _entertainButton.titleLabel.font = [UIFont systemFontOfSize:15];
        _entertainButton.backgroundColor = RGBColorHex(0xce1717);
        [_entertainButton addTarget:self action:@selector(entertainButtonDidClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _entertainButton;
}
@end
