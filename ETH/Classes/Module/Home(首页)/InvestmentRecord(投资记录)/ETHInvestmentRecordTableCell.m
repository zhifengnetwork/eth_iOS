//
//  ETHInvestmentRecordTableCell.m
//  ETH
//
//  Created by admin on 2019/4/3.
//  Copyright © 2019 admin. All rights reserved.
//

#import "ETHInvestmentRecordTableCell.h"

@interface ETHInvestmentRecordTableCell()

@property (nonatomic, strong) UIView *bgView;
@property (nonatomic, strong) UILabel* timeLabel;
@property (nonatomic, strong) UILabel* typeLabel;
@property (nonatomic, strong) UILabel* stateLabel;
@property (nonatomic, strong) UILabel* moneyLabel;

@end

@implementation ETHInvestmentRecordTableCell

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
    [self.contentView addSubview:self.moneyLabel];
    
    [_bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.right.mas_equalTo(-10);
        make.top.mas_equalTo(10);
        make.height.mas_equalTo(90);
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
    
    [_moneyLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->_bgView.mas_left).offset(10);
        make.top.equalTo(self->_stateLabel.mas_bottom).offset(5);
    }];

}


-(void)setTeamModel:(ETHTeamModel *)teamModel
{
    _teamModel = teamModel;
    _timeLabel.text = [NSString stringWithFormat:@"充币时间：%@",_teamModel.createtime];
    _typeLabel.text = [NSString stringWithFormat:@"充币类型：%@",_teamModel.title];
    _moneyLabel.text = [NSString stringWithFormat:@"充币金额：%@",_teamModel.money];
    if ([_teamModel.status isEqualToString:@"0"]) {
        _stateLabel.text = [NSString stringWithFormat:@"投资状态：审核中"];

    }else if ([_teamModel.status isEqualToString:@"1"])
    {
        _stateLabel.text = [NSString stringWithFormat:@"投资状态：成功"];

    }
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
        _timeLabel.text = @"充币时间：2019-3-2 13:34:20";
    }
    return _timeLabel;
}

- (UILabel *)typeLabel {
    if (_typeLabel == nil) {
        _typeLabel = [[UILabel alloc] init];
        _typeLabel.textColor = RGBColorHex(0xffffff);
        _typeLabel.font = [UIFont systemFontOfSize:12];
        _typeLabel.text = @"充币类型：资产投资";
    }
    return _typeLabel;
}

- (UILabel *)stateLabel {
    if (_stateLabel == nil) {
        _stateLabel = [[UILabel alloc] init];
        _stateLabel.textColor = RGBColorHex(0xffffff);
        _stateLabel.font = [UIFont systemFontOfSize:12];
        _stateLabel.text = @"投资状态：成功";
    }
    return _stateLabel;
}

- (UILabel *)moneyLabel {
    if (_moneyLabel == nil) {
        _moneyLabel = [[UILabel alloc] init];
        _moneyLabel.textColor = RGBColorHex(0xffffff);
        _moneyLabel.font = [UIFont systemFontOfSize:12];
        _moneyLabel.text = @"充币金额：555.00";
    }
    return _moneyLabel;
}

@end
