//
//  ETHPayBounceView.m
//  ETH
//
//  Created by weiming zhang on 2019/4/13.
//  Copyright © 2019 admin. All rights reserved.
//

#import "ETHPayBounceView.h"
@interface ETHPayBounceView()
@property (nonatomic, strong)UILabel *freeAccountLabel;
@property (nonatomic, strong)UILabel *reinstateAccountLabel;
@property (nonatomic, strong)UILabel *priceLabel;
@property (nonatomic, strong)UILabel *countLabel;
@end
@implementation ETHPayBounceView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}
- (void)setup{
    self.layer.cornerRadius = 2;
    self.backgroundColor = [UIColor whiteColor];
    [self addSubview:self.freeAccountLabel];
    [self addSubview:self.reinstateAccountLabel];
    [self addSubview:self.priceLabel];
    [self addSubview:self.countLabel];
    [_freeAccountLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).with.offset(10);
        make.centerX.equalTo(self.mas_centerX);
    }];
    [_reinstateAccountLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.freeAccountLabel.mas_bottom).with.offset(8);
        make.centerX.equalTo(self.mas_centerX);
    }];
    [_priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.reinstateAccountLabel.mas_bottom).with.offset(8);
        make.centerX.equalTo(self.mas_centerX);
    }];
    [_countLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.priceLabel.mas_bottom).with.offset(8);
        make.centerX.equalTo(self.mas_centerX);
    }];
}
- (UILabel *)freeAccountLabel{
    if (_freeAccountLabel == nil) {
        _freeAccountLabel = [[UILabel alloc]init];
        _freeAccountLabel.font = [UIFont systemFontOfSize:12];
        _freeAccountLabel.textColor = RGBColorHex(0x1e2128);
        _freeAccountLabel.text = @"自由账户：638.284274";
    }return _freeAccountLabel;
}
- (UILabel *)reinstateAccountLabel{
    if (_reinstateAccountLabel == nil) {
        _reinstateAccountLabel = [[UILabel alloc]init];
        _reinstateAccountLabel.font = [UIFont systemFontOfSize:12];
        _reinstateAccountLabel.textColor = RGBColorHex(0x1e2128);
        _reinstateAccountLabel.text = @"复投账户：7.284274";
    }return _reinstateAccountLabel;
}
- (UILabel *)priceLabel{
    if (_priceLabel == nil) {
        _priceLabel = [[UILabel alloc]init];
        _priceLabel.font = [UIFont systemFontOfSize:12];
        _priceLabel.textColor = RGBColorHex(0x1e2128);
        _priceLabel.text = @"下注金额：0.010000";
    }return _priceLabel;
}
- (UILabel *)countLabel{
    if (_countLabel == nil) {
        _countLabel = [[UILabel alloc]init];
        _countLabel.font = [UIFont systemFontOfSize:12];
        _countLabel.textColor = RGBColorHex(0x1e2128);
        _countLabel.text = @"下注总数：1注";
    }return _countLabel;
}
@end
