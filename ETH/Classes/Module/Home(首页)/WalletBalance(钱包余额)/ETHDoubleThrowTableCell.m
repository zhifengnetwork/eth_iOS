//
//  ETHDoubleThrowTableCell.m
//  ETH
//
//  Created by admin on 2019/4/9.
//  Copyright © 2019 admin. All rights reserved.
//

#import "ETHDoubleThrowTableCell.h"

@interface ETHDoubleThrowTableCell()

@property (nonatomic, strong) UIView *bgView;
@property (nonatomic, strong) UIButton* doubleButton;
@property (nonatomic, strong) UIButton* entertainButton;

@end

@implementation ETHDoubleThrowTableCell

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
    [self.contentView addSubview:self.bgView];
    [self.contentView addSubview:self.doubleButton];
    [self.contentView addSubview:self.entertainButton];
    
    [_bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.right.mas_equalTo(-10);
        make.top.mas_equalTo(0);
        make.height.mas_equalTo(40);
    }];
    
    [_doubleButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->_bgView.mas_left).offset(10);
        make.top.equalTo(self->_bgView.mas_top).offset(15);
        make.width.mas_equalTo(50);
        make.height.mas_equalTo(15);
    }];
    
    [_entertainButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self->_bgView.mas_right).offset(-10);
        make.top.equalTo(self->_bgView.mas_top).offset(15);
        make.width.mas_equalTo(50);
        make.height.mas_equalTo(15);
        
    }];
    
    //竖线
    UIView *hLineView1 = [[UIView alloc] init];
    hLineView1.backgroundColor = RGBColorHex(0x232833);
    [self addSubview:hLineView1];
    
    [hLineView1 mas_makeConstraints:^(MASConstraintMaker *make)
     {
         make.left.mas_equalTo(10);
         make.top.bottom.equalTo(self.contentView);
         make.width.mas_equalTo(0.5f);
     }];
    
    //竖线
    UIView *hLineView2 = [[UIView alloc] init];
    hLineView2.backgroundColor = RGBColorHex(0x232833);
    [self addSubview:hLineView2];
    
    [hLineView2 mas_makeConstraints:^(MASConstraintMaker *make)
     {
         make.right.mas_equalTo(-10);
         make.top.bottom.equalTo(self.contentView);
         make.width.mas_equalTo(0.5f);
     }];
    
    //下面横线
    UIView *hLineView = [[UIView alloc] init];
    hLineView.backgroundColor = RGBColorHex(0x232833);
    [self addSubview:hLineView];
    
    [hLineView mas_makeConstraints:^(MASConstraintMaker *make)
     {
         make.left.mas_equalTo(10);
         make.right.mas_equalTo(-10);
         make.bottom.equalTo(self);
         make.height.mas_equalTo(0.5f);
     }];
    
}

- (void)doubleButtonDidClick
{
    
}

- (void)entertainButtonDidClick
{
    
}

-(UIView *)bgView
{
    if(_bgView==nil)
    {
        _bgView = [[UIView alloc]initWithFrame:CGRectZero];
        _bgView.backgroundColor = RGBColorHex(0xf4f4f4);
        _bgView.clipsToBounds = YES;
        _bgView.layer.cornerRadius = 3.0f;
    }
    return _bgView;
}

- (UIButton *)doubleButton {
    if (_doubleButton == nil) {
        _doubleButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_doubleButton setTitle:@"一键复投" forState:UIControlStateNormal];
        [_doubleButton setTitleColor:RGBColorHex(0x232833) forState:UIControlStateNormal];
        _doubleButton.titleLabel.font = [UIFont systemFontOfSize:10];
        _doubleButton.layer.borderWidth = 1.0f;
        _doubleButton.layer.borderColor = RGBColorHex(0xcdcdcd).CGColor;
        [_doubleButton addTarget:self action:@selector(doubleButtonDidClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _doubleButton;
}

- (UIButton *)entertainButton {
    if (_entertainButton == nil) {
        _entertainButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_entertainButton setTitle:@" 棋牌娱乐 " forState:UIControlStateNormal];
        [_entertainButton setTitleColor:RGBColorHex(0x232833) forState:UIControlStateNormal];
        _entertainButton.titleLabel.font = [UIFont systemFontOfSize:10];
        _entertainButton.layer.borderWidth = 1.0f;
        _entertainButton.layer.borderColor = RGBColorHex(0xcdcdcd).CGColor;
        [_entertainButton addTarget:self action:@selector(entertainButtonDidClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _entertainButton;
}
@end
