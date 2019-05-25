//
//  ETHMoneyTransferTableCell.m
//  ETH
//
//  Created by admin on 2019/4/18.
//  Copyright © 2019 admin. All rights reserved.
//

#import "ETHMoneyTransferTableCell.h"

@interface ETHMoneyTransferTableCell ()

@property (nonatomic, strong) UIView *bgView;
@property (nonatomic, strong) UILabel* timeLabel;
@property (nonatomic, strong) UILabel* peopleLabel;
@property (nonatomic, strong) UILabel* moneyLabel;
@property (nonatomic, strong) UILabel* serviceLabel;

@end

@implementation ETHMoneyTransferTableCell

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
    [self.contentView addSubview:self.peopleLabel];
    [self.contentView addSubview:self.moneyLabel];
    [self.contentView addSubview:self.serviceLabel];
    
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
    
    [_peopleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->_bgView.mas_left).offset(10);
        make.top.equalTo(self->_timeLabel.mas_bottom).offset(5);
    }];
    
    [_moneyLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->_bgView.mas_left).offset(10);
        make.top.equalTo(self->_peopleLabel.mas_bottom).offset(5);
    }];
    
    [_serviceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->_bgView.mas_left).offset(10);
        make.top.equalTo(self->_moneyLabel.mas_bottom).offset(5);
    }];
    
}


-(void)setTeamModel:(ETHTeamModel *)teamModel
{
    _teamModel = teamModel;
    _timeLabel.text = [NSString stringWithFormat:@"转账时间：%@",_teamModel.createtime];
    _peopleLabel.text = [NSString stringWithFormat:@"收款人：%@",_teamModel.nickname];
    _moneyLabel.text = [NSString stringWithFormat:@"收款金额：%@个",_teamModel.money2];
    _serviceLabel.text = [NSString stringWithFormat:@"收款手续费：%@个",_teamModel.money];
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
        _timeLabel.text = @"转账时间：2019-3-2 13:34:20";
    }
    return _timeLabel;
}

- (UILabel *)peopleLabel {
    if (_peopleLabel == nil) {
        _peopleLabel = [[UILabel alloc] init];
        _peopleLabel.textColor = RGBColorHex(0xffffff);
        _peopleLabel.font = [UIFont systemFontOfSize:12];
        _peopleLabel.text = @"收款人：";
    }
    return _peopleLabel;
}

- (UILabel *)moneyLabel {
    if (_moneyLabel == nil) {
        _moneyLabel = [[UILabel alloc] init];
        _moneyLabel.textColor = RGBColorHex(0xffffff);
        _moneyLabel.font = [UIFont systemFontOfSize:12];
        _moneyLabel.text = @"收款金额：9999.99个";
    }
    return _moneyLabel;
}

- (UILabel *)serviceLabel {
    if (_serviceLabel == nil) {
        _serviceLabel = [[UILabel alloc] init];
        _serviceLabel.textColor = RGBColorHex(0xffffff);
        _serviceLabel.font = [UIFont systemFontOfSize:12];
        _serviceLabel.text = @"收款手续费：3.0000个";
    }
    return _serviceLabel;
}


@end
