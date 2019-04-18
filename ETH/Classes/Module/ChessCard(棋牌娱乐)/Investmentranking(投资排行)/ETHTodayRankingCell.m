
//
//  ETHTodayRankingCell.m
//  ETH
//
//  Created by weiming zhang on 2019/4/17.
//  Copyright © 2019 admin. All rights reserved.
//

#import "ETHTodayRankingCell.h"
#import "ZFXuXianView.h"
@interface ETHTodayRankingCell()
@property (nonatomic, strong)UILabel *rankLabel;
@property (nonatomic, strong)UILabel *idLabel;
@property (nonatomic, strong)UILabel *nameLabel;
@property (nonatomic, strong)UILabel *winProbabilitylLabel;
@property (nonatomic, strong)UILabel *investmentAmountLabel;
@property (nonatomic, strong)ZFXuXianView *lineView;
@end
@implementation ETHTodayRankingCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setup];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }return self;
}
- (void)setup{
    self.backgroundColor = [UIColor clearColor];
    [self.contentView addSubview:self.rankLabel];
    [self.contentView addSubview:self.idLabel];
    [self.contentView addSubview:self.nameLabel];
    [self.contentView addSubview:self.winProbabilitylLabel];
    [self.contentView addSubview:self.investmentAmountLabel];
    [self.contentView addSubview:self.lineView];
    [_rankLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).with.offset(9);
        make.top.equalTo(self).with.offset(8);
    }];
    
    [_idLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.rankLabel.mas_right).with.offset(18);
        make.centerY.equalTo(self.rankLabel.mas_centerY);
    }];
    
    [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.idLabel.mas_right).with.offset(9);
        make.centerY.equalTo(self.rankLabel.mas_centerY);
    }];
    
    [_winProbabilitylLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.nameLabel.mas_right).with.offset(8);
        make.centerY.equalTo(self.rankLabel.mas_centerY);
    }];
    
    [_investmentAmountLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.winProbabilitylLabel.mas_right).with.offset(33);
        make.centerY.equalTo(self.rankLabel.mas_centerY);
    }];
    
    [_lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).with.offset(9);
        make.right.equalTo(self).with.offset(-9);
        make.bottom.equalTo(self);
        make.height.mas_equalTo(1);
    }];
}

- (UILabel *)rankLabel{
    if (_rankLabel == nil) {
        _rankLabel = [[UILabel alloc]init];
        _rankLabel.font = [UIFont systemFontOfSize:10];
        _rankLabel.textColor = [UIColor whiteColor];
        _rankLabel.text = @"第1名";
    }return _rankLabel;
}

- (UILabel *)idLabel{
    if (_idLabel == nil) {
        _idLabel = [[UILabel alloc]init];
        _idLabel.font = [UIFont systemFontOfSize:10];
        _idLabel.textColor = [UIColor whiteColor];
        _idLabel.text = @"36585";
    }return _idLabel;
}

- (UILabel *)nameLabel{
    if (_nameLabel == nil) {
        _nameLabel = [[UILabel alloc]init];
        _nameLabel.font = [UIFont systemFontOfSize:10];
        _nameLabel.textColor = [UIColor whiteColor];
        _nameLabel.text = @"189XXXX3924";
    }return _nameLabel;
}

- (UILabel *)winProbabilitylLabel{
    if (_winProbabilitylLabel == nil) {
        _winProbabilitylLabel = [[UILabel alloc]init];
        _winProbabilitylLabel.font = [UIFont systemFontOfSize:10];
        _winProbabilitylLabel.textColor = [UIColor whiteColor];
        _winProbabilitylLabel.text = @"0.183934(8%)";
    }return _winProbabilitylLabel;
}

- (UILabel *)investmentAmountLabel{
    if (_investmentAmountLabel == nil) {
        _investmentAmountLabel = [[UILabel alloc]init];
        _investmentAmountLabel.font = [UIFont systemFontOfSize:10];
        _investmentAmountLabel.textColor = [UIColor whiteColor];
        _investmentAmountLabel.text = @"0.028934";
    }return _investmentAmountLabel;
}

- (ZFXuXianView *)lineView{
    if (_lineView == nil) {
        _lineView = [[ZFXuXianView alloc]init];
        _lineView.backgroundColor = RGBColorHex(0xa7a7a7);
    }return _lineView;
}

- (void)setTodayRankModel:(ETHRankingModel *)todayRankModel{
    _todayRankModel = todayRankModel;
    _rankLabel.text = [NSString stringWithFormat:@"第%@名",_todayRankModel.ranking];
    _idLabel.text = [NSString stringWithFormat:@"%@",_todayRankModel.ID];
    _nameLabel.text = [NSString stringWithFormat:@"%@",_todayRankModel.nickname];
    _winProbabilitylLabel.text = [NSString stringWithFormat:@"%@",_todayRankModel.yujis];
    _investmentAmountLabel.text = [NSString stringWithFormat:@"%@",_todayRankModel.moneys];
}
@end
