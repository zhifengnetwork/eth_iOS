//
//  ETHChangeIconVC.m
//  ETH
//
//  Created by weiming zhang on 2019/4/18.
//  Copyright © 2019 admin. All rights reserved.
//

#import "ETHChangeIconVC.h"
@interface ETHChangeIconVC()
@property (nonatomic, strong)UIView *iconView;
@property (nonatomic, strong)UILabel *IconLabel;
@property (nonatomic, strong)UIImageView *iconImageView;
@property (nonatomic, strong)UIButton * iconButton;
@property (nonatomic, strong)UIView *nameView;
@property (nonatomic, strong)UILabel *nameLabel;
@property (nonatomic, strong)UILabel *nameLabel2;
@property (nonatomic, strong)UITextField *nameTF;
@property (nonatomic, strong)UIButton *saveButton;
@end
@implementation ETHChangeIconVC
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = RGBColorHex(0xf5f5f5);
    self.title = @"头像/昵称";
    [self setup];
}

- (void)setup{
    self.view.backgroundColor = RGBColorHex(0xf3f3f3);
    [self.view addSubview:self.iconView];
    [self.iconView addSubview:self.IconLabel];
    [self.iconView addSubview:self.iconImageView];
    [self.iconView addSubview:self.iconButton];
    [self.view addSubview:self.nameView];
    [self.nameView addSubview:self.nameLabel];
    [self.nameView addSubview:self.nameLabel2];
    [self.nameView addSubview:self.nameTF];
    [self.view addSubview:self.saveButton];
    
    [_iconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).with.offset(15);
        make.left.equalTo(self.view).with.offset(12);
        make.right.equalTo(self.view).with.offset(-12);
        make.height.mas_equalTo(38);
    }];
    
    [_IconLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.iconView).with.offset(12);
        make.centerY.equalTo(self.iconView.mas_centerY);
    }];
    
    [_iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.iconView).with.offset(-12);
        make.centerY.equalTo(self.iconView.mas_centerY);
        make.width.height.mas_equalTo(30);
    }];
    
    [_iconButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.left.right.equalTo(self.iconView);
    }];
    
    [_nameView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.iconView.mas_bottom).with.offset(10);
        make.left.equalTo(self.view).with.offset(12);
        make.right.equalTo(self.view).with.offset(-12);
        make.height.mas_equalTo(38);
    }];
    
    [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.nameView).with.offset(12);
        make.centerY.equalTo(self.nameView.mas_centerY);
    }];
    
    [_nameLabel2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.nameLabel.mas_right).with.offset(19);
        make.centerY.equalTo(self.nameView.mas_centerY);
    }];
    
    [_nameTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.nameLabel2.mas_right);
        make.top.bottom.equalTo(self.nameView);
        make.width.mas_equalTo(200);
    }];
    
    [_saveButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.nameView.mas_bottom).with.offset(25);
        make.centerX.equalTo(self.view.mas_centerX);
        make.width.mas_equalTo(150);
        make.height.mas_equalTo(35);
    }];
}
- (UIView *)iconView{
    if (_iconView == nil) {
        _iconView = [[UIView alloc]init];
        _iconView.backgroundColor = [UIColor whiteColor];
        _iconView.layer.cornerRadius = 3;
    }return _iconView;
}

- (UILabel *)IconLabel{
    if (_IconLabel == nil) {
        _IconLabel = [[UILabel alloc]init];
        _IconLabel.font = [UIFont systemFontOfSize:15];
        _IconLabel.textColor = RGBColorHex(0x1a1a1a);
        _IconLabel.text = @"修改头像";
    }return _IconLabel;
}

- (UIImageView *)iconImageView{
    if (_iconImageView == nil) {
        _iconImageView = [[UIImageView alloc]init];
        _iconImageView.layer.cornerRadius = 15;
    }return _iconImageView;
}

- (UIButton *)iconButton{
    if (_iconButton == nil) {
        _iconButton = [[UIButton alloc]init];
    
        [_iconButton addTarget:self action:@selector(changeIcon) forControlEvents:UIControlEventTouchUpInside];
    }return _iconButton;
}

- (UIView *)nameView{
    if (_nameView == nil) {
        _nameView = [[UIView alloc]init];
        _nameView.backgroundColor = [UIColor whiteColor];
        _nameView.layer.cornerRadius = 3;
    }return _nameView;
}

- (UILabel *)nameLabel{
    if (_nameLabel == nil) {
        _nameLabel = [[UILabel alloc]init];
        _nameLabel.font = [UIFont systemFontOfSize:15];
        _nameLabel.textColor = RGBColorHex(0x1a1a1a);
        _nameLabel.text = @"修改昵称";
    }return _nameLabel;
}

- (UILabel *)nameLabel2{
    if (_nameLabel2 == nil) {
        _nameLabel2 = [[UILabel alloc]init];
        _nameLabel2.font = [UIFont systemFontOfSize:15];
        _nameLabel2.textColor = RGBColorHex(0xff3300);
        _nameLabel2.text = @"*";
    }return _nameLabel2;
}
- (UITextField *)nameTF{
    if (_nameTF == nil) {
        _nameTF = [[UITextField alloc]init];
        _nameTF.placeholder = @"请输入昵称";
        _nameTF.text = @"135XXXX3422";
        _nameTF.font = [UIFont systemFontOfSize:15];
        _nameTF.textColor = RGBColorHex(0x1a1a1a);
    }return _nameTF;
}
- (UIButton *)saveButton{
    if (_saveButton == nil) {
        _saveButton = [[UIButton alloc]init];
        _saveButton.layer.cornerRadius = 6;
        _saveButton.backgroundColor = RGBColorHex(0x04be02);
        _saveButton.titleLabel.font = [UIFont systemFontOfSize:15];
        [_saveButton setTitle:@"保存" forState:UIControlStateNormal];
        [_saveButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_saveButton addTarget:self action:@selector(saveClick) forControlEvents:UIControlEventTouchUpInside];
    }return _saveButton;
}
#pragma mark -- 方法
- (void)changeIcon{
    
}

- (void)saveClick{
    
}
@end
