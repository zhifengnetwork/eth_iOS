//
//  ETHAnnouncementCell.m
//  ETH
//
//  Created by weiming zhang on 2019/4/11.
//  Copyright © 2019 admin. All rights reserved.
//

#import "ETHAnnouncementCell.h"
@interface ETHAnnouncementCell()
@property (nonatomic, strong)UIImageView *iconImageView;
@property (nonatomic, strong)UILabel *headLabel;
@property (nonatomic, strong)UIImageView *rightImageView;
@end
@implementation ETHAnnouncementCell

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
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (void)setup{
    [self.contentView addSubview:self.iconImageView];
    [self.contentView addSubview:self.headLabel];
    [self.contentView addSubview:self.rightImageView];
    [_iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.mas_centerY);
        make.left.equalTo(self).with.offset(10);
        make.width.height.mas_equalTo(50);
    }];
    [_headLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.iconImageView.mas_right).with.offset(16);
        make.centerY.equalTo(self.mas_centerY);
    }];
    [_rightImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self).with.offset(-20);
        make.centerY.equalTo(self.mas_centerY);
    }];
}
- (UIImageView *)iconImageView{
    if (_iconImageView == nil) {
        _iconImageView = [[UIImageView alloc]init];
        _iconImageView.image = [UIImage imageNamed:@"tupian"];
    }return _iconImageView;
}
- (UILabel *)headLabel{
    if (_headLabel == nil) {
        _headLabel = [[UILabel alloc]init];
        _headLabel.font = [UIFont systemFontOfSize:17];
        _headLabel.textColor = RGBColorHex(0x000000);
        _headLabel.text = @"新手训练营";
    }return _headLabel;
}
- (UIImageView *)rightImageView{
    if (_rightImageView == nil) {
        _rightImageView = [[UIImageView alloc]init];
        _rightImageView.image = [UIImage imageNamed:@"tiaozhuan"];
    }return _rightImageView;
}
@end
