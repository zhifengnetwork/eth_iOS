//
//  ETHLoginVC.m
//  ETH
//
//  Created by admin on 2019/4/3.
//  Copyright © 2019 admin. All rights reserved.
//

#import "ETHLoginVC.h"
#import "ETHRegisterVC.h"
#import "JKCountDownButton.h"
#import "LoginTypeView.h"
#import "ETHTool.h"
#import "http_user.h"
#import "SVProgressHUD.h"
#import "MJExtension.h"
#import "UserInfoModel.h"


@interface ETHLoginVC ()<LoginTypeViewDelegate>

@property (nonatomic, strong) UIImageView* bjIconView;
@property (nonatomic, strong) UIImageView* headView;

@property (nonatomic, strong) UIView *bgView;
@property (nonatomic, strong) UIView *bg1View;
@property (nonatomic, strong) UIImageView* iconView;
@property (nonatomic, strong) UIImageView* icon2View;

@property (nonatomic, strong) UITextField *phoneTextField;
@property (nonatomic, strong) UITextField *passwordTextField;

@property (nonatomic, strong) UIButton *loginButton;
@property (nonatomic, strong) UIButton *zcButton;
@property (nonatomic, strong) UIButton *passwordButton;

@property (nonatomic, strong) UIButton *testButton;

@end

@implementation ETHLoginVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    [self setupUI];
}


- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self.navigationController setNavigationBarHidden:YES animated:animated];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    [self.navigationController setNavigationBarHidden:NO animated:animated];
}



- (void)setupUI
{
    [self.view addSubview:self.bjIconView];
    [self.view addSubview:self.headView];
    [self.view addSubview:self.bgView];
    [self.view addSubview:self.bg1View];
    [self.view addSubview:self.iconView];
    [self.view addSubview:self.icon2View];
    [self.view addSubview:self.phoneTextField];
    [self.view addSubview:self.passwordTextField];
    
    [self.view addSubview:self.loginButton];
    [self.view addSubview:self.zcButton];
    [self.view addSubview:self.passwordButton];
    
    [_bjIconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    
    [_headView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.view);
        make.top.equalTo(self.view).offset(39+LL_NavigationBarHeight);
    }];
    
    [_bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->_headView.mas_bottom).offset(40);
        make.left.equalTo(self.view).offset(10);
        make.right.equalTo(self.view).offset(-10);
        make.height.mas_equalTo(40);
    }];
    
    [_bg1View mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->_bgView.mas_bottom).offset(20);
        make.left.equalTo(self.view).offset(10);
        make.right.equalTo(self.view).offset(-10);
        make.height.mas_equalTo(40);
    }];
    
    [_iconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->_bgView.mas_left).offset(10);
        make.centerY.equalTo(self->_bgView);
    }];
    
    [_phoneTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->_bgView.mas_left).offset(30);
        make.top.bottom.equalTo(self->_bgView);
        make.right.mas_equalTo(-15);
    }];
    
    [_icon2View mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->_bg1View.mas_left).offset(10);
        make.centerY.equalTo(self->_bg1View);
    }];
    
    [_passwordTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->_bg1View.mas_left).offset(30);
        make.top.bottom.equalTo(self->_bg1View);
        make.right.mas_equalTo(-15);
    }];
    
    [_loginButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->_passwordTextField.mas_bottom).offset(30);
        make.left.equalTo(self.view).offset(10);
        make.right.equalTo(self.view).offset(-10);
        make.height.mas_equalTo(40);
    }];
    
    [_zcButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.top.equalTo(self->_loginButton.mas_bottom).offset(5);
    }];
    
    [_passwordButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-10);
        make.top.equalTo(self->_loginButton.mas_bottom).offset(5);
    }];
    
    
    
#ifdef APP_TEST
    [self.view addSubview:self.testButton];
    [_testButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(50);
        make.right.mas_equalTo(-20);
    }];
#else
    
#endif
    
}

//登录按钮被点击
- (void)loginButtonDidClick
{
    //模拟登录成功
    [[NSNotificationCenter defaultCenter] postNotificationName:UserLoginRegisterNotification object:nil userInfo:nil];
}

