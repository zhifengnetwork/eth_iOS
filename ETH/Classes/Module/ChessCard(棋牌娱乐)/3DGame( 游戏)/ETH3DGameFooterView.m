//
//  ETH3DGameFooterView.m
//  ZF
//
//  Created by admin on 2019/3/27.
//  Copyright © 2019 hyy. All rights reserved.
//

#import "ETH3DGameFooterView.h"

@interface ETH3DGameFooterView()

@property (nonatomic, strong) UILabel* titleLabel;
@property (nonatomic, strong) UIButton* confirmButton;

@end

@implementation ETH3DGameFooterView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)setup
{
    self.backgroundColor = RGBColorHex(0xf4f4f4);
    [self addSubview:self.titleLabel];
    [self addSubview:self.confirmButton];

    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.centerY.equalTo(self);
    }];

    [_confirmButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-10);
        make.centerY.equalTo(self);
        make.width.mas_equalTo(60);
        make.height.mas_equalTo(20);
    }];

}

- (void)confirmButtonDidClick
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(ETH3DGameFooterViewDidClick)])
    {
        [self.delegate ETH3DGameFooterViewDidClick];
    }
}

- (UILabel *)titleLabel {
    if (_titleLabel == nil) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.textColor = RGBColorHex(0xfc0124);
        _titleLabel.font = [UIFont systemFontOfSize:12];
        _titleLabel.text = @"单价:0.001000";
    }
    return _titleLabel;
}

- (UIButton *)confirmButton {
    if (_confirmButton == nil) {
        _confirmButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_confirmButton setTitle:@"确定投注" forState:UIControlStateNormal];
        [_confirmButton setTitleColor:RGBColorHex(0xffffff) forState:UIControlStateNormal];
        _confirmButton.backgroundColor = RGBColorHex(0xfc0124);
        _confirmButton.titleLabel.font = [UIFont systemFontOfSize:12];
        [_confirmButton addTarget:self action:@selector(confirmButtonDidClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _confirmButton;
}


@end
