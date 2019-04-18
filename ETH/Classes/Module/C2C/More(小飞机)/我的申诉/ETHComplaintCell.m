//
//  ETHComplaintCell.m
//  ETH
//
//  Created by weiming zhang on 2019/4/18.
//  Copyright © 2019 admin. All rights reserved.
//

#import "ETHComplaintCell.h"
@interface ETHComplaintCell()
@property (nonatomic, strong)UILabel *titleLabel;
@property (nonatomic, strong)UILabel *timeLabel;
@property (nonatomic, strong)UIImageView *jumpImageView;
@end
@implementation ETHComplaintCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
- (void)setFrame:(CGRect)frame{
    frame.origin.x+= 16;
    frame.origin.y+=12;
    frame.size.width-=32;
    frame.size.height-=12;
    [super setFrame:frame];
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setup];
    }return self;
}

- (void)setup{
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.backgroundColor = RGBColorHex(0x4b4f66);
    self.layer.cornerRadius = 4;
    [self.contentView addSubview:self.titleLabel];
    [self.contentView addSubview:self.timeLabel];
    [self.contentView addSubview:self.jumpImageView];
    
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).with.offset(15);
        make.centerY.equalTo(self.mas_centerY);
    }];
    
    [_jumpImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self).with.offset(-30);
        make.centerY.equalTo(self.mas_centerY);
    }];
    
    [_timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.jumpImageView.mas_left).with.offset(-12);
        make.centerY.equalTo(self.mas_centerY);
    }];
}
- (UILabel *)titleLabel{
    if (_titleLabel == nil) {
        _titleLabel = [[UILabel alloc]init];
        _titleLabel.font = [UIFont boldSystemFontOfSize:15];
        _titleLabel.textColor = [UIColor whiteColor];
        _titleLabel.text = @"4154";
    }return _titleLabel;
}

- (UILabel *)timeLabel{
    if (_timeLabel == nil) {
        _timeLabel = [[UILabel alloc]init];
        _timeLabel.font = [UIFont systemFontOfSize:13];
        _timeLabel.textColor = RGBColorHex(0xcccccc);
        _timeLabel.text = @"04-15";
    }return _timeLabel;
}
- (UIImageView *)jumpImageView{
    if (_jumpImageView == nil) {
        _jumpImageView = [[UIImageView alloc]init];
        _jumpImageView.image = [UIImage imageNamed:@"bank-b"];
    }return _jumpImageView;
}
@end
