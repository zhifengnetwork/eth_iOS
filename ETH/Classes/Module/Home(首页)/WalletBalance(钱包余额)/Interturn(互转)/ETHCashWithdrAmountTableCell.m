//
//  ETHCashWithdrAmountTableCell.m
//  ETH
//
//  Created by admin on 2019/4/11.
//  Copyright © 2019 admin. All rights reserved.
//

#import "ETHCashWithdrAmountTableCell.h"
#import "ETHTool.h"

@interface ETHCashWithdrAmountTableCell()<UITextFieldDelegate>

@property (nonatomic, strong) UIView *bg1View;
@property (nonatomic, strong) UIView *bg2View;
@property (nonatomic, strong) UIView *bg3View;
@property (nonatomic, strong) UILabel* titleLabel;
@property (nonatomic, strong) UILabel* moneyLabel;
@property (nonatomic, strong) UITextField* moneyTextField;
@property (nonatomic, strong) UILabel* idLabel;
@property (nonatomic, strong) UITextField* idTextField;
@property (nonatomic, strong) UILabel* serviceLabel;
@property (nonatomic, strong) UILabel* service2Label;
@property (nonatomic, strong) UILabel* actualLabel;

@end

@implementation ETHCashWithdrAmountTableCell

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
    [self.contentView addSubview:self.bg1View];
    [self.contentView addSubview:self.bg2View];
    [self.contentView addSubview:self.bg3View];
    [self.contentView addSubview:self.titleLabel];
    [self.contentView addSubview:self.moneyLabel];
    [self.contentView addSubview:self.moneyTextField];
    [self.contentView addSubview:self.idLabel];
    [self.contentView addSubview:self.idTextField];
    [self.contentView addSubview:self.serviceLabel];
    [self.contentView addSubview:self.service2Label];
    [self.contentView addSubview:self.actualLabel];
    
    [_bg1View mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.right.mas_equalTo(-10);
        make.top.mas_equalTo(0);
        make.height.mas_equalTo(195);
    }];
    
    [_bg2View mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->_bg1View.mas_left).offset(10);
        make.top.equalTo(self->_titleLabel.mas_bottom).offset(25);
        make.width.mas_equalTo(225);
        make.height.mas_equalTo(25);
    }];
    
    [_bg3View mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->_bg1View.mas_left).offset(10);
        make.top.equalTo(self->_bg2View.mas_bottom).offset(5);
        make.width.mas_equalTo(225);
        make.height.mas_equalTo(25);
    }];
    
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->_bg1View.mas_left).offset(10);
        make.top.equalTo(self->_bg1View.mas_top).offset(15);
    }];
    
    [_moneyLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->_bg2View.mas_left).offset(10);
        make.centerY.equalTo(self->_bg2View);
    }];
    
    [_moneyTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->_moneyLabel.mas_right).offset(10);
        make.centerY.equalTo(self->_bg2View);
        make.width.mas_equalTo(200);
    }];
    
    [_idLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->_bg3View.mas_left).offset(10);
        make.centerY.equalTo(self->_bg3View);
    }];
    
    [_idTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->_idLabel.mas_right).offset(10);
        make.centerY.equalTo(self->_bg3View);
        make.width.mas_equalTo(195);
    }];
    
    [_serviceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->_bg3View.mas_bottom).offset(15);
        make.left.equalTo(self->_bg1View.mas_left).offset(10);
    }];
    
    [_service2Label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->_serviceLabel.mas_bottom).offset(10);
        make.left.equalTo(self->_bg1View.mas_left).offset(10);
    }];
    
    [_actualLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->_service2Label.mas_bottom).offset(7);
        make.left.equalTo(self->_bg1View.mas_left).offset(10);
    }];
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(textFieldEditChanged:) name:@"UITextFieldTextDidChangeNotification" object:self.moneyTextField];
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(textFieldEditChanged2:) name:@"UITextFieldTextDidChangeNotification" object:self.idTextField];
}

