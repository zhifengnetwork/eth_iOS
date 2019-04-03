//
//  ETHMeTableViewCell.m
//  ETH
//
//  Created by weiming zhang on 2019/4/3.
//  Copyright © 2019年 admin. All rights reserved.
//

#import "ETHMeTableViewCell.h"
@interface ETHMeTableViewCell()
@property (nonatomic, strong)UIImageView *iconImageView;
@property (nonatomic, strong)UILabel *titleLabel;
@property (nonatomic, strong)UIImageView *jumpImageView;
@property (nonatomic, strong)UIView *lineView;
@end
@implementation ETHMeTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setup];
    }
    return self;
}
- (void)setup{
    self.backgroundColor = RGBColorHex(0x142241);
    [self addSubview:self.iconImageView];
    [self addSubview:self.titleLabel];
    [self addSubview:self.jumpImageView];
    [self addSubview:self.lineView];
    [_iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.mas_centerY);
        make.left.equalTo(self).with.offset(10);
        make.width.height.mas_equalTo(15);
    }];
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.mas_centerY);
        make.left.equalTo(self.iconImageView.mas_right).with.offset(8);
    }];
    [_jumpImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self).with.offset(-10);
        make.centerY.equalTo(self.mas_centerY);
    }];
    [_lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self);
        make.height.mas_equalTo(1);
    }];
}
- (UIImageView *)iconImageView{
    if (_iconImageView ==nil) {
        _iconImageView = [[UIImageView alloc]init];
        [_iconImageView setImage:[UIImage imageNamed:@"zhifu"]];
    }
    return _iconImageView;
}
- (UILabel *)titleLabel{
    if (_titleLabel == nil) {
        _titleLabel = [[UILabel alloc]init];
        _titleLabel.font = [UIFont systemFontOfSize:15];
        _titleLabel.textColor = RGBColorHex(0xffffff);
        _titleLabel.text = @"支付管理";
    }
    return _titleLabel;
}
- (UIImageView *)jumpImageView{
    if (_jumpImageView == nil) {
        _jumpImageView =[[UIImageView alloc]init];
        [_jumpImageView setImage:[UIImage imageNamed:@"tiaozhuan"]];
    }
    return _jumpImageView;
}
- (UIView *)lineView{
    if (_lineView ==nil) {
        _lineView = [[UIView alloc]init];
        _lineView.backgroundColor =RGBColorHex(0x353c4d);
    }
    return _lineView;
}
- (void)setIcon:(UIImage *)icon WithText:(NSString *)text{
    self.iconImageView.image = icon;
    self.titleLabel.text = text;
}
@end
