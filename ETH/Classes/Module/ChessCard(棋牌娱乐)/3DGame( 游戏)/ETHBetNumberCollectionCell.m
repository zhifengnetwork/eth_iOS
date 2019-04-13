//
//  ETHBetNumberCollectionCell.m
//  ZF
//
//  Created by apple on 08/03/2019.
//  Copyright © 2019 hyy. All rights reserved.
//

#import "ETHBetNumberCollectionCell.h"
#import "UIView+HJViewStyle.h"

@interface ETHBetNumberCollectionCell()

@property (nonatomic, strong) UIButton* numberButton;

@end

@implementation ETHBetNumberCollectionCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self setup];
    }
    return self;
}

- (void)setup
{
    self.contentView.backgroundColor = RGBColorHex(0xf4f4f4);
    [self.contentView addSubview:self.numberButton];
    
    [_numberButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.contentView);
        make.top.mas_equalTo(12);
        make.width.height.mas_equalTo(30);
    }];
    
}

- (void)numberButtonDidClick
{
    
}

-(void)setTitle:(NSString *)title
{
    _title = title;
    [_numberButton setTitle:_title forState:UIControlStateNormal];
}

-(void)setIsSelect:(BOOL)isSelect
{
    _isSelect = isSelect;
}

- (UIButton *)numberButton {
    if (_numberButton == nil) {
        _numberButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_numberButton setTitle:@"1" forState:UIControlStateNormal];
        [_numberButton setTitleColor:RGBColorHex(0xfc0124) forState:UIControlStateNormal];
        _numberButton.titleLabel.font = [UIFont systemFontOfSize:12];
        _numberButton.backgroundColor = RGBColorHex(0xffffff);
        _numberButton.clipsToBounds = YES;
        _numberButton.layer.cornerRadius = 15.0f;
        _numberButton.layer.borderWidth = 1.0f;
        _numberButton.layer.borderColor = RGBColorHex(0x4b4b4b).CGColor;
        [_numberButton addTarget:self action:@selector(numberButtonDidClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _numberButton;
}

@end
