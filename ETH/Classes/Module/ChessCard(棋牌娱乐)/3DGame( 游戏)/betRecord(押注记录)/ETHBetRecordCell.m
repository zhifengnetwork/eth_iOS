//
//  ETHBetRecordCell.m
//  ETH
//
//  Created by weiming zhang on 2019/4/17.
//  Copyright © 2019 admin. All rights reserved.
//

#import "ETHBetRecordCell.h"
@interface ETHBetRecordCell()
@property (nonatomic, strong)UILabel *timeLabel;
@property (nonatomic, strong)UILabel *amountLabel;
@property (nonatomic, strong)UILabel *numberLabel;
@property (nonatomic, strong)UILabel *issuesNumberLabel;
@property (nonatomic, strong)UILabel *multipleLabel;
@property (nonatomic, strong)UILabel *lotteryLabel;
@end
@implementation ETHBetRecordCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
}

- (void)setFrame:(CGRect)frame{
    frame.origin.x+= 10;
    frame.origin.y+= 5;
    frame.size.width-=20;
    frame.size.height-=5;
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
    self.backgroundColor = RGBColorHex(0x475065);
    self.layer.cornerRadius = 2;
    
    [self.contentView addSubview:self.timeLabel];
    [self.contentView addSubview:self.amountLabel];
    [self.contentView addSubview:self.numberLabel];
    [self.contentView addSubview:self.issuesNumberLabel];
    [self.contentView addSubview:self.multipleLabel];
    [self.contentView addSubview:self.lotteryLabel];
    
    [_timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.equalTo(self).with.offset(10);
    }];
    [_amountLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).with.offset(10);
        make.top.equalTo(self.timeLabel.mas_bottom).with.offset(7);
    }];
    [_numberLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).with.offset(10);
        make.top.equalTo(self.amountLabel.mas_bottom).with.offset(7);
    }];
    [_issuesNumberLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self).with.offset(-20);
        make.top.equalTo(self).with.offset(11);
    }];
    [_multipleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.issuesNumberLabel.mas_left);
        make.top.equalTo(self.issuesNumberLabel.mas_bottom).with.offset(7);
    }];
    [_lotteryLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.multipleLabel.mas_left);
        make.top.equalTo(self.multipleLabel.mas_bottom).with.offset(7);
    }];
}

- (UILabel *)timeLabel{
    if (_timeLabel == nil) {
        _timeLabel = [[UILabel alloc]init];
        _timeLabel.font = [UIFont systemFontOfSize:12];
        _timeLabel.textColor = [UIColor whiteColor];
        _timeLabel.text = @"时间：2019-04-11 04:18:34";
    }return _timeLabel;
}

- (UILabel *)amountLabel{
    if (_amountLabel == nil) {
        _amountLabel = [[UILabel alloc]init];
        _amountLabel.font = [UIFont systemFontOfSize:12];
        _amountLabel.textColor = [UIColor whiteColor];
        _amountLabel.text = @"投注金额：0.001000";
    }return _amountLabel;
}

- (UILabel *)numberLabel{
    if (_numberLabel == nil) {
        _numberLabel = [[UILabel alloc]init];
        _numberLabel.font = [UIFont systemFontOfSize:12];
        _numberLabel.textColor = [UIColor whiteColor];
        _numberLabel.text = @"投注号码：223";
    }return _numberLabel;
}

- (UILabel *)issuesNumberLabel{
    if (_issuesNumberLabel == nil) {
        _issuesNumberLabel = [[UILabel alloc]init];
        _issuesNumberLabel.font = [UIFont systemFontOfSize:12];
        _issuesNumberLabel.textColor = [UIColor whiteColor];
        _issuesNumberLabel.text = @"期数：1095";
    }return _issuesNumberLabel;
}

- (UILabel *)multipleLabel{
    if (_multipleLabel == nil) {
        _multipleLabel = [[UILabel alloc]init];
        _multipleLabel.font = [UIFont systemFontOfSize:12];
        _multipleLabel.textColor = [UIColor whiteColor];
        _multipleLabel.text = @"倍数:1";
    }return _multipleLabel;
}

- (UILabel *)lotteryLabel{
    if (_lotteryLabel == nil) {
        _lotteryLabel = [[UILabel alloc]init];
        _lotteryLabel.font = [UIFont systemFontOfSize:12];
        _lotteryLabel.textColor = RGBColorHex(0x0bb543);
        _lotteryLabel.text = @"未开奖";
        
    
        
        
    }return _lotteryLabel;
}
- (void)setRecordModel:(ETHBetRecordModel *)recordModel{
    _recordModel = recordModel;
    _timeLabel.text = [NSString stringWithFormat:@"时间：%@",recordModel.createtime];
    _amountLabel.text = [NSString stringWithFormat:@"投注金额：%@",recordModel.money];
    _numberLabel.text = [NSString stringWithFormat:@"投注号码：%@",recordModel.number];
    _issuesNumberLabel.text = [NSString stringWithFormat:@"期数：%@",recordModel.ID];
    _multipleLabel.text = [NSString stringWithFormat:@"倍数：%@",recordModel.multiple];
    if (recordModel.thigh.intValue == 0) {
        _lotteryLabel.textColor = RGBColorHex(0x0bb543);
        _lotteryLabel.text = @"未开奖";
    }else{
        _lotteryLabel.textColor = RGBColorHex(0xf70426);
        _lotteryLabel.text = @"已开奖";
    }
}
@end
