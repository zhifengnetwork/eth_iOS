//
//  ETHRecordWithableCell.m
//  ETH
//
//  Created by admin on 2019/4/18.
//  Copyright © 2019 admin. All rights reserved.
//

#import "ETHRecordWithableCell.h"

@interface ETHRecordWithableCell()

@property (nonatomic, strong) UIView *bgView;
@property (nonatomic, strong) UILabel* timeLabel;
@property (nonatomic, strong) UILabel* typeLabel;
@property (nonatomic, strong) UILabel *stateLabel;
@property (nonatomic, strong) UILabel* moneyWithLabel;
@property (nonatomic, strong) UILabel* actualAmountLabel;
@property (nonatomic, strong) UILabel* serviceChargeLabel;

@end

@implementation ETHRecordWithableCell

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
    [self.contentView addSubview:self.typeLabel];
    [self.contentView addSubview:self.stateLabel];
    [self.contentView addSubview:self.moneyWithLabel];
    [self.contentView addSubview:self.actualAmountLabel];
    [self.contentView addSubview:self.serviceChargeLabel];
    
    [_bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.right.mas_equalTo(-10);
        make.top.mas_equalTo(10);
        make.height.mas_equalTo(130);
    }];
    
    [_timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->_bgView.mas_left).offset(10);
        make.top.equalTo(self->_bgView.mas_top).offset(10);
    }];
    
    [_typeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->_bgView.mas_left).offset(10);
        make.top.equalTo(self->_timeLabel.mas_bottom).offset(5);
    }];
    
    [_stateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->_bgView.mas_left).offset(10);
        make.top.equalTo(self->_typeLabel.mas_bottom).offset(5);
    }];
    
    [_moneyWithLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->_bgView.mas_left).offset(10);
        make.top.equalTo(self->_stateLabel.mas_bottom).offset(5);
    }];
    
    [_actualAmountLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->_bgView.mas_left).offset(10);
        make.top.equalTo(self->_moneyWithLabel.mas_bottom).offset(5);
    }];
    
    [_serviceChargeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->_bgView.mas_left).offset(10);
        make.top.equalTo(self->_actualAmountLabel.mas_bottom).offset(5);
    }];
    
}


-(void)setTeamModel:(ETHTeamModel *)teamModel
{
    _teamModel = teamModel;
    _timeLabel.text = [NSString stringWithFormat:@"提币时间：%@",_teamModel.createtime];
    _typeLabel.text = [NSString stringWithFormat:@"提币类型：%@",_teamModel.title];
    _moneyWithLabel.text = [NSString stringWithFormat:@"提币金额：%@个：",_teamModel.money];
    _actualAmountLabel.text = [NSString stringWithFormat:@"实到金额：%@个",_teamModel.realmoney];
    _serviceChargeLabel.text = [NSString stringWithFormat:@"手续费：%@个",_teamModel.charge];
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
        _timeLabel.text = @"提币时间：2019-3-2 13:34:20";
    }
    return _timeLabel;
}

- (UILabel *)typeLabel {
    if (_typeLabel == nil) {
        _typeLabel = [[UILabel alloc] init];
        _typeLabel.textColor = RGBColorHex(0xffffff);
        _typeLabel.font = [UIFont systemFontOfSize:12];
        _typeLabel.text = @"提币类型：ETH提现金额";
    }
    return _typeLabel;
}

- (UILabel *)stateLabel {
    if (_stateLabel == nil) {
        _stateLabel = [[UILabel alloc] init];
        _stateLabel.textColor = RGBColorHex(0xffffff);
        _stateLabel.font = [UIFont systemFontOfSize:12];
        _stateLabel.text = @"提币状态：审核中";
    }
    return _stateLabel;
}

- (UILabel *)moneyWithLabel {
    if (_moneyWithLabel == nil) {
        _moneyWithLabel = [[UILabel alloc] init];
        _moneyWithLabel.textColor = RGBColorHex(0xffffff);
        _moneyWithLabel.font = [UIFont systemFontOfSize:12];
        _moneyWithLabel.text = @"提币金额：5.00000个";
    }
    return _moneyWithLabel;
}

- (UILabel *)actualAmountLabel {
    if (_actualAmountLabel == nil) {
        _actualAmountLabel = [[UILabel alloc] init];
        _actualAmountLabel.textColor = RGBColorHex(0xffffff);
        _actualAmountLabel.font = [UIFont systemFontOfSize:12];
        _actualAmountLabel.text = @"实到金额：5.00000个";
    }
    return _actualAmountLabel;
}

- (UILabel *)serviceChargeLabel {
    if (_serviceChargeLabel == nil) {
        _serviceChargeLabel = [[UILabel alloc] init];
        _serviceChargeLabel.textColor = RGBColorHex(0xffffff);
        _serviceChargeLabel.font = [UIFont systemFontOfSize:12];
        _serviceChargeLabel.text = @"手续费：0.280000个";
    }
    return _serviceChargeLabel;
}

@end
