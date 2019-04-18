//
//  ETHTransactionTableCell.m
//  ETH
//
//  Created by admin on 2019/4/4.
//  Copyright © 2019 admin. All rights reserved.
//

#import "ETHTransactionTableCell.h"

@interface ETHTransactionTableCell()

@property (nonatomic, strong) UIView *bgView;
@property (nonatomic, strong) UILabel* timeLabel;
@property (nonatomic, strong) UILabel* numberLabel;
@property (nonatomic, strong) UILabel* moneyLabel;

@end

@implementation ETHTransactionTableCell

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
    self.contentView.backgroundColor = TableViewBGColor;
    [self.contentView addSubview:self.bgView];
    [self.contentView addSubview:self.timeLabel];
    [self.contentView addSubview:self.numberLabel];
    [self.contentView addSubview:self.moneyLabel];
    
    [_bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.right.mas_equalTo(-10);
        make.top.mas_equalTo(0);
        make.height.mas_equalTo(70);
    }];
    
    [_timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->_bgView.mas_left).offset(10);
        make.top.equalTo(self->_bgView.mas_top).offset(10);
    }];
    
    [_numberLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->_bgView.mas_left).offset(10);
        make.top.equalTo(self->_timeLabel.mas_bottom).offset(5);
    }];
    
    [_moneyLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->_bgView.mas_left).offset(10);
        make.top.equalTo(self->_numberLabel.mas_bottom).offset(5);
    }];
    
}

-(void)setTeamModel:(ETHTeamModel *)teamModel
{
    _teamModel = teamModel;
    _timeLabel.text = [NSString stringWithFormat:@"C2C交易时间：%@",_teamModel.createtime];
//    _numberLabel.text = [NSString stringWithFormat:@"ETH数量：C2C交易增加%@",_teamModel.title];
    _moneyLabel.text = [NSString stringWithFormat:@"充币金额：%@",_teamModel.money];
}

-(UIView *)bgView
{
    if(_bgView==nil)
    {
        _bgView = [[UIView alloc]initWithFrame:CGRectZero];
        _bgView.backgroundColor = RGBColorHex(0x232833);
        _bgView.clipsToBounds = YES;
        _bgView.layer.cornerRadius = 3.0f;
    }
    return _bgView;
}

- (UILabel *)timeLabel {
    if (_timeLabel == nil) {
        _timeLabel = [[UILabel alloc] init];
        _timeLabel.textColor = RGBColorHex(0xffffff);
        _timeLabel.font = [UIFont systemFontOfSize:12];
        _timeLabel.text = @"C2C交易时间：2019-03-02 20:45:02";
    }
    return _timeLabel;
}

- (UILabel *)numberLabel {
    if (_numberLabel == nil) {
        _numberLabel = [[UILabel alloc] init];
        _numberLabel.textColor = RGBColorHex(0xffffff);
        _numberLabel.font = [UIFont systemFontOfSize:12];
        _numberLabel.text = @"ETH数量：C2C交易增加10.00";
    }
    return _numberLabel;
}

- (UILabel *)moneyLabel {
    if (_moneyLabel == nil) {
        _moneyLabel = [[UILabel alloc] init];
        _moneyLabel.textColor = RGBColorHex(0xffffff);
        _moneyLabel.font = [UIFont systemFontOfSize:12];
        _moneyLabel.text = @"交易金额：40:00";
    }
    return _moneyLabel;
}


@end
