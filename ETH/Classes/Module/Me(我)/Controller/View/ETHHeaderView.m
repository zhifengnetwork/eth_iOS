//
//  ETHHeaderView.m
//  ETH
//
//  Created by weiming zhang on 2019/4/3.
//  Copyright © 2019年 admin. All rights reserved.
//

#import "ETHHeaderView.h"
#import "UIView+HJViewStyle.h"
#import "UIImageView+WebCache.h"
#import "ETHChangeIconVC.h"


@interface ETHHeaderView()
@property (nonatomic, strong)UIImageView *backImageView;
@property (nonatomic, strong)UIImageView *iconImageView;
@property (nonatomic, strong)UILabel *phoneLabel;
@property (nonatomic, strong)UILabel *memberID;
@property (nonatomic, strong)UILabel *memberLevel;
@property (nonatomic, strong)UILabel *marketLevel;
@property (nonatomic, strong)UILabel *activationLabel;
@property (nonatomic, strong)UIButton *iconButton;//头像按钮
@end
@implementation ETHHeaderView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}
- (void)setup{
    
    [self addSubview:self.backImageView];
    [self addSubview:self.iconImageView];
    [self addSubview:self.phoneLabel];
    [self addSubview:self.memberID];
    [self addSubview:self.memberLevel];
    [self addSubview:self.marketLevel];
    [self addSubview:self.activationLabel];
    [self addSubview:self.iconButton];
    [_backImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.bottom.equalTo(self);
    }];
    //添加阴影
    UIView *shadowView = [[UIView alloc]initWithFrame:self.frame];
    shadowView.alpha = 0.6;
    shadowView.backgroundColor = [UIColor blackColor];
    [self.backImageView addSubview:shadowView];
    [_iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).with.offset(25);
        make.bottom.equalTo(self).with.offset(-25);
        make.width.height.mas_equalTo(65);
    }];
    [_phoneLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.iconImageView.mas_right).with.offset(8);
        make.top.equalTo(self.iconImageView.mas_top);
    }];
    [_memberID mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.phoneLabel.mas_bottom).with.offset(6);
        make.left.equalTo(self.iconImageView.mas_right).with.offset(8);
    }];
    [_memberLevel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.memberID.mas_bottom).with.offset(6);
        make.left.equalTo(self.iconImageView.mas_right).with.offset(8);
    }];
    [_marketLevel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.memberLevel.mas_bottom).with.offset(6);
        make.left.equalTo(self.iconImageView.mas_right).with.offset(8);
    }];
    [_activationLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.bottom.equalTo(self).with.offset(-25);
    }];
    [_iconButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.iconImageView.mas_top);
        make.left.equalTo(self.iconImageView.mas_left);
        make.right.equalTo(self.marketLevel.mas_right);
        make.height.equalTo(self.iconImageView.mas_height);
    }];
    
}

-(void)setUserInfo:(UserInfoModel *)userInfo
{
    _userInfo = userInfo;
    
//    显示头像
    [_iconImageView sd_setImageWithURL:[NSURL URLWithString:_userInfo.member.avatar] placeholderImage:[UIImage imageNamed:@"icon1"]];
    _phoneLabel.text = _userInfo.member.nickname;
    _memberID.text = [NSString stringWithFormat:@"会员ID：%@",_userInfo.member.ID];
    
    if (kStringIsEmpty(_userInfo.huiyuanlevel.levelname1))
    {
        _memberLevel.text = @"会员等级：暂无";
    }
    else
    {
        _memberLevel.text = [NSString stringWithFormat:@"会员等级：%@",_userInfo.huiyuanlevel.levelname1];
    }
    
    if (kStringIsEmpty(_userInfo.huiyuanlevel.levelname3))
    {
        _marketLevel.text = @"市场等级：暂无";
    }
    else
    {
        _marketLevel.text = [NSString stringWithFormat:@"市场等级：%@",_userInfo.huiyuanlevel.levelname3];
    }
    if (_userInfo.member.type == 0) {
        _activationLabel.text = @"未激活";
    }else if (_userInfo.member.type == 1){
        _activationLabel.text = @"已激活";
    }else{
        _activationLabel.text = @"已锁户";
        
    }
}

- (UIImageView *)backImageView{
    if (_backImageView == nil) {
        _backImageView = [[UIImageView alloc]init];
        _backImageView.image = [UIImage imageNamed:@"tupian"];
        
    }
    return _backImageView;
}
- (UIImageView *)iconImageView{
    if (_iconImageView == nil) {
        _iconImageView = [[UIImageView alloc]init];
        _iconImageView.circle = YES;
        _iconImageView.image = [UIImage imageNamed:@"wode"];
        
    }
    return _iconImageView;
}
- (UILabel *)phoneLabel{
    if (_phoneLabel == nil) {
        _phoneLabel = [[UILabel alloc]init];
        _phoneLabel.font = [UIFont systemFontOfSize:12];
        _phoneLabel.textColor = RGBColorHex(0xffffff);
        _phoneLabel.text = @"182xxxx8820";
    }
    return _phoneLabel;
}
- (UILabel *)memberID{
    if (_memberID == nil) {
        _memberID = [[UILabel alloc]init];
        _memberID.font = [UIFont systemFontOfSize:12];
        _memberID.textColor = RGBColorHex(0xffffff);
        _memberID.text = @"会员ID：36538";
    }
    return _memberID;
}
- (UILabel *)memberLevel{
    if (_memberLevel == nil) {
        _memberLevel = [[UILabel alloc]init];
        _memberLevel.font = [UIFont systemFontOfSize:12];
        _memberLevel.textColor = RGBColorHex(0xffffff);
        _memberLevel.text = @"会员等级：暂无";
    }
    return _memberLevel;
}
- (UILabel *)marketLevel{
    if (_marketLevel == nil) {
        _marketLevel = [[UILabel alloc]init];
        _marketLevel.font = [UIFont systemFontOfSize:12];
        _marketLevel.textColor = RGBColorHex(0xffffff);
        _marketLevel.text = @"市场等级：等级二";
    }
    return _marketLevel;
}
- (UILabel *)activationLabel{
    if (_activationLabel == nil) {
        _activationLabel = [[UILabel alloc]init];
        _activationLabel.font = [UIFont systemFontOfSize:15];
        _activationLabel.textColor = RGBColorHex(0xfcce6a);
        _activationLabel.text = @"未激活";
    }
    return _activationLabel;
}
- (UIButton *)iconButton{
    if (_iconButton == nil) {
        _iconButton = [[UIButton alloc]init];
        [_iconButton addTarget:self action:@selector(iconClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _iconButton;
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
#pragma mark --点击我的头像

- (void)iconClick{
    ETHChangeIconVC *vc = [[ETHChangeIconVC alloc]init];
    vc.userInfo = self.userInfo;
    [[self viewController].navigationController pushViewController:vc animated:YES];
}

@end
