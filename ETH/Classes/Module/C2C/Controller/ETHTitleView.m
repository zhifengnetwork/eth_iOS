//
//  ETHTitleView.m
//  ETH
//
//  Created by weiming zhang on 2019/4/5.
//  Copyright © 2019 admin. All rights reserved.
//

#import "ETHTitleView.h"
#import "ETHMoreViewController.h"
@interface ETHTitleView()
@property (nonatomic, strong)UIImageView *backImg;
@property (nonatomic, strong)UILabel *titleLabel;
@property (nonatomic, strong)UIButton *leftButton;
@property (nonatomic, strong)UIButton *rightButton;
@end
@implementation ETHTitleView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}
- (void)setup{
    [self addSubview:self.backImg];
    [self addSubview:self.titleLabel];
    [self addSubview:self.rightButton];
    [self addSubview:self.leftButton];
    [_backImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.bottom.equalTo(self);
    }];
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.mas_centerX);
        make.centerY.equalTo(self.mas_centerY).with.offset(-17);
    }];
    [_rightButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self).with.offset(-16);
        make.centerY.equalTo(self.titleLabel.mas_centerY);
        make.width.height.mas_equalTo(40);
    }];
    [_leftButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).with.offset(16);
        make.centerY.equalTo(self.titleLabel.mas_centerY);
        make.width.height.mas_equalTo(40);
    }];
}
- (UIImageView *)backImg{
    if (_backImg == nil) {
        _backImg = [[UIImageView alloc]init];
        _backImg.image = [UIImage imageNamed:@"BG1"];
    }
    return _backImg;
}
- (UILabel *)titleLabel{
    if (_titleLabel == nil) {
        _titleLabel = [[UILabel alloc]init];
        _titleLabel.textColor = [UIColor whiteColor];
        _titleLabel.font = [UIFont boldSystemFontOfSize:22];
        _titleLabel.text = @"ETH/CNY";
    }
    return _titleLabel;
}
- (UIButton *)rightButton{
    if (_rightButton == nil) {
        _rightButton = [[UIButton alloc]init];
        [_rightButton setImage:[UIImage imageNamed:@"navigation"] forState:UIControlStateNormal];
        [_rightButton addTarget:self action:@selector(rightButtonClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _rightButton;
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
- (UIButton *)leftButton{
    if (_leftButton == nil) {
        _leftButton = [[UIButton alloc]init];
        [_leftButton setImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
        [_leftButton addTarget:self action:@selector(leftButtonClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _leftButton;
}
- (void)leftButtonClick{
    [[self viewController].navigationController popViewControllerAnimated:YES];
}
//右边按钮点击
- (void)rightButtonClick{
    ETHMoreViewController *vc = [[ETHMoreViewController alloc]init];
    [[self viewController].navigationController pushViewController:vc animated:YES];
}
- (void)hideLeftBtn:(BOOL)isHide{
    self.leftButton.hidden = isHide;
}
- (void)hideRightBtn:(BOOL)isHide{
    self.rightButton.hidden = isHide;
}
@end