-(void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"UITextFieldTextDidChangeNotification" object:self.moneyTextField];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"UITextFieldTextDidChangeNotification" object:self.idTextField];
}

-(void)setCredit:(NSString *)credit
{
    _credit = credit;
    _titleLabel.text = [NSString stringWithFormat:@"当前可转账额度： ¥%@",_credit];
}

#pragma mark - Notification Method
-(void)textFieldEditChanged:(NSNotification *)obj
{
    UITextField *textField = (UITextField *)obj.object;
    NSString *toBeString = textField.text;
    if ([self.delegate respondsToSelector:@selector(ETHCashWithdrAmountTableCellInputing: indexPath:)])
    {
        [self.delegate ETHCashWithdrAmountTableCellInputing:self.moneyTextField.text indexPath:self.indexPath];
    }
    
    NSString* tx = self.moneyTextField.text;
    if (kStringIsEmpty(tx))
    {
        return;
    }
    
    float sxf = tx.floatValue*0.003;
    
    //2种颜色
    NSString* str = [NSString stringWithFormat:@"本次转账将扣除手续费：¥%.5f",sxf];
    NSString* key = [NSString stringWithFormat:@"¥%.5f",sxf];
    NSMutableAttributedString* aText = [ETHTool GetAttributedString:nil SrcText:str KeyWord:key KeyWordColor:RGBColorHex(0xf2041a) KeyWordFont:[UIFont systemFontOfSize:13] KeyWordBGolor:[UIColor clearColor]];
    _service2Label.attributedText = aText;
    
    //2种颜色
    float dz = tx.floatValue - sxf;
    NSString* str2 = [NSString stringWithFormat:@"本次转账实际到账金额：¥%.5f",dz];
    NSString* key2 = [NSString stringWithFormat:@"¥%.5f",dz];
    NSMutableAttributedString* aText2 = [ETHTool GetAttributedString:nil SrcText:str2 KeyWord:key2 KeyWordColor:RGBColorHex(0xf2041a) KeyWordFont:[UIFont systemFontOfSize:13] KeyWordBGolor:[UIColor clearColor]];
    _actualLabel.attributedText = aText2;
}

-(void)textFieldEditChanged2:(NSNotification *)obj
{
    UITextField *textField = (UITextField *)obj.object;
    NSString *toBeString = textField.text;
    if ([self.delegate respondsToSelector:@selector(ETHCashWithdrAmountTableCellInputing2: indexPath:)])
    {
        [self.delegate ETHCashWithdrAmountTableCellInputing2:self.moneyTextField.text indexPath:self.indexPath];
    }
}

-(UIView *)bg1View
{
    if(_bg1View==nil)
    {
        _bg1View = [[UIView alloc]initWithFrame:CGRectZero];
        _bg1View.backgroundColor = RGBColorHex(0xf4f4f4);
        _bg1View.clipsToBounds = YES;
        _bg1View.layer.cornerRadius = 3.0f;
        _bg1View.layer.borderWidth = 1.0f;
        _bg1View.layer.borderColor = RGBColorHex(0xdadada).CGColor;
    }
    return _bg1View;
}

-(UIView *)bg2View
{
    if(_bg2View==nil)
    {
        _bg2View = [[UIView alloc]initWithFrame:CGRectZero];
        _bg2View.backgroundColor = RGBColorHex(0xffffff);
        _bg2View.clipsToBounds = YES;
        _bg2View.layer.cornerRadius = 3.0f;
        _bg2View.layer.borderWidth = 1.0f;
        _bg2View.layer.borderColor = RGBColorHex(0x3d3d3d).CGColor;
    }
    return _bg2View;
}

