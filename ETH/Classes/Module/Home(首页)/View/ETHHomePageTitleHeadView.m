//
//  ETHHomePageTitleHeadView.m
//  ZF
//
//  Created by apple on 2019/3/2.
//  Copyright © 2019 hyy. All rights reserved.
//

#import "ETHHomePageTitleHeadView.h"

@interface ETHHomePageTitleHeadView()

@property (nonatomic, strong) UIView *bgView;
@property (nonatomic, strong) UIImageView* iconView;
@property (nonatomic, strong) UILabel* noticeLabel;
@property (nonatomic, strong) UILabel* titleLabel;

@end

@implementation ETHHomePageTitleHeadView

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        
        [self setupUI];
    }
    return self;
}

- (void)setupUI
{
    self.backgroundColor = RGBColorHex(0x080e2c);
    [self addSubview:self.bgView];
    [self addSubview:self.iconView];
    [self addSubview:self.noticeLabel];
    [self addSubview:self.titleLabel];
    
    [_bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self);
        make.top.mas_equalTo(10);
        make.height.mas_equalTo(30);
    }];
    
    [_iconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->_bgView.mas_left).offset(10);
        make.centerY.equalTo(self->_bgView);
    }];
    
    [_noticeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->_iconView.mas_right).offset(9);
        make.centerY.equalTo(self->_bgView);;
    }];
    
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->_noticeLabel.mas_right).offset(10);
        make.centerY.equalTo(self->_bgView);;
    }];
    
}

- (UIImageView *)iconView {
    if (_iconView == nil) {
        _iconView = [[UIImageView alloc] init];
        _iconView.image = [UIImage imageNamed:@"Notice"];
    }
    return _iconView;
}

- (UILabel *)noticeLabel {
    if (_noticeLabel == nil) {
        _noticeLabel = [[UILabel alloc] init];
        _noticeLabel.textColor = RGBColorHex(0xfaa526);
        _noticeLabel.font = [UIFont systemFontOfSize:15];
        _noticeLabel.text = @"公告";
    }
    return _noticeLabel;
}

- (UILabel *)titleLabel {
    if (_titleLabel == nil) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.textColor = RGBColorHex(0xffffff);
        _titleLabel.font = [UIFont systemFontOfSize:12];
        _titleLabel.text = @"为什么大家附近规划局规划";
    }
    return _titleLabel;
}

-(UIView *)bgView
{
    if(_bgView==nil)
    {
        _bgView = [[UIView alloc]initWithFrame:CGRectZero];
        _bgView.backgroundColor = RGBColorHex(0x202d67);
    }
    return _bgView;
}

@end
