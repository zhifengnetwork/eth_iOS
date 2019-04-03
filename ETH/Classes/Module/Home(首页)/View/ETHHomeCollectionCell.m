//
//  ETHHomeCollectionCell.m
//  ZF
//
//  Created by apple on 08/03/2019.
//  Copyright © 2019 hyy. All rights reserved.
//

#import "ETHHomeCollectionCell.h"
#import "UIView+HJViewStyle.h"

@interface ETHHomeCollectionCell()

@property (nonatomic, strong) UIImageView* BJiconView;
@property (nonatomic, strong) UIImageView* iconView;
@property (nonatomic, strong) UILabel* nameLabel;
@property (nonatomic, strong) UILabel* numberLabel;

@end

@implementation ETHHomeCollectionCell

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
    [self.contentView addSubview:self.BJiconView];
    [self.contentView addSubview:self.iconView];
    [self.contentView addSubview:self.nameLabel];
    [self.contentView addSubview:self.numberLabel];
    
    [_BJiconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.top.mas_equalTo(15);
    }];
    
    [_iconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->_iconView.mas_top).offset(10);
        make.centerX.equalTo(self->_iconView);
    }];
    
    [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->_iconView.mas_bottom).offset(5);
        make.centerX.equalTo(self->_iconView);
    }];
    
    [_numberLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->_nameLabel.mas_bottom).offset(10);
        make.centerX.equalTo(self->_iconView);
    }];
    
}

- (void)setBackgroundName:(NSString *)backgroundName
{
    _backgroundName = backgroundName;
    _BJiconView.image = [UIImage imageNamed:_backgroundName];
}

-(void)setIconName:(NSString *)iconName
{
    _iconName = iconName;
    _iconView.image = [UIImage imageNamed:_iconName];
}

-(void)setTitle:(NSString *)title
{
    _title = title;
    _nameLabel.text = _title;
}

- (void)setNumber:(NSString *)number
{
    _number = number;
    _numberLabel.text = _number;
}


- (UIImageView *)BJiconView {
    if (_BJiconView == nil) {
        _BJiconView = [[UIImageView alloc] init];
        _BJiconView.image = [UIImage imageNamed:@"Rectangle5"];
        //图标点击事件
        _BJiconView.userInteractionEnabled = YES;
        UITapGestureRecognizer* singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleSingleTap:)];
        [_BJiconView addGestureRecognizer:singleTap];
    }
    return _BJiconView;
}

- (UIImageView *)iconView {
    if (_iconView == nil) {
        _iconView = [[UIImageView alloc] init];
        _iconView.image = [UIImage imageNamed:@"Assets"];
        //图标点击事件
        _iconView.userInteractionEnabled = YES;
        UITapGestureRecognizer* singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleSingleTap:)];
        [_iconView addGestureRecognizer:singleTap];
    }
    return _iconView;
}

- (void)handleSingleTap:(UITouch *)touch
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(ETHHomeCollectionCellDidClick:)])
    {
        [self.delegate ETHHomeCollectionCellDidClick:self.indexPath];
    }
}

- (UILabel *)nameLabel {
    if (_nameLabel == nil) {
        _nameLabel = [[UILabel alloc] init];
        _nameLabel.font = [UIFont systemFontOfSize:15];
        _nameLabel.textColor = RGBColorHex(0xffffff);
        _nameLabel.text = @"投资总额";
        //Label点击事件
        _nameLabel.userInteractionEnabled = YES;
        UITapGestureRecognizer* singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleSingleTap:)];
        [_nameLabel addGestureRecognizer:singleTap];
    }
    return _nameLabel;
}

- (UILabel *)numberLabel {
    if (_numberLabel == nil) {
        _numberLabel = [[UILabel alloc] init];
        _numberLabel.font = [UIFont systemFontOfSize:15];
        _numberLabel.textColor = RGBColorHex(0xffffff);
        _numberLabel.text = @"26003.00";
        //Label点击事件
        _numberLabel.userInteractionEnabled = YES;
        UITapGestureRecognizer* singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleSingleTap:)];
        [_numberLabel addGestureRecognizer:singleTap];
    }
    return _numberLabel;
}


@end
