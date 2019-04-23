//
//  ETHBuyTableViewCell.m
//  ETH
//
//  Created by weiming zhang on 2019/4/5.
//  Copyright © 2019 admin. All rights reserved.
//

#import "ETHBuyTableViewCell.h"
#import "http_c2c.h"
#import "SVProgressHUD.h"
#import "MJExtension.h"
#import "RefreshGifHeader.h"

@interface ETHBuyTableViewCell()
@property (nonatomic, strong)UILabel *idLabel;
@property (nonatomic, strong)UILabel *phoneLabel;
@property (nonatomic, strong)UILabel *countLabel;
@property (nonatomic, strong)UILabel *detailCountLabel;
@property (nonatomic, strong)UILabel *timeLabel;
@property (nonatomic, strong)UIImageView *imagView1;
@property (nonatomic, strong)UIImageView *imagView2;
@property (nonatomic, strong)UIImageView *imagView3;
@property (nonatomic, strong)UILabel *priceLabel;
@property (nonatomic, strong)UIButton *btn;
@property (nonatomic, assign)NSInteger type;

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
    frame.size.height -=16;
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
    [self.contentView addSubview:self.timeLabel];
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
    [_timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.countLabel.mas_bottom).with.offset(10);
        make.left.equalTo(self).with.offset(15);
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
        make.right.equalTo(self).with.offset(-20);
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
- (UILabel *)timeLabel{
    if (_timeLabel == nil) {
        _timeLabel = [[UILabel alloc]init];
        _timeLabel.font = [UIFont systemFontOfSize:13];
        _timeLabel.textColor = RGBColorHex(0xf1f2f8);
        _timeLabel.text = @"挂单时间: 2019-04-19 11:37:05";
    }
    return _timeLabel;
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
    _type = type;
    if (type == 0) {
        [_btn setTitle:@"买入" forState:UIControlStateNormal];
    }else{
        [_btn setTitle:@"卖出" forState:UIControlStateNormal];
    }
}

- (void)setC2cModel:(ETHC2CModel *)c2cModel{
    _c2cModel = c2cModel;
    _idLabel.text = [NSString stringWithFormat:@"挂卖编号：%@",c2cModel.ID];
    _phoneLabel.text = [NSString stringWithFormat:@"挂单人：%@",c2cModel.nickname];
    _detailCountLabel.text = [NSString stringWithFormat:@"%@",c2cModel.trx];
    _timeLabel.text = [NSString stringWithFormat:@"挂单时间: %@",c2cModel.createtime];
    if (c2cModel.zfbfile.intValue == 1) {
        _imagView1.hidden = NO;
    }else{
        _imagView1.hidden = YES;
    }
    if (c2cModel.wxfile.intValue == 1) {
        _imagView2.hidden = NO;
    }else{
        _imagView2.hidden = YES;
    }
    if (c2cModel.bank.intValue == 1) {
        _imagView3.hidden = NO;
    }else{
        _imagView3.hidden = YES;
    }
    _priceLabel.text = [NSString stringWithFormat:@"￥: %@",c2cModel.price];
}

#pragma mark --买入或卖出
- (void)buyOrSell{
    if (_type == 0) {
        if (_c2cModel.mine.intValue == 1)//判断该信息是否是自己发布的（未交易时） 1为自己 0为别人 做买入卖出的判断
        {   [SVProgressHUD showInfoWithStatus:@"不能买入自己发放的账单"];
            return;
        }
        //c2c首页点击卖出或者买入按钮 0买入 1卖出
        [http_c2c sellout:_c2cModel.ID type:@"0" success:^(id responseObject)
         {
             [SVProgressHUD showInfoWithStatus:@"买入成功"];
         } failure:^(NSError *error) {
             [SVProgressHUD showErrorWithStatus:error.domain];
         }];
    }else{
        if (_c2cModel.mine.intValue == 1)//判断该信息是否是自己发布的（未交易时） 1为自己 0为别人 做买入卖出的判断
        {   [SVProgressHUD showInfoWithStatus:@"不能卖出自己发放的账单"];
            return;
        }
        //c2c首页点击卖出或者买入按钮 0买入 1卖出
        [http_c2c sellout:_c2cModel.ID type:@"1" success:^(id responseObject)
         {
             [SVProgressHUD showInfoWithStatus:@"卖出成功"];
         } failure:^(NSError *error) {
             [SVProgressHUD showErrorWithStatus:error.domain];
         }];
    }
//    if (_c2cModel.self3.intValue == 0) {//是否在交易中 1交易中 0不在交易中 做买入卖出的判断
//        [SVProgressHUD showInfoWithStatus:@"您不处于交易中"];
//        return;
//    }
    
    
    
}
@end
