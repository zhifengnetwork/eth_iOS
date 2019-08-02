//
//  ETHAllRecordCell.m
//  ETH
//
//  Created by weiming zhang on 2019/5/25.
//  Copyright © 2019 admin. All rights reserved.
//

#import "ETHAllRecordCell.h"
@interface ETHAllRecordCell()
@property (nonatomic, strong) UIView *bgView;
@property (nonatomic, strong) UILabel* timeLabel;
@property (nonatomic, strong) UILabel* typeLabel;
@property (nonatomic, strong) UILabel *stateLabel;
@property (nonatomic, strong) UILabel* moneyWithLabel;
@property (nonatomic, strong) UILabel* actualAmountLabel;
@property (nonatomic, strong) UILabel *serviceChargeLabel;
@end
@implementation ETHAllRecordCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

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
    

//    if (_teamModel.type ==3) {
//        [_serviceChargeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.left.equalTo(self->_bgView.mas_left).offset(10);
//            make.top.equalTo(self->_actualAmountLabel.mas_bottom).offset(5);
//        }];
//        [_bgView mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.left.mas_equalTo(10);
//            make.right.mas_equalTo(-10);
//            make.top.mas_equalTo(10);
//            make.height.mas_equalTo(120);
//        }];
//
//    }else{
        [_bgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(10);
            make.right.mas_equalTo(-10);
            make.top.mas_equalTo(2);
            make.bottom.mas_equalTo(-2);
        }];
    //时间
    [_timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->_bgView.mas_left).offset(10);
        make.top.equalTo(self->_bgView.mas_top).offset(10);
    }];
    //交易金额
    [_typeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->_bgView.mas_left).offset(10);
        make.top.equalTo(self->_timeLabel.mas_bottom).offset(5);
    }];
    //描述
    [_stateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->_bgView.mas_left).offset(10);
        make.top.equalTo(self->_typeLabel.mas_bottom).offset(5);
    }];
//自由账户可用余额
    [_moneyWithLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->_bgView.mas_left).offset(10);
        make.top.equalTo(self->_stateLabel.mas_bottom).offset(5);
    }];
//手续费
    [_actualAmountLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->_bgView.mas_left).offset(10);
        make.top.equalTo(self->_moneyWithLabel.mas_bottom).offset(5);
    }];
    [_serviceChargeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->_bgView.mas_left).offset(10);
        make.top.equalTo(self->_actualAmountLabel.mas_bottom).offset(5);
    }];
    
    
}

- (void)setTeamModel:(ETHTeamModel *)teamModel{
    _teamModel = teamModel;
    
    
//    if ([teamModel.title isEqualToString:@"自由账户一键复投"]) {
    if (teamModel.type == 5) {
    
        _timeLabel.text = [NSString stringWithFormat:@"时间：%@",teamModel.createtime];
        _typeLabel.text = [NSString stringWithFormat:@"交易金额：%@",teamModel.RMB];
        _stateLabel.text = [NSString stringWithFormat:@"描述：%@",teamModel.title];
//        _moneyWithLabel.text = [NSString stringWithFormat:@"自由账户可用余额：%@",teamModel.after_money];
        if ([_teamModel.typec2c isEqualToString:@"1"]) {
            _moneyWithLabel.text = [NSString stringWithFormat:@""];

        }else{
            _moneyWithLabel.text = [NSString stringWithFormat:@""];
        }
        _actualAmountLabel.hidden = YES;
        _serviceChargeLabel.hidden = YES;
        _moneyWithLabel.hidden = NO;

    }else if (teamModel.type == 2){
        _timeLabel.text = [NSString stringWithFormat:@"时间：%@",teamModel.createtime];
        _typeLabel.text = [NSString stringWithFormat:@"交易金额：%@",teamModel.money];
        _stateLabel.text = [NSString stringWithFormat:@"描述：%@",teamModel.title];
        _moneyWithLabel.text = [NSString stringWithFormat:@"复投账户可用余额：%@",teamModel.after_money];
        _actualAmountLabel.hidden = YES;
        _serviceChargeLabel.hidden = YES;
        _moneyWithLabel.hidden = NO;

    }else if ([teamModel.title isEqualToString:@"转币"]){//[teamModel.title isEqualToString:@"转币"]
        _timeLabel.text = [NSString stringWithFormat:@"时间：%@",teamModel.createtime];
        _typeLabel.text = [NSString stringWithFormat:@"描述：%@",teamModel.title];
        _stateLabel.text = [NSString stringWithFormat:@"转币人：%@",teamModel.openid];
        _moneyWithLabel.text = [NSString stringWithFormat:@"得币人：%@",teamModel.openid2];
        _actualAmountLabel.text = [NSString stringWithFormat:@"手续费：%@",teamModel.money2];
       _serviceChargeLabel.text = [NSString stringWithFormat:@"数量：%@",teamModel.money];
        _actualAmountLabel.hidden = NO;
        _serviceChargeLabel.hidden = NO;
        _moneyWithLabel.hidden = NO;

   }
//    [teamModel.title isEqualToString:@"ETH提现余额"]
    else if ([teamModel.title isEqualToString:@"ETH提现余额"]||[teamModel.title isEqualToString:@"ETH提币余额"]){
        _timeLabel.text = [NSString stringWithFormat:@"时间：%@",teamModel.createtime];
        _typeLabel.text = [NSString stringWithFormat:@"交易金额：%@",teamModel.money];
        _stateLabel.text = [NSString stringWithFormat:@"描述：%@",teamModel.title];
       _moneyWithLabel.text = [NSString stringWithFormat:@"实到金额：%@",teamModel.realmoney];
        _actualAmountLabel.text = [NSString stringWithFormat:@"手续费：%@",teamModel.charge];
        _serviceChargeLabel.text = [NSString stringWithFormat:@"自由账户可用余额：%@",teamModel.after_money];
        _actualAmountLabel.hidden = NO;
        _serviceChargeLabel.hidden = NO;
        _moneyWithLabel.hidden = NO;

    }
     else{
        _timeLabel.text = [NSString stringWithFormat:@"时间：%@",teamModel.createtime];
        _typeLabel.text = [NSString stringWithFormat:@"交易金额：%@",teamModel.money];
        _stateLabel.text = [NSString stringWithFormat:@"描述：%@",teamModel.title];
//        if ([teamModel.shouxufei containsString:@"-"]) {
//            _moneyWithLabel.hidden = NO;
//             _moneyWithLabel.text = [NSString stringWithFormat:@"%@",@"hdkjfhkjf"];
//        }else{
//            _moneyWithLabel.text = [NSString stringWithFormat:@"手续费：%@",teamModel.shouxufei];
//            _moneyWithLabel.hidden = NO;
//        }
         if ([_moneyWithLabel.text isEqualToString:@""]) {
             _moneyWithLabel.text = @" ";
         }else{
//          _moneyWithLabel.text = [NSString stringWithFormat:@"自由账户可用余额：%@",teamModel.after_money];
         }
          _moneyWithLabel.hidden = NO;
        _actualAmountLabel.hidden = YES;
         _serviceChargeLabel.hidden = YES;

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
        _timeLabel.text = @"时间：2019-3-2";
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
- (UILabel *)serviceChargeLabel
{
    
    if (_serviceChargeLabel == nil) {
        _serviceChargeLabel = [[UILabel alloc] init];
        _serviceChargeLabel.textColor = RGBColorHex(0xffffff);
        _serviceChargeLabel.font = [UIFont systemFontOfSize:12];
        _serviceChargeLabel.text = @"金额：5.00000个";
    }
    return _serviceChargeLabel;
}
@end
