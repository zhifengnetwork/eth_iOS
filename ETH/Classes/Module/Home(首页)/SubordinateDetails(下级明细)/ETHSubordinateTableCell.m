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
@property (nonatomic, strong) UILabel* titleLabel;
@property (nonatomic, strong) UILabel *phoneNumLbl;

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
    [self.contentView addSubview:self.titleLabel];
    [self.contentView addSubview:self.phoneNumLbl];
    
    [_bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.right.mas_equalTo(-10);
        make.top.equalTo(self.contentView.mas_top);
        make.bottom.equalTo(self.contentView.mas_bottom);
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
    
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self->_bgView.mas_right).offset(-10);
        make.centerY.equalTo(self->_bgView);
    }];
    
    [self.phoneNumLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.timeLabel.mas_bottom).with.offset(7);
        make.left.equalTo(self->_iconView.mas_right).offset(20);
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
    _iphoneLabel.text = _teamModel.nickname;
    _timeLabel.text = _teamModel.createtime;
    if (teamModel.type == 1) {
        _titleLabel.text = @"直推";
    }else{
        _titleLabel.text = @"团队";
    }
    self.phoneNumLbl.hidden = !teamModel.isChoice;
    
    self.phoneNumLbl.text = [NSString stringWithFormat:@"电话：%@",teamModel.mobile];
    
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

- (UILabel *)titleLabel {
    if (_titleLabel == nil) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.textColor = RGBColorHex(0x232833);
        _titleLabel.font = [UIFont systemFontOfSize:12];
        _titleLabel.text = @"直推";
    }
    return _titleLabel;
}

- (UILabel *)phoneNumLbl {
    if (!_phoneNumLbl) {
        _phoneNumLbl = [UILabel new];
        _phoneNumLbl.textColor = RGBColorHex(0x696969);
        _phoneNumLbl.font = [UIFont systemFontOfSize:12];
        _phoneNumLbl.hidden = YES;
    }
    return _phoneNumLbl;
}
@end
