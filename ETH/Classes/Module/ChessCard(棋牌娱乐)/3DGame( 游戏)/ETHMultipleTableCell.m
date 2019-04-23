//
//  ETHMultipleTableCell.m
//  ETH
//
//  Created by admin on 2019/4/18.
//  Copyright © 2019 admin. All rights reserved.
//

#import "ETHMultipleTableCell.h"
#import "PPNumberButton.h"

@interface ETHMultipleTableCell ()

@property (nonatomic, strong) UIButton* number1Button;
@property (nonatomic, strong) UIButton* number2Button;
@property (nonatomic, strong) UIButton* number3Button;
@property (nonatomic, strong) UILabel* titleLabel;
@property (nonatomic, strong) PPNumberButton* numberButton;
@property (nonatomic, strong) UIButton* deleteButton;
@end

@implementation ETHMultipleTableCell

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
    self.contentView.backgroundColor = RGBColorHex(0xcdcfd3);
    [self.contentView addSubview:self.number1Button];
    [self.contentView addSubview:self.number2Button];
    [self.contentView addSubview:self.number3Button];
    [self.contentView addSubview:self.titleLabel];
    [self.contentView addSubview:self.numberButton];
    [self.contentView addSubview:self.deleteButton];
    
    [_number1Button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(30);
        make.top.mas_equalTo(13);
        make.width.height.mas_equalTo(30);
    }];
    
    [_number2Button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->_number1Button.mas_right).offset(40);
        make.centerY.equalTo(self->_number1Button);
    }];
    
    [_number3Button mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->_number2Button.mas_right).offset(40);
        make.centerY.equalTo(self->_number2Button);
    }];
    
    [_titleLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->_number3Button.mas_top).offset(-5);
        make.centerX.equalTo(self->_numberButton);
    }];
    
    [_numberButton mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->_number3Button.mas_right).offset(45);
        make.bottom.equalTo(self->_number3Button.mas_bottom);
        make.width.mas_equalTo(60);
        make.height.mas_equalTo(15);
    }];
    
    [_deleteButton mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-32);
        make.bottom.equalTo(self->_number3Button.mas_bottom);
    }];
}


-(void)setModel:(ETH3DhomeModel *)model
{
    _model = model;
    
    NSString* str = _model.number;
    NSMutableArray * arr = [NSMutableArray arrayWithCapacity:0];
    // 遍历字符串，按字符来遍历。每个字符将通过block参数中的substring传出
    [str enumerateSubstringsInRange:NSMakeRange(0, str.length) options:NSStringEnumerationByComposedCharacterSequences usingBlock:^(NSString *substring, NSRange substringRange, NSRange enclosingRange, BOOL *stop) {
        [arr addObject:substring];
    }];
    
    if (arr.count>2)
    {
        [_number1Button setTitle:arr[0] forState:UIControlStateNormal];
        [_number2Button setTitle:arr[1] forState:UIControlStateNormal];
        [_number3Button setTitle:arr[2] forState:UIControlStateNormal];
    }
    
    _numberButton.currentNumber = _model.price.intValue;
}


- (void)number1ButtonDidClick
{
    
}

- (void)number2ButtonDidClick
{
    
}

- (void)number3ButtonDidClick
{
    
}

- (void)deleteButtonDidClick
{
    
}

- (UIButton *)number1Button {
    if (_number1Button == nil) {
        _number1Button = [UIButton buttonWithType:UIButtonTypeCustom];
        [_number1Button setTitle:@"0" forState:UIControlStateNormal];
        [_number1Button setTitleColor:RGBColorHex(0xfc0124) forState:UIControlStateNormal];
        _number1Button.titleLabel.font = [UIFont systemFontOfSize:12];
        _number1Button.backgroundColor = RGBColorHex(0xffffff);
        _number1Button.clipsToBounds = YES;
        _number1Button.layer.cornerRadius = 15.0f;
        _number1Button.layer.borderWidth = 1.0f;
        _number1Button.layer.borderColor = RGBColorHex(0x4b4b4b).CGColor;
        [_number1Button addTarget:self action:@selector(number1ButtonDidClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _number1Button;
}

- (UIButton *)number2Button {
    if (_number2Button == nil) {
        _number2Button = [UIButton buttonWithType:UIButtonTypeCustom];
        [_number2Button setTitle:@"0" forState:UIControlStateNormal];
        [_number2Button setTitleColor:RGBColorHex(0xfc0124) forState:UIControlStateNormal];
        _number2Button.titleLabel.font = [UIFont systemFontOfSize:12];
        _number2Button.backgroundColor = RGBColorHex(0xffffff);
        _number2Button.clipsToBounds = YES;
        _number2Button.layer.cornerRadius = 15.0f;
        _number2Button.layer.borderWidth = 1.0f;
        _number2Button.layer.borderColor = RGBColorHex(0x4b4b4b).CGColor;
        [_number2Button addTarget:self action:@selector(number2ButtonDidClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _number2Button;
}

- (UIButton *)number3Button {
    if (_number3Button == nil) {
        _number3Button = [UIButton buttonWithType:UIButtonTypeCustom];
        [_number3Button setTitle:@"0" forState:UIControlStateNormal];
        [_number3Button setTitleColor:RGBColorHex(0xfc0124) forState:UIControlStateNormal];
        _number3Button.titleLabel.font = [UIFont systemFontOfSize:12];
        _number3Button.backgroundColor = RGBColorHex(0xffffff);
        _number3Button.clipsToBounds = YES;
        _number3Button.layer.cornerRadius = 15.0f;
        _number3Button.layer.borderWidth = 1.0f;
        _number3Button.layer.borderColor = RGBColorHex(0x4b4b4b).CGColor;
        [_number3Button addTarget:self action:@selector(number3ButtonDidClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _number3Button;
}


- (UILabel *)titleLabel {
    if (_titleLabel == nil) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.textColor = RGBColorHex(0x232833);
        _titleLabel.font = [UIFont systemFontOfSize:12];
        _titleLabel.text = @"倍数";
    }
    return _titleLabel;
}

- (UIButton *)deleteButton {
    if (_deleteButton == nil) {
        _deleteButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_deleteButton setImage:[UIImage imageNamed:@"Delete"] forState:UIControlStateNormal];
        [_deleteButton setTitleColor:RGBColorHex(0x5e636d) forState:UIControlStateNormal];
        [_deleteButton addTarget:self action:@selector(deleteButtonDidClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _deleteButton;
}

-(PPNumberButton* )numberButton
{
    if (_numberButton==nil)
    {
        _numberButton = [PPNumberButton numberButtonWithFrame:CGRectMake(0, 0, 110, 30)];
        // 开启抖动动画
        _numberButton.shakeAnimation = YES;
        // 设置最小值
        _numberButton.minValue = 1;
        // 设置最大值
        _numberButton.maxValue = 1000;
        // 设置输入框中的字体大小
        _numberButton.inputFieldFont = 12;
        _numberButton.increaseTitle = @"＋";
        _numberButton.decreaseTitle = @"－";
        
    }
    
    return _numberButton;
}

@end
