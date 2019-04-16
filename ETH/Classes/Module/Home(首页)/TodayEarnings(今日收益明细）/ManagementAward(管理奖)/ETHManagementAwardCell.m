//
//  ETHManagementAwardCell.m
//  ETH
//
//  Created by weiming zhang on 2019/4/16.
//  Copyright © 2019 admin. All rights reserved.
//

#import "ETHManagementAwardCell.h"
@interface ETHManagementAwardCell()
@property (nonatomic, strong)UILabel *releaseTimeLabel;
@property (nonatomic, strong)UILabel *bonusSourceLabel;
@property (nonatomic, strong)UILabel *freeAccountLabel;
@property (nonatomic, strong)UILabel *reinstatementAccountLabel;
@end
@implementation ETHManagementAwardCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self setup];
    }
    return self;
}
- (void)setFrame:(CGRect)frame{
    frame.origin.x +=10;
    frame.origin.y +=5;
    frame.size.width -=20;
    frame.size.height -=5;
    [super setFrame:frame];
}
- (void)setup{
    self.layer.cornerRadius = 3;
    self.backgroundColor = RGBColorHex(0x475065);
    [self addSubview:self.releaseTimeLabel];
    [self addSubview:self.bonusSourceLabel];
    [self addSubview:self.freeAccountLabel];
    [self addSubview:self.reinstatementAccountLabel];
    [_releaseTimeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).with.offset(10);
        make.left.equalTo(self).with.offset(10);
    }];
    [_bonusSourceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.releaseTimeLabel.mas_bottom).with.offset(8);
        make.left.equalTo(self).with.offset(10);
    }];
    [_freeAccountLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.bonusSourceLabel.mas_bottom).with.offset(8);
        make.left.equalTo(self).with.offset(10);
    }];
    [_reinstatementAccountLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.freeAccountLabel.mas_bottom).with.offset(8);
        make.left.equalTo(self).with.offset(10);
    }];
}
-(void)setIncomeModel:(ETHIncomeModel *)incomeModel
{
    _incomeModel = incomeModel;
    _releaseTimeLabel.text = [NSString stringWithFormat:@"发放时间：%@",_incomeModel.createtime];
    _bonusSourceLabel.text = [NSString stringWithFormat:@"奖金来源：%@",_incomeModel.nickname];
    _freeAccountLabel.text = [NSString stringWithFormat:@"自由账户奖金：%@",_incomeModel.money];
    _reinstatementAccountLabel.text = [NSString stringWithFormat:@"复投账户奖金：%@",_incomeModel.money2];
}

- (UILabel *)releaseTimeLabel{
    if (_releaseTimeLabel == nil) {
        _releaseTimeLabel = [[UILabel alloc]init];
        _releaseTimeLabel.font = [UIFont systemFontOfSize:12];
        _releaseTimeLabel.textColor = [UIColor whiteColor];
        _releaseTimeLabel.text = @"发放时间：2019-04-13 02:42:43";
    }return _releaseTimeLabel;
}
- (UILabel *)bonusSourceLabel{
    if (_bonusSourceLabel == nil) {
        _bonusSourceLabel = [[UILabel alloc]init];
        _bonusSourceLabel.font = [UIFont systemFontOfSize:12];
        _bonusSourceLabel.textColor = [UIColor whiteColor];
        _bonusSourceLabel.text = @"奖金来源：178XXXX7384";
    }return _bonusSourceLabel;
}
- (UILabel *)freeAccountLabel{
    if (_freeAccountLabel == nil) {
        _freeAccountLabel = [[UILabel alloc]init];
        _freeAccountLabel.font = [UIFont systemFontOfSize:12];
        _freeAccountLabel.textColor = [UIColor whiteColor];
        _freeAccountLabel.text = @"自由账户奖金：0.123353";
    }return _freeAccountLabel;
}
- (UILabel *)reinstatementAccountLabel{
    if (_reinstatementAccountLabel == nil) {
        _reinstatementAccountLabel = [[UILabel alloc]init];
        _reinstatementAccountLabel.font = [UIFont systemFontOfSize:12];
        _reinstatementAccountLabel.textColor = [UIColor whiteColor];
        _reinstatementAccountLabel.text = @"复投账户奖金：0.025231";
    }return _reinstatementAccountLabel;
}
@end