//注册按钮被点击
-(void)zcButtonDidClick
{
        ETHRegisterVC* vc = [[ETHRegisterVC alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
}

//密码找回按钮被点击
-(void)wmButtonDidClick
{
    ETHRegisterVC* vc = [[ETHRegisterVC alloc]init];
    vc.loginTitle = @"立即找回";
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)testButtonDidClick
{
    NSString* username = @"13322222222";
    NSString* passwd = @"123456";
    [self toLogin:username password:passwd];
}

//登录
-(void)toLogin:(NSString*)username password:(NSString*)password
{
    ZWeakSelf
    [SVProgressHUD showWithStatus:@"正在登录"];
    [http_user login:username password:password success:^(id responseObject)
     {
         [SVProgressHUD showSuccessWithStatus:@"登录成功"];
         [weakSelf toLogin_ok:responseObject];
     } failure:^(NSError *error) {
         [SVProgressHUD showErrorWithStatus:error.domain];
     }];
}

-(void)toLogin_ok:(id)responseObject
{
    if(kObjectIsEmpty(responseObject))
    {
        return;
    }
    
    UserInfoModel* user = [UserInfoModel mj_objectWithKeyValues:responseObject];
    [user saveUserInfo];
    
    //登录成功通知
    [[NSNotificationCenter defaultCenter] postNotificationName:UserLoginRegisterNotification object:self];
    
}



- (UIImageView *)headView {
    if (_headView == nil) {
        _headView = [[UIImageView alloc] init];
        _headView.image = [UIImage imageNamed:@"logo"];
    }
    return _headView;
}

- (UITextField *)phoneTextField {
    if (_phoneTextField == nil) {
        _phoneTextField = [[UITextField alloc] init];
        _phoneTextField.placeholder = @"请您输入您的手机号码";
        _phoneTextField.font = [UIFont systemFontOfSize:12];
        _phoneTextField.textColor = RGBColorHex(0xffffff);
        // 重点
        NSAttributedString *attrString = [[NSAttributedString alloc] initWithString:@"请您输入您的手机号码" attributes:
                                          @{NSForegroundColorAttributeName:RGBColorHex(0x92a0b3),
                                            NSFontAttributeName:_phoneTextField.font
                                            }];
        _phoneTextField.attributedPlaceholder = attrString;
        _phoneTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
        _phoneTextField.keyboardType = UIKeyboardTypeNumberPad;
    }
    return _phoneTextField;
}

- (UITextField *)passwordTextField {
    if (_passwordTextField == nil) {
        _passwordTextField = [[UITextField alloc] init];
        _passwordTextField.placeholder = @"请您输入您的登录密码";
        _passwordTextField.font = [UIFont systemFontOfSize:12];
        _passwordTextField.textColor = RGBColorHex(0xffffff);
        // 重点
        NSAttributedString *attrString = [[NSAttributedString alloc] initWithString:@"请您输入您的登录密码" attributes:
                                          @{NSForegroundColorAttributeName:RGBColorHex(0x92a0b3),
                                            NSFontAttributeName:_passwordTextField.font
                                            }];
        _passwordTextField.attributedPlaceholder = attrString;
        _passwordTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
        _passwordTextField.keyboardType = UIKeyboardTypeNumberPad;
        _passwordTextField.secureTextEntry = YES;
    }
    return _passwordTextField;
}

-(UIView *)bgView
{
    if(_bgView==nil)
    {
        _bgView = [[UIView alloc]initWithFrame:CGRectZero];
        _bgView.layer.borderWidth = 1.0f;
        _bgView.layer.borderColor = RGBColorHex(0xcdcdcd).CGColor;
        _bgView.layer.cornerRadius = 3.0f;
    }
    return _bgView;
}

-(UIView *)bg1View
{
    if(_bg1View==nil)
    {
        _bg1View = [[UIView alloc]initWithFrame:CGRectZero];
        _bg1View.layer.borderWidth = 1.0f;
        _bg1View.layer.borderColor = RGBColorHex(0xcdcdcd).CGColor;
        _bg1View.layer.cornerRadius = 3.0f;
    }
    return _bg1View;
}


- (UIImageView *)bjIconView {
    if (_bjIconView == nil) {
        _bjIconView = [[UIImageView alloc] init];
        _bjIconView.image = [UIImage imageNamed:@"background"];
    }
    return _bjIconView;
}

- (UIImageView *)iconView {
    if (_iconView == nil) {
        _iconView = [[UIImageView alloc] init];
        _iconView.image = [UIImage imageNamed:@"Mobile phone"];
    }
    return _iconView;
}

- (UIImageView *)icon2View {
    if (_icon2View == nil) {
        _icon2View = [[UIImageView alloc] init];
        _icon2View.image = [UIImage imageNamed:@"lock"];
    }
    return _icon2View;
}

- (UIButton *)loginButton {
    if (_loginButton == nil) {
        _loginButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_loginButton setTitle:@"立即登录" forState:UIControlStateNormal];
        _loginButton.titleLabel.font = [UIFont systemFontOfSize:12];
        [_loginButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _loginButton.layer.cornerRadius = 3;
        _loginButton.clipsToBounds = YES;
        _loginButton.layer.borderWidth = 1.0f;
        _loginButton.layer.borderColor = RGBColorHex(0xffffff).CGColor;
        [_loginButton addTarget:self action:@selector(loginButtonDidClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _loginButton;
}

- (UIButton *)zcButton {
    if (_zcButton == nil) {
        _zcButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_zcButton setTitle:@"立即注册" forState:UIControlStateNormal];
        _zcButton.titleLabel.font = [UIFont systemFontOfSize:10];
        [_zcButton setTitleColor:RGBColorHex(0xdfe4eb) forState:UIControlStateNormal];
        [_zcButton addTarget:self action:@selector(zcButtonDidClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _zcButton;
}

- (UIButton *)passwordButton {
    if (_passwordButton == nil) {
        _passwordButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_passwordButton setTitle:@"密码找回" forState:UIControlStateNormal];
        _passwordButton.titleLabel.font = [UIFont systemFontOfSize:10];
        [_passwordButton setTitleColor:RGBColorHex(0xdfe4eb) forState:UIControlStateNormal];
        [_passwordButton addTarget:self action:@selector(wmButtonDidClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _passwordButton;
}

- (UIButton *)testButton {
    if (_testButton == nil) {
        _testButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_testButton setTitle:@"测试账号" forState:UIControlStateNormal];
        [_testButton setTitleColor:RGBColorHex(0xffffff) forState:UIControlStateNormal];
        [_testButton addTarget:self action:@selector(testButtonDidClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _testButton;
}

@end
