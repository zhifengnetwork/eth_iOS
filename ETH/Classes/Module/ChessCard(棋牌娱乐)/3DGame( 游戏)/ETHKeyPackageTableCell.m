//
//  ETHKeyPackageTableCell.m
//  ETH
//
//  Created by admin on 2019/4/13.
//  Copyright © 2019 admin. All rights reserved.
//

#import "ETHKeyPackageTableCell.h"

@interface ETHKeyPackageTableCell ()

@property (nonatomic, strong) UILabel* keyLabel;
@property (nonatomic, strong) UILabel* envelopeLabel;
@property (nonatomic, strong) UITextField* keyTextField;
@property (nonatomic, strong) UILabel* symbolLabel;
@property (nonatomic, strong) UITextField* key1TextField;
@property (nonatomic, strong) UITextField* envelopeTextField;
@property (nonatomic, strong) UIButton* confirmButton;
@property (nonatomic, strong) UIButton* cancelButton;

@end

@implementation ETHKeyPackageTableCell

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
    self.contentView.backgroundColor = RGBColorHex(0xf4f4f4);
    [self.contentView addSubview:self.keyLabel];
    [self.contentView addSubview:self.envelopeLabel];
    [self.contentView addSubview:self.keyTextField];
    [self.contentView addSubview:self.symbolLabel];
    [self.contentView addSubview:self.key1TextField];
    [self.contentView addSubview:self.envelopeTextField];
    [self.contentView addSubview:self.confirmButton];
    [self.contentView addSubview:self.cancelButton];
    
    [_keyLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(20);
        make.top.mas_equalTo(5);
    }];
    
    [_envelopeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(20);
        make.top.equalTo(self->_keyLabel.mas_bottom).offset(5);
    }];
    
    [_keyTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->_keyLabel.mas_right).offset(6);
        make.top.mas_equalTo(5);
        make.width.mas_equalTo(50);
        make.height.mas_equalTo(15);
    }];
    
    [_symbolLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->_keyTextField.mas_right).offset(10);
        make.centerY.equalTo(self->_keyTextField);
    }];
    
    [_key1TextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->_symbolLabel.mas_right).offset(10);
        make.top.mas_equalTo(5);
        make.width.mas_equalTo(50);
        make.height.mas_equalTo(15);
    }];
    
    [_envelopeTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->_envelopeLabel.mas_right).offset(6);
        make.centerY.equalTo(self->_envelopeLabel);
        make.width.mas_equalTo(125);
        make.height.mas_equalTo(15);
    }];
    
    [_confirmButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self->_cancelButton.mas_left).offset(-8);
        make.centerY.equalTo(self.contentView);
        make.width.mas_equalTo(50);
        make.height.mas_equalTo(15);
    }];
    
    [_cancelButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-32);
        make.centerY.equalTo(self.contentView);
        make.width.mas_equalTo(50);
        make.height.mas_equalTo(15);
    }];
    
    
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
- (void)confirmButtonDidClick
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(ETHKeyPackageTableCellDidClick: minNum:maxNum:bs:)])
    {
        [self.delegate ETHKeyPackageTableCellDidClick:1 minNum:_keyTextField.text maxNum:_key1TextField.text bs:_envelopeTextField.text];
    }
}

- (void)cancelButtonDidClick
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(ETHKeyPackageTableCellDidClick: minNum:maxNum:bs:)])
    {
        [self.delegate ETHKeyPackageTableCellDidClick:2 minNum:_keyTextField.text maxNum:_key1TextField.text bs:_envelopeTextField.text];
    }
}

- (UILabel *)keyLabel {
    if (_keyLabel == nil) {
        _keyLabel = [[UILabel alloc] init];
        _keyLabel.textColor = RGBColorHex(0x232833);
        _keyLabel.font = [UIFont systemFontOfSize:12];
        _keyLabel.text = @"一键包号：";
    }
    return _keyLabel;
}

- (UILabel *)envelopeLabel {
    if (_envelopeLabel == nil) {
        _envelopeLabel = [[UILabel alloc] init];
        _envelopeLabel.textColor = RGBColorHex(0x232833);
        _envelopeLabel.font = [UIFont systemFontOfSize:12];
        _envelopeLabel.text = @"包号倍数：";
    }
    return _envelopeLabel;
}

- (UITextField *)keyTextField {
    if (_keyTextField == nil) {
        _keyTextField = [[UITextField alloc] init];
        _keyTextField.placeholder = @"";
        _keyTextField.font = [UIFont systemFontOfSize:12];
        _keyTextField.textColor = RGBColorHex(0x232833);
        _keyTextField.backgroundColor = RGBColorHex(0xffffff);
        _keyTextField.layer.borderWidth = 1.0f;
        _keyTextField.layer.borderColor = RGBColorHex(0x4b4b4b).CGColor;
        _keyTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
    }
    return _keyTextField;
}

- (UILabel *)symbolLabel {
    if (_symbolLabel == nil) {
        _symbolLabel = [[UILabel alloc] init];
        _symbolLabel.textColor = RGBColorHex(0x232833);
        _symbolLabel.font = [UIFont systemFontOfSize:12];
        _symbolLabel.text = @"~";
    }
    return _symbolLabel;
}

- (UITextField *)key1TextField {
    if (_key1TextField == nil) {
        _key1TextField = [[UITextField alloc] init];
        _key1TextField.placeholder = @"";
        _key1TextField.font = [UIFont systemFontOfSize:12];
        _key1TextField.textColor = RGBColorHex(0x232833);
        _key1TextField.backgroundColor = RGBColorHex(0xffffff);
        _key1TextField.layer.borderWidth = 1.0f;
        _key1TextField.layer.borderColor = RGBColorHex(0x4b4b4b).CGColor;
        _key1TextField.clearButtonMode = UITextFieldViewModeWhileEditing;
    }
    return _key1TextField;
}

- (UITextField *)envelopeTextField {
    if (_envelopeTextField == nil) {
        _envelopeTextField = [[UITextField alloc] init];
        _envelopeTextField.placeholder = @"";
        _envelopeTextField.font = [UIFont systemFontOfSize:12];
        _envelopeTextField.textColor = RGBColorHex(0x232833);
        _envelopeTextField.backgroundColor = RGBColorHex(0xffffff);
        _envelopeTextField.layer.borderWidth = 1.0f;
        _envelopeTextField.layer.borderColor = RGBColorHex(0x4b4b4b).CGColor;
        _envelopeTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
    }
    return _envelopeTextField;
}

- (UIButton *)confirmButton {
    if (_confirmButton == nil) {
        _confirmButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_confirmButton setTitle:@"确定" forState:UIControlStateNormal];
        [_confirmButton setTitleColor:RGBColorHex(0xffffff) forState:UIControlStateNormal];
        _confirmButton.backgroundColor = RGBColorHex(0xfc0124);
        _confirmButton.titleLabel.font = [UIFont systemFontOfSize:12];
        [_confirmButton addTarget:self action:@selector(confirmButtonDidClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _confirmButton;
}

- (UIButton *)cancelButton {
    if (_cancelButton == nil) {
        _cancelButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_cancelButton setTitle:@"取消" forState:UIControlStateNormal];
        [_cancelButton setTitleColor:RGBColorHex(0xffffff) forState:UIControlStateNormal];
        _cancelButton.backgroundColor = RGBColorHex(0x039702);
        _cancelButton.titleLabel.font = [UIFont systemFontOfSize:12];
        [_cancelButton addTarget:self action:@selector(cancelButtonDidClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _cancelButton;
}

@end
