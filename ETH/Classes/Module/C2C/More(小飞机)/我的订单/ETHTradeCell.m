//
//  ETHTradeCell.m
//  ETH
//
//  Created by weiming zhang on 2019/4/8.
//  Copyright © 2019 admin. All rights reserved.
//

#import "ETHTradeCell.h"
#import "ETHTradeFailVC.h"
@interface ETHTradeCell()
@property (nonatomic, strong)UILabel *transactionLabel;
@property (nonatomic, strong)UILabel *nameLabel;
@property (nonatomic, strong)UILabel *statusLabel;
@property (nonatomic, strong)UIImageView *jumpImageView;
@property (nonatomic, strong)UIButton *jumpButton;
@property (nonatomic, strong)UILabel *numberLabel;
@property (nonatomic, strong)UILabel *unitpriceLabel;
@property (nonatomic, strong)UILabel *totalLabel;
@property (nonatomic, strong)UILabel *timeLabel;
@end
@implementation ETHTradeCell

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
- (void)setup{
    self.layer.cornerRadius = 8;
    self.backgroundColor = RGBColorHex(0x4b4f66);
    [self.contentView addSubview:self.transactionLabel];
    [self.contentView addSubview:self.nameLabel];
    [self.contentView addSubview:self.statusLabel];
    [self.contentView addSubview:self.jumpImageView];
    [self.contentView addSubview:self.jumpButton];
    [self.contentView addSubview:self.numberLabel];
    [self.contentView addSubview:self.unitpriceLabel];
    [self.contentView addSubview:self.totalLabel];
    [self.contentView addSubview:self.timeLabel];
    [_transactionLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.equalTo(self).with.offset(15);
    }];
    [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.transactionLabel.mas_right).with.offset(12);
        make.centerY.equalTo(self.transactionLabel.mas_centerY);
    }];
    [_jumpImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self).with.offset(-15);
        make.top.equalTo(self).with.offset(15);
    }];
    [_statusLabel mas_makeConstraints:^(MASConstraintMaker *make) {
       make.right.equalTo(self.jumpImageView.mas_left).with.offset(-12);
        make.centerY.equalTo(self.jumpImageView.mas_centerY);
    }];
    [_jumpButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.statusLabel.mas_left);
        make.top.right.equalTo(self);
        make.bottom.equalTo(self.statusLabel.mas_bottom);
    }];
    [_numberLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.transactionLabel.mas_bottom).with.offset(15);
        make.left.equalTo(self).with.offset(15);
    }];
    [_unitpriceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.numberLabel.mas_right).with.offset(40);
        make.centerY.equalTo(self.numberLabel.mas_centerY);
    }];
    [_totalLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.unitpriceLabel.mas_right).with.offset(40);
        make.centerY.equalTo(self.numberLabel.mas_centerY);
    }];
    [_timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.numberLabel.mas_bottom).with.offset(15);
        make.left.equalTo(self).with.offset(15);
    }];
}
- (void)setFrame:(CGRect)frame{
    
    frame.origin.x+= 16;
    frame.origin.y+= 10;
    frame.size.width-=32;
    frame.size.height-= 10;
    [super setFrame:frame];
}
- (UILabel *)transactionLabel{
    if (_transactionLabel == nil) {
        _transactionLabel = [[UILabel alloc]init];
        _transactionLabel.font = [UIFont boldSystemFontOfSize:15];
        _transactionLabel.textColor = RGBColorHex(0xce2f50);
        _transactionLabel.text = @"卖出";
    }
    return _transactionLabel;
}
- (UILabel *)nameLabel{
    if (_nameLabel == nil) {
        _nameLabel = [[UILabel alloc]init];
        _nameLabel.font = [UIFont boldSystemFontOfSize:15];
        _nameLabel.textColor = RGBColorHex(0xf0e68c);
        _nameLabel.text = @"ETH";
    }
    return _nameLabel;
}
- (UIImageView *)jumpImageView{
    if (_jumpImageView == nil) {
        _jumpImageView = [[UIImageView alloc]init];
        _jumpImageView.image = [UIImage imageNamed:@"back-y"];
    }
    return _jumpImageView;
}
- (UILabel *)statusLabel{
    if (_statusLabel == nil) {
        _statusLabel = [[UILabel alloc]init];
        _statusLabel.font = [UIFont systemFontOfSize:13];
        _statusLabel.textColor = RGBColorHex(0xf0e68c);
        _statusLabel.text = @"未交易";
    }
    return _statusLabel;
}
- (UIButton *)jumpButton{
    if (_jumpButton == nil) {
        _jumpButton = [[UIButton alloc]init];
        [_jumpButton addTarget:self action:@selector(jumpClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _jumpButton;
}
- (UILabel *)numberLabel{
    if (_numberLabel == nil) {
        _numberLabel = [[UILabel alloc]init];
        _numberLabel.font = [UIFont systemFontOfSize:13];
        NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:@"8.00/个"];
        NSRange range1 = [[str string] rangeOfString:@"8.00"];
        [str addAttribute:NSForegroundColorAttributeName value:[UIColor whiteColor] range:range1];
        NSRange range2 = [[str string] rangeOfString:@"/个"];
        [str addAttribute:NSForegroundColorAttributeName value:RGBColorHex(0xa4aff1) range:range2];
        _numberLabel.attributedText = str;
    }
    return _numberLabel;
}
- (UILabel *)unitpriceLabel{
    if (_unitpriceLabel == nil) {
        _unitpriceLabel = [[UILabel alloc]init];
        _unitpriceLabel.font = [UIFont systemFontOfSize:13];
        NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:@"$ 4.00"];
        NSRange range1 = [[str string] rangeOfString:@"4.00"];
        [str addAttribute:NSForegroundColorAttributeName value:[UIColor whiteColor] range:range1];
        NSRange range2 = [[str string] rangeOfString:@"$"];
        [str addAttribute:NSForegroundColorAttributeName value:RGBColorHex(0xa4aff1) range:range2];
        _unitpriceLabel.attributedText = str;
    }
    return _unitpriceLabel;
}
- (UILabel *)totalLabel{
    if (_totalLabel == nil) {
        _totalLabel = [[UILabel alloc]init];
        _totalLabel.font = [UIFont systemFontOfSize:13];
        NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:@"总金额(CNY):32.00"];
        NSRange range1 = [[str string] rangeOfString:@"32.00"];
        [str addAttribute:NSForegroundColorAttributeName value:[UIColor whiteColor] range:range1];
        NSRange range2 = [[str string] rangeOfString:@"总金额(CNY):"];
        [str addAttribute:NSForegroundColorAttributeName value:RGBColorHex(0xa4aff1) range:range2];
        _totalLabel.attributedText = str;
    }
    return _totalLabel;
}
- (UILabel *)timeLabel{
    if (_timeLabel == nil) {
        _timeLabel = [[UILabel alloc]init];
        _timeLabel.font = [UIFont systemFontOfSize:11];
        _timeLabel.textColor = RGBColorHex(0x9496a3);
        _timeLabel.text = @"2019-04-08 05:36:43";
    }
    return _timeLabel;
}
#pragma mark --方法
- (void)settransaction:(BOOL)isSell{
    if (isSell == YES) {
        _transactionLabel.textColor = RGBColorHex(0xce2f50);
        _transactionLabel.text = @"卖出";
    }else{
        _transactionLabel.textColor = RGBColorHex(0x70c376);
        _transactionLabel.text = @"买入";
    }
}
- (void)setStatus:(NSString *)status{
    self.statusLabel.text = status;
}
- (UIViewController*)viewController {
    for (UIView* next = [self superview]; next; next = next.superview) {
        UIResponder* nextResponder = [next nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController
                                          class]]) {
            return (UIViewController*)nextResponder;
        }
    }
    return nil;
}
- (void)jumpClick{
    if ([_statusLabel.text isEqualToString:@"交易失败"]) {
        [self viewController].navigationController.navigationBar.hidden = NO;
        ETHTradeFailVC *vc = [[ETHTradeFailVC alloc]init];
        [[self viewController].navigationController pushViewController:vc animated:YES];
    }
}
@end
