//
//  ETHTradeCell.m
//  ETH
//
//  Created by weiming zhang on 2019/4/8.
//  Copyright © 2019 admin. All rights reserved.
//

#import "ETHTradeCell.h"
#import "ETHTradeFailVC.h"
#import "ETHNoTransactionVC.h"
#import "ETHTradingVC.h"
#import "ETHTradeSuccessVC.h"

@interface ETHTradeCell()
@property (nonatomic, strong)UILabel *transactionLabel;
@property (nonatomic, strong)UILabel *nameLabel;
@property (nonatomic, strong)UILabel *statusLabel;
@property (nonatomic, strong)UIImageView *jumpImageView;
@property (nonatomic, strong)UIButton *jumpButton;
@property (nonatomic, strong)UILabel *numberLabel;
@property (nonatomic, strong)UILabel *numberLabel2;
@property (nonatomic, strong)UILabel *unitpriceLabel;
@property (nonatomic, strong)UILabel *unitpriceLabel2;
@property (nonatomic, strong)UILabel *totalLabel;
@property (nonatomic, strong)UILabel *totalLabel2;
@property (nonatomic, strong)UILabel *timeLabel;

@end

@implementation ETHTradeCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    // Initialization code
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setup];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return self;
}
- (void)setup{
    self.layer.cornerRadius = 8;
    self.backgroundColor = RGBColorHex(0x4b4f66);
    [self.contentView addSubview:self.transactionLabel];
    [self.contentView addSubview:self.nameLabel];
    [self.contentView addSubview:self.statusLabel];
    [self.contentView addSubview:self.jumpImageView];
    [self.contentView addSubview:self.jumpButton];
    [self.contentView addSubview:self.numberLabel];
    [self.contentView addSubview:self.numberLabel2];
    [self.contentView addSubview:self.unitpriceLabel];
    [self.contentView addSubview:self.unitpriceLabel2];
    [self.contentView addSubview:self.totalLabel];
    [self.contentView addSubview:self.totalLabel2];
    [self.contentView addSubview:self.timeLabel];

    [_transactionLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.equalTo(self).with.offset(15);
    }];
    [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.transactionLabel.mas_right).with.offset(12);
        make.centerY.equalTo(self.transactionLabel.mas_centerY);
    }];
    [_jumpImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self).with.offset(-15);
        make.top.equalTo(self).with.offset(15);
    }];
    [_statusLabel mas_makeConstraints:^(MASConstraintMaker *make) {
       make.right.equalTo(self.jumpImageView.mas_left).with.offset(-12);
        make.centerY.equalTo(self.jumpImageView.mas_centerY);
    }];
    [_jumpButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.statusLabel.mas_left);
        make.top.right.equalTo(self);
        make.bottom.equalTo(self.statusLabel.mas_bottom);
    }];
    [_numberLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.transactionLabel.mas_bottom).with.offset(15);
        make.left.equalTo(self).with.offset(15);
    }];
    [_numberLabel2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.transactionLabel.mas_bottom).with.offset(15);
        make.left.equalTo(self.numberLabel.mas_right);
    }];
    [_unitpriceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.numberLabel2.mas_right).with.offset(15);
        make.centerY.equalTo(self.numberLabel.mas_centerY);
    }];
    [_unitpriceLabel2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.unitpriceLabel.mas_right);
        make.centerY.equalTo(self.numberLabel.mas_centerY);
    }];
    [_totalLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.unitpriceLabel2.mas_right).with.offset(15);
        make.centerY.equalTo(self.numberLabel.mas_centerY);
    }];
    [_totalLabel2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.numberLabel.mas_centerY);
        make.left.equalTo(self.totalLabel.mas_right);
    }];
    [_timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.numberLabel.mas_bottom).with.offset(15);
        make.left.equalTo(self).with.offset(15);
    }];

}
- (void)setFrame:(CGRect)frame{
    
    frame.origin.x+= 16;
    frame.origin.y+= 10;
    frame.size.width-=32;
    frame.size.height-= 10;
    [super setFrame:frame];
}
- (UILabel *)transactionLabel{
    if (_transactionLabel == nil) {
        _transactionLabel = [[UILabel alloc]init];
        _transactionLabel.font = [UIFont boldSystemFontOfSize:15];
        _transactionLabel.textColor = RGBColorHex(0xce2f50);
        _transactionLabel.text = @"卖出";
    }
    return _transactionLabel;
}
- (UILabel *)nameLabel{
    if (_nameLabel == nil) {
        _nameLabel = [[UILabel alloc]init];
        _nameLabel.font = [UIFont boldSystemFontOfSize:15];
        _nameLabel.textColor = RGBColorHex(0xf0e68c);
        _nameLabel.text = @"ETH";
    }
    return _nameLabel;
}
- (UIImageView *)jumpImageView{
    if (_jumpImageView == nil) {
        _jumpImageView = [[UIImageView alloc]init];
        _jumpImageView.image = [UIImage imageNamed:@"back-y"];
    }
    return _jumpImageView;
}
- (UILabel *)statusLabel{
    if (_statusLabel == nil) {
        _statusLabel = [[UILabel alloc]init];
        _statusLabel.font = [UIFont systemFontOfSize:13];
        _statusLabel.textColor = RGBColorHex(0xf0e68c);
        _statusLabel.text = @"未交易";
    }
    return _statusLabel;
}
- (UIButton *)jumpButton{
    if (_jumpButton == nil) {
        _jumpButton = [[UIButton alloc]init];
        [_jumpButton addTarget:self action:@selector(jumpClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _jumpButton;
}
- (UILabel *)numberLabel{
    if (_numberLabel == nil) {
        _numberLabel = [[UILabel alloc]init];
        _numberLabel.font = [UIFont systemFontOfSize:13];
        _numberLabel.text = @"8.00";
        _numberLabel.textColor = [UIColor whiteColor];
    }
    return _numberLabel;
}
- (UILabel *)numberLabel2{
    if (_numberLabel2 == nil) {
        _numberLabel2 = [[UILabel alloc]init];
        _numberLabel2.font = [UIFont systemFontOfSize:13];
        _numberLabel2.text = @"/个";
        _numberLabel2.textColor = RGBColorHex(0xa4aff1);
    }
    return _numberLabel2;
}
- (UILabel *)unitpriceLabel{
    if (_unitpriceLabel == nil) {
        _unitpriceLabel = [[UILabel alloc]init];
        _unitpriceLabel.font = [UIFont systemFontOfSize:13];
        _unitpriceLabel.text = @"$";
        _unitpriceLabel.textColor = RGBColorHex(0xa4aff1);
    }
    return _unitpriceLabel;
}

- (UILabel *)unitpriceLabel2{
    if (_unitpriceLabel2 == nil) {
        _unitpriceLabel2 = [[UILabel alloc]init];
        _unitpriceLabel2.font = [UIFont systemFontOfSize:13];
        _unitpriceLabel2.text = @"4.000000";
        _unitpriceLabel2.textColor = [UIColor whiteColor];
    }
    return _unitpriceLabel2;
}

- (UILabel *)totalLabel{
    if (_totalLabel == nil) {
        _totalLabel = [[UILabel alloc]init];
        _totalLabel.font = [UIFont systemFontOfSize:13];
        _totalLabel.text = @"总金额(CNY):";
        _totalLabel.textColor = RGBColorHex(0xa4aff1);
    }
    return _totalLabel;
}

- (UILabel *)totalLabel2{
    if (_totalLabel2 == nil) {
        _totalLabel2 = [[UILabel alloc]init];
        _totalLabel2.font = [UIFont systemFontOfSize:13];
        _totalLabel2.text = @"16.000000";
        _totalLabel2.textColor = [UIColor whiteColor];
    }
    return _totalLabel2;
}

- (UILabel *)timeLabel{
    if (_timeLabel == nil) {
        _timeLabel = [[UILabel alloc]init];
        _timeLabel.font = [UIFont systemFontOfSize:11];
        _timeLabel.textColor = RGBColorHex(0x9496a3);
        _timeLabel.text = @"2019-04-08 05:36:43";
    }
    return _timeLabel;
}

#pragma mark --方法

- (void)setStatus:(NSString *)status{
    self.statusLabel.text = status;
}
- (void)setModel:(ETHC2CModel *)model{
    _model = model;
    if (model.type.intValue == 1) {
        _transactionLabel.text = @"买入";
        _transactionLabel.textColor = RGBColorHex(0x70c376);
    }else{
        _transactionLabel.text = @"卖出";
        _transactionLabel.textColor = RGBColorHex(0xce2f50);
    }
    _numberLabel.text = [NSString stringWithFormat:@"%@",model.trx];
    _unitpriceLabel2.text = [NSString stringWithFormat:@"%@",model.price];
     _totalLabel2.text = [NSString stringWithFormat:@"%@",model.money];
    _timeLabel.text = [NSString stringWithFormat:@"%@",model.datatime];
}
- (UIViewController*)viewController {
    for (UIView* next = [self superview]; next; next = next.superview) {
        UIResponder* nextResponder = [next nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController
                                          class]]) {
            return (UIViewController*)nextResponder;
        }
    }
    return nil;
}
- (void)jumpClick{
    [self viewController].navigationController.navigationBar.hidden = NO;
    if ([_statusLabel.text isEqualToString:@"交易失败"]) {
        ETHTradeFailVC *vc = [[ETHTradeFailVC alloc]init];
        vc.vcID = _model.ID;
        [[self viewController].navigationController pushViewController:vc animated:YES];
    }else if ([_statusLabel.text isEqualToString:@"未交易"]){
        ETHNoTransactionVC *vc1 = [[ETHNoTransactionVC alloc]init];
        vc1.vcID = _model.ID;
        [[self viewController].navigationController pushViewController:vc1 animated:YES];
    }else if ([_statusLabel.text isEqualToString:@"交易中"]){
        ETHTradingVC *vc2 = [[ETHTradingVC alloc]init];
        vc2.vcID = _model.ID;
        [[self viewController].navigationController pushViewController:vc2 animated:YES];
    }else{
        ETHTradeSuccessVC *vc3 = [[ETHTradeSuccessVC alloc]init];
        vc3.vcID = _model.ID;
        [[self viewController].navigationController pushViewController:vc3 animated:YES];
    }
}
@end
