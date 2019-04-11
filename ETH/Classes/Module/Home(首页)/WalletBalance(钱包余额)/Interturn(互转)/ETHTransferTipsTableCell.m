//
//  ETHTransferTipsTableCell.m
//  ETH
//
//  Created by admin on 2019/4/11.
//  Copyright © 2019 admin. All rights reserved.
//

#import "ETHTransferTipsTableCell.h"

@interface ETHTransferTipsTableCell()

@property (nonatomic, strong) UILabel* titleLabel;

@end

@implementation ETHTransferTipsTableCell

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
    [self.contentView addSubview:self.titleLabel];
    
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.top.mas_equalTo(0);
    }];
}


- (UILabel *)titleLabel {
    if (_titleLabel == nil) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.textColor = RGBColorHex(0xf80000);
        _titleLabel.font = [UIFont systemFontOfSize:9];
        _titleLabel.text = @"提示:转账前请提前与对方沟通，一旦转出将无法追回,请谨慎操作!!!";
    }
    return _titleLabel;
}

@end
