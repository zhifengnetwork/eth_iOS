//
//  ETHDetailTransaction.m
//  ETH
//
//  Created by weiming zhang on 2019/4/9.
//  Copyright © 2019 admin. All rights reserved.
//

#import "ETHDetailTransactionView.h"
@interface ETHDetailTransactionView()
@property (nonatomic, strong)UIView *view1;
@property (nonatomic, strong)UILabel *orderID;
@property (nonatomic, strong)UILabel *buyerID;
@property (nonatomic, strong)UILabel *orderIDLabel;
@property (nonatomic, strong)UILabel *buyerIDLabel;
@property (nonatomic, strong)UIView *view2;
@property (nonatomic, strong)UILabel *unitPrice;
@property (nonatomic, strong)UILabel *number;
@property (nonatomic, strong)UILabel *unitPriceLabel;
@property (nonatomic, strong)UILabel *numberLabel;
@property (nonatomic, strong)UILabel *total;
@property (nonatomic, strong)UILabel *totalLabel;
@end
@implementation ETHDetailTransactionView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}
- (void)setup{
    [self addSubview:self.view1];
    [self.view1 addSubview:self.orderID];
    [self.view1 addSubview:self.buyerID];
    [self.view1 addSubview:self.orderIDLabel];
    [self.view1 addSubview:self.buyerIDLabel];
    [self addSubview:self.view2];
    [self.view2 addSubview:self.unitPrice];
    [self.view2 addSubview:self.number];
    [self.view2 addSubview:self.unitPriceLabel];
    [self.view2 addSubview:self.numberLabel];
    [self addSubview:self.total];
    [self addSubview:self.totalLabel];
    [_view1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).with.offset(15);
        make.left.equalTo(self).with.offset(16);
        make.right.equalTo(self).with.offset(-16);
        make.height.mas_equalTo(64);
    }];
    [_orderID mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.equalTo(self.view1).with.offset(15);
    }];
    [_orderIDLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.orderID.mas_right).with.offset(18);
        make.centerY.equalTo(self.orderID.mas_centerY);
    }];
    [_buyerID mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.orderID.mas_bottom).with.offset(6);
        make.left.equalTo(self.view1).with.offset(15);
    }];
    [_buyerIDLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.buyerID.mas_right).with.offset(18);
        make.centerY.equalTo(self.buyerID.mas_centerY);
    }];
    [_view2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view1.mas_bottom).with.offset(15);
        make.left.equalTo(self).with.offset(16);
        make.right.equalTo(self).with.offset(-16);
        make.height.mas_equalTo(64);
    }];
    [_unitPrice mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.equalTo(self.view2).with.offset(15);
    }];
    [_unitPriceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.unitPrice.mas_right).with.offset(18);
        make.centerY.equalTo(self.unitPrice.mas_centerY);
    }];
    [_number mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.unitPrice.mas_bottom).with.offset(6);
        make.left.equalTo(self.view2).with.offset(15);
    }];
    [_numberLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.number.mas_right).with.offset(18);
        make.centerY.equalTo(self.number.mas_centerY);
    }];
    [_total mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).with.offset(31);
        make.top.equalTo(self.view2.mas_bottom).with.offset(15);
    }];
    [_totalLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.total.mas_right).with.offset(18);
        make.centerY.equalTo(self.total.mas_centerY);
    }];
}
- (UIView *)view1{
    if (_view1 == nil) {
        _view1 = [[UIView alloc]init];
        _view1.layer.cornerRadius = 8;
        _view1.backgroundColor = RGBColorHex(0x4b4f66);
    }
    return _view1;
}
- (UILabel *)orderID{
    if (_orderID == nil) {
        _orderID = [[UILabel alloc]init];
        _orderID.font = [UIFont boldSystemFontOfSize:15];
        _orderID.textColor = RGBColorHex(0x949bc3);
        _orderID.text = @"订 单 号 ：";
    }
    return _orderID;
}
- (UILabel *)orderIDLabel{
    if (_orderIDLabel == nil) {
        _orderIDLabel = [[UILabel alloc]init];
        _orderIDLabel.font = [UIFont boldSystemFontOfSize:15];
        _orderIDLabel.textColor = [UIColor whiteColor];
        _orderIDLabel.text = @"182";
    }
    return _orderIDLabel;
}
- (UILabel *)buyerID{
    if (_buyerID == nil) {
        _buyerID = [[UILabel alloc]init];
        _buyerID.font = [UIFont boldSystemFontOfSize:15];
        _buyerID.textColor = RGBColorHex(0x949bc3);
        _buyerID.text = @"挂 卖 人 ：";
    }
    return _buyerID;
}
- (UILabel *)buyerIDLabel{
    if (_buyerIDLabel == nil) {
        _buyerIDLabel = [[UILabel alloc]init];
        _buyerIDLabel.font = [UIFont boldSystemFontOfSize:15];
        _buyerIDLabel.textColor = [UIColor whiteColor];
        _buyerIDLabel.text = @"18223424832";
    }
    return _buyerIDLabel;
}
- (UIView *)view2{
    if (_view2 == nil) {
        _view2 = [[UIView alloc]init];
        _view2.layer.cornerRadius = 8;
        _view2.backgroundColor = RGBColorHex(0x4b4f66);
    }
    return _view2;
}
- (UILabel *)unitPrice{
    if (_unitPrice == nil) {
        _unitPrice = [[UILabel alloc]init];
        _unitPrice.font = [UIFont systemFontOfSize:15];
        _unitPrice.textColor = RGBColorHex(0x949bc3);
        _unitPrice.text = @"挂卖单价：";
    }
    return _unitPrice;
}
- (UILabel *)unitPriceLabel{
    if (_unitPriceLabel == nil) {
        _unitPriceLabel = [[UILabel alloc]init];
        _unitPriceLabel.font = [UIFont systemFontOfSize:15];
        _unitPriceLabel.textColor = [UIColor whiteColor];
        _unitPriceLabel.text = @"4.00";
    }
    return _unitPriceLabel;
}
- (UILabel *)number{
    if (_number == nil) {
        _number = [[UILabel alloc]init];
        _number.font = [UIFont systemFontOfSize:15];
        _number.textColor = RGBColorHex(0x949bc3);
        _number.text = @"挂卖数量：";
    }
    return _number;
}
- (UILabel *)numberLabel{
    if (_numberLabel == nil) {
        _numberLabel = [[UILabel alloc]init];
        _numberLabel.font = [UIFont systemFontOfSize:15];
        _numberLabel.textColor = [UIColor whiteColor];
        _numberLabel.text = @"2";
    }
    return _numberLabel;
}
- (UILabel *)total{
    if (_total == nil) {
        _total = [[UILabel alloc]init];
        _total.font = [UIFont boldSystemFontOfSize:15];
        _total.textColor = [UIColor whiteColor];
        _total.text = @"待 付 款  ： ";
    }
    return _total;
}
- (UILabel *)totalLabel{
    if (_totalLabel == nil) {
        _totalLabel = [[UILabel alloc]init];
        _totalLabel.font = [UIFont boldSystemFontOfSize:15];
        _totalLabel.textColor = [UIColor whiteColor];
        _totalLabel.text = @"8.00";
    }
    return _totalLabel;
}
@end