-(UIView *)bg3View
{
    if(_bg3View==nil)
    {
        _bg3View = [[UIView alloc]initWithFrame:CGRectZero];
        _bg3View.backgroundColor = RGBColorHex(0xffffff);
        _bg3View.clipsToBounds = YES;
        _bg3View.layer.cornerRadius = 3.0f;
        _bg3View.layer.borderWidth = 1.0f;
        _bg3View.layer.borderColor = RGBColorHex(0x3d3d3d).CGColor;
    }
    return _bg3View;
}

- (UILabel *)titleLabel {
    if (_titleLabel == nil) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.textColor = RGBColorHex(0x232833);
        _titleLabel.font = [UIFont systemFontOfSize:12];
        _titleLabel.text = @"当前可提现额度： ¥43808";
    }
    return _titleLabel;
}

- (UILabel *)moneyLabel {
    if (_moneyLabel == nil) {
        _moneyLabel = [[UILabel alloc] init];
        _moneyLabel.textColor = RGBColorHex(0xf80000);
        _moneyLabel.font = [UIFont systemFontOfSize:10];
        _moneyLabel.text = @"¥";
    }
    return _moneyLabel;
}

- (UITextField *)moneyTextField {
    if (_moneyTextField == nil) {
        _moneyTextField = [[UITextField alloc] init];
        _moneyTextField.placeholder = @"";
        _moneyTextField.font = [UIFont systemFontOfSize:15];
        _moneyTextField.textColor = RGBColorHex(0x232833);
        _moneyTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
    }
    return _moneyTextField;
}

- (UILabel *)idLabel {
    if (_idLabel == nil) {
        _idLabel = [[UILabel alloc] init];
        _idLabel.textColor = RGBColorHex(0x232833);
        _idLabel.font = [UIFont systemFontOfSize:12];
        _idLabel.text = @"ID";
    }
    return _idLabel;
}

- (UITextField *)idTextField {
    if (_idTextField == nil) {
        _idTextField = [[UITextField alloc] init];
        _idTextField.placeholder = @"请输入对方ID";
        _idTextField.font = [UIFont systemFontOfSize:12];
        _idTextField.textColor = RGBColorHex(0x232833);
        [_idTextField sizeToFit];
        _idTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
    }
    return _idTextField;
}

- (UILabel *)serviceLabel {
    if (_serviceLabel == nil) {
        _serviceLabel = [[UILabel alloc] init];
        _serviceLabel.textColor = RGBColorHex(0x232833);
        _serviceLabel.font = [UIFont systemFontOfSize:12];
        _serviceLabel.text = @"交易手续费为0.30%";
    }
    return _serviceLabel;
}

- (UILabel *)service2Label {
    if (_service2Label == nil) {
        _service2Label = [[UILabel alloc] init];
        _service2Label.textColor = RGBColorHex(0x232833);
        _service2Label.font = [UIFont systemFontOfSize:12];
        //2种颜色
        NSString* str = @"本次转账将扣除手续费：¥0.01500";
        NSString* key = @"¥0.01500";
        NSMutableAttributedString* aText = [ETHTool GetAttributedString:nil SrcText:str KeyWord:key KeyWordColor:RGBColorHex(0xf2041a) KeyWordFont:[UIFont systemFontOfSize:13] KeyWordBGolor:[UIColor clearColor]];
        _service2Label.attributedText = aText;
    }
    return _service2Label;
}

- (UILabel *)actualLabel {
    if (_actualLabel == nil) {
        _actualLabel = [[UILabel alloc] init];
        _actualLabel.textColor = RGBColorHex(0x232833);
        _actualLabel.font = [UIFont systemFontOfSize:12];
        //2种颜色
        NSString* str = @"本次转账实际到账金额：¥5.35330";
        NSString* key = @"¥5.35330";
        NSMutableAttributedString* aText = [ETHTool GetAttributedString:nil SrcText:str KeyWord:key KeyWordColor:RGBColorHex(0xf2041a) KeyWordFont:[UIFont systemFontOfSize:13] KeyWordBGolor:[UIColor clearColor]];
        _actualLabel.attributedText = aText;
    }
    return _actualLabel;
}

@end
