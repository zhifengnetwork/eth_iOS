//
//  ETHPaymentTableCell.m
//  ZF
//
//  Created by apple on 2019/3/5.
//  Copyright © 2019 hyy. All rights reserved.
//

#import "ETHPaymentTableCell.h"

@interface ETHPaymentTableCell()

@end

@implementation ETHPaymentTableCell

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
    
    [self.contentView addSubview:self.paymentButton];
    
    [_paymentButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(0);
        make.left.mas_equalTo(10);
        make.right.mas_equalTo(-10);
        make.height.mas_equalTo(40);
    }];
}

-(void)setTitle:(NSString *)title
{
    _title = title;
    
    [_paymentButton setTitle:_title forState:UIControlStateNormal];
}


- (void)paymentButtonDidClick
{
    
}

- (UIButton *)paymentButton {
    if (_paymentButton == nil) {
        _paymentButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _paymentButton.backgroundColor = RGBColorHex(0x039702);
        [_paymentButton setTitle:@"付款" forState:UIControlStateNormal];
        _paymentButton.titleLabel.font = [UIFont systemFontOfSize:15];
        [_paymentButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _paymentButton.layer.cornerRadius = 3;
        _paymentButton.clipsToBounds = YES;
        //不接受点击事件
        _paymentButton.userInteractionEnabled = NO;
        [_paymentButton addTarget:self action:@selector(paymentButtonDidClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _paymentButton;
}


@end
