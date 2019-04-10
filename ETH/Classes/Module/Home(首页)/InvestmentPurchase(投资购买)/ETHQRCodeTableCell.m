//
//  ETHQRCodeTableCell.m
//  ETH
//
//  Created by admin on 2019/4/9.
//  Copyright © 2019 admin. All rights reserved.
//

#import "ETHQRCodeTableCell.h"

@interface ETHQRCodeTableCell()

@property (nonatomic, strong) UILabel* nameLabel;
@property (nonatomic, strong) UIImageView* iconView;

@end

@implementation ETHQRCodeTableCell

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
    [self.contentView addSubview:self.nameLabel];
    [self.contentView addSubview:self.iconView];
    
    [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(20);
        make.centerY.equalTo(self->_iconView);
    }];
    
    [_iconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.centerX.equalTo(self.contentView);
    }];
}

- (void)setTitle:(NSString *)title
{
    _title = title;
    _nameLabel.text = _title;
}

-(void)setIconName:(NSString *)iconName
{
    _iconName = iconName;
    _iconView.image = [UIImage imageNamed:_iconName];
}


- (UILabel *)nameLabel {
    if (_nameLabel == nil) {
        _nameLabel = [[UILabel alloc] init];
        _nameLabel.textColor = RGBColorHex(0x232833);
        _nameLabel.font = [UIFont systemFontOfSize:12];
        _nameLabel.text = @"二维码";
    }
    return _nameLabel;
}

- (UIImageView *)iconView {
    if (_iconView == nil) {
        _iconView = [[UIImageView alloc] init];
        _iconView.image = [UIImage imageNamed:@"QR code"];
    }
    return _iconView;
}


@end
