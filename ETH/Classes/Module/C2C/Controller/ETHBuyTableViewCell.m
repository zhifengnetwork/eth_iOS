//
//  ETHBuyTableViewCell.m
//  ETH
//
//  Created by weiming zhang on 2019/4/5.
//  Copyright © 2019 admin. All rights reserved.
//

#import "ETHBuyTableViewCell.h"
@interface ETHBuyTableViewCell()
@property (nonatomic, strong)UILabel *idLabel;
@property (nonatomic, strong)UILabel *phoneLabel;
@property (nonatomic, strong)UILabel *countLabel;
@property (nonatomic, strong)UILabel *detailCountLabel;
@property (nonatomic, strong)UIImageView *imagView1;
@property (nonatomic, strong)UIImageView *imagView2;
@property (nonatomic, strong)UIImageView *imagView3;
@property (nonatomic, strong)UILabel *priceLabel;
@property (nonatomic, strong)UIButton *btn;
@end
@implementation ETHBuyTableViewCell
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
- (void)setFrame:(CGRect)frame{
    frame.origin.x += 16;
    frame.origin.y += 16;
    frame.size.width -=32;
    frame.size.height -=20;
    [super setFrame:frame];
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
    [self.contentView addSubview:self.idLabel];
    [self.contentView addSubview:self.phoneLabel];
    [self.contentView addSubview:self.countLabel];
    [self.contentView addSubview:self.detailCountLabel];
    [self.contentView addSubview:self.imagView1];
    [self.contentView addSubview:self.imagView2];
    [self.contentView addSubview:self.imagView3];
    [self.contentView addSubview:self.priceLabel];
    [self.contentView addSubview:self.btn];
    [_idLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.equalTo(self).with.offset(15);
    }];
    [_phoneLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.idLabel.mas_bottom).with.offset(10);
        make.left.equalTo(self).with.offset(15);
    }];
    [_countLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.phoneLabel.mas_bottom).with.offset(10);
        make.left.equalTo(self).with.offset(15);
    }];
    [_detailCountLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.phoneLabel.mas_bottom).with.offset(10);
        make.left.equalTo(self.countLabel.mas_right).with.offset(12);
    }];
    [_imagView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.phoneLabel.mas_right).with.offset(10);
        make.centerY.equalTo(self.phoneLabel.mas_centerY);
    }];
    [_imagView2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.imagView1.mas_right).with.offset(7);
        make.centerY.equalTo(self.phoneLabel.mas_centerY);
    }];
    [_imagView3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.imagView2.mas_right).with.offset(7);
        make.centerY.equalTo(self.phoneLabel.mas_centerY);
    }];
    [_priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self).with.offset(-33);
        make.centerY.equalTo(self.phoneLabel.mas_centerY);
    }];
    [_btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.phoneLabel.mas_bottom).with.offset(6);
        make.right.equalTo(self).with.offset(-15);
        make.width.mas_equalTo(60);
        make.height.mas_equalTo(23);
    }];
}
- (UILabel *)idLabel{
    if (_idLabel == nil) {
        _idLabel = [[UILabel alloc]init];
        _idLabel.font = [UIFont boldSystemFontOfSize:15];
        _idLabel.textColor = RGBColorHex(0xcbcbd5);
        _idLabel.text = @"挂卖编号：167";
    }
    return _idLabel;
}
- (UILabel *)phoneLabel{
    if (_phoneLabel == nil) {
        _phoneLabel = [[UILabel alloc]init];
        _phoneLabel.font = [UIFont systemFontOfSize:13];
        _phoneLabel.textColor = RGBColorHex(0xf1f2f8);
        _phoneLabel.text = @"挂单人：134xxxx4592";
    }
    return _phoneLabel;
}
- (UILabel *)countLabel{
    if (_countLabel == nil) {
        _countLabel = [[UILabel alloc]init];
        _countLabel.font = [UIFont systemFontOfSize:13];
        _countLabel.textColor = RGBColorHex(0xf1f2f8);
        _countLabel.text = @"挂单数量";
    }
    return _countLabel;
}
- (UILabel *)detailCountLabel{
    if (_detailCountLabel == nil) {
        _detailCountLabel = [[UILabel alloc]init];
        _detailCountLabel.font = [UIFont systemFontOfSize:13];
        _detailCountLabel.textColor = RGBColorHex(0xf1f2f8);
        _detailCountLabel.text = @"10.00";
    }
    return _detailCountLabel;
}
- (UIImageView *)imagView1{
    if (_imagView1 == nil) {
        _imagView1 = [[UIImageView alloc]init];
        _imagView1.image = [UIImage imageNamed:@"Alipay"];
    }
    return _imagView1;
}
- (UIImageView *)imagView2{
    if (_imagView2 == nil) {
        _imagView2 = [[UIImageView alloc]init];
        _imagView2.image = [UIImage imageNamed:@"WeChat"];
    }
    return _imagView2;
}
- (UIImageView *)imagView3{
    if (_imagView3 == nil) {
        _imagView3 = [[UIImageView alloc]init];
        _imagView3.image = [UIImage imageNamed:@"Bankcard"];
    }
    return _imagView3;
}
- (UILabel *)priceLabel{
    if (_priceLabel == nil) {
        _priceLabel = [[UILabel alloc]init];
        _priceLabel.font = [UIFont systemFontOfSize:13];
        _priceLabel.textColor = RGBColorHex(0xf1f2f8);
        _priceLabel.text =@"￥:4.20";
    }
    return _priceLabel;
}
- (UIButton *)btn{
    if (_btn == nil) {
        _btn = [[UIButton alloc]init];
        _btn.layer.cornerRadius = 5;
        _btn.backgroundColor = RGBColorHex(0xce2f50);
        _btn.titleLabel.font = [UIFont boldSystemFontOfSize:13];
        [_btn setTitleColor:RGBColorHex(0xf1f2f8) forState:UIControlStateNormal];
        [_btn setTitle:@"买入" forState:UIControlStateNormal];
        [_btn addTarget:self action:@selector(buyOrSell) forControlEvents:UIControlEventTouchUpInside];
    }
    return _btn;
}
- (void)setButton:(NSInteger)type{
    if (type == 0) {
        [_btn setTitle:@"买入" forState:UIControlStateNormal];
    }else{
        [_btn setTitle:@"卖出" forState:UIControlStateNormal];
    }
}
#pragma mark --买入或卖出
- (void)buyOrSell{
    
}
@end
