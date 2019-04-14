//
//  ETHSubordinateTableCell.m
//  ETH
//
//  Created by admin on 2019/4/4.
//  Copyright © 2019 admin. All rights reserved.
//

#import "ETHSubordinateTableCell.h"

@interface ETHSubordinateTableCell()

@property (nonatomic, strong) UIView *bgView;
@property (nonatomic, strong) UIImageView* iconView;
@property (nonatomic, strong) UIImageView* starsView;
@property (nonatomic, strong) UILabel* iphoneLabel;
@property (nonatomic, strong) UILabel* timeLabel;
@property (nonatomic, strong) UILabel* telephoneLabel;
@property (nonatomic, strong) UILabel* titleLabel;

@end

@implementation ETHSubordinateTableCell

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
    [self.contentView addSubview:self.iconView];
    [self.contentView addSubview:self.starsView];
    [self.contentView addSubview:self.iphoneLabel];
    [self.contentView addSubview:self.timeLabel];
    [self.contentView addSubview:self.telephoneLabel];
    [self.contentView addSubview:self.titleLabel];
    
    [_bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.right.mas_equalTo(-10);
        make.top.mas_equalTo(0);
        make.height.mas_equalTo(65);
    }];
    
    [_iconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->_bgView.mas_left).offset(10);
        make.top.equalTo(self->_bgView.mas_top).offset(5);
    }];
    
    [_starsView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->_iconView.mas_right).offset(20);
        make.top.equalTo(self->_bgView.mas_top).offset(5);
    }];
    
    [_iphoneLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->_starsView.mas_right).offset(2);
        make.top.equalTo(self->_bgView.mas_top).offset(5);
    }];
    
    [_timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->_iconView.mas_right).offset(20);
        make.top.equalTo(self->_iphoneLabel.mas_bottom).offset(7);
    }];
    
    [_telephoneLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->_iconView.mas_right).offset(20);
        make.top.equalTo(self->_timeLabel.mas_bottom).offset(7);
    }];
    
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self->_bgView.mas_right).offset(-10);
        make.centerY.equalTo(self->_bgView);
    }];
    
    //下面横线
    UIView *hLineView = [[UIView alloc] init];
    hLineView.backgroundColor = RGBColorHex(0x232833);
    [self.contentView addSubview:hLineView];
    
    [hLineView mas_makeConstraints:^(MASConstraintMaker *make)
     {
         make.right.equalTo(self->_titleLabel.mas_left).offset(-8);
         make.centerY.equalTo(self->_titleLabel);
         make.width.mas_equalTo(1.0f);
         make.height.mas_equalTo(10.0f);
     }];
    
}


-(void)setTeamModel:(ETHTeamModel *)teamModel
{
    _teamModel = teamModel;
    _telephoneLabel.text = _teamModel.mobile;
}



-(UIView *)bgView
{
    if(_bgView==nil)
    {
        _bgView = [[UIView alloc]initWithFrame:CGRectZero];
        _bgView.backgroundColor = RGBColorHex(0xf8f8f8);
        _bgView.clipsToBounds = YES;
        _bgView.layer.cornerRadius = 3.0f;
    }
    return _bgView;
}

- (UIImageView *)iconView {
    if (_iconView == nil) {
        _iconView = [[UIImageView alloc] init];
        _iconView.image = [UIImage imageNamed:@"Head portrait"];
    }
    return _iconView;
}

- (UIImageView *)starsView {
    if (_starsView == nil) {
        _starsView = [[UIImageView alloc] init];
        _starsView.image = [UIImage imageNamed:@"Stars"];
    }
    return _starsView;
}

- (UILabel *)iphoneLabel {
    if (_iphoneLabel == nil) {
        _iphoneLabel = [[UILabel alloc] init];
        _iphoneLabel.textColor = RGBColorHex(0x232833);
        _iphoneLabel.font = [UIFont systemFontOfSize:12];
        _iphoneLabel.text = @"184ⅩⅩⅩⅩ3210";
    }
    return _iphoneLabel;
}

- (UILabel *)timeLabel {
    if (_timeLabel == nil) {
        _timeLabel = [[UILabel alloc] init];
        _timeLabel.textColor = RGBColorHex(0x696969);
        _timeLabel.font = [UIFont systemFontOfSize:10];
        _timeLabel.text = @"成为下级时间：2019-02-35 17:45";
    }
    return _timeLabel;
}

- (UILabel *)telephoneLabel {
    if (_telephoneLabel == nil) {
        _telephoneLabel = [[UILabel alloc] init];
        _telephoneLabel.textColor = RGBColorHex(0x5c5f66);
        _telephoneLabel.font = [UIFont systemFontOfSize:12];
        _telephoneLabel.text = @"电话:18458493210";
    }
    return _telephoneLabel;
}

- (UILabel *)titleLabel {
    if (_titleLabel == nil) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.textColor = RGBColorHex(0x232833);
        _titleLabel.font = [UIFont systemFontOfSize:12];
        _titleLabel.text = @"直推";
    }
    return _titleLabel;
}

@end
