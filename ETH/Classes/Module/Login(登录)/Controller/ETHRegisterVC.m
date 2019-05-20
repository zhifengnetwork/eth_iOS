//
//  ETHRegisterVC.m
//  ZF
//
//  Created by apple on 2019/2/26.
//  Copyright © 2019 hyy. All rights reserved.
//

#import "ETHRegisterVC.h"
#import "ETHRegisterVC.h"
#import "JKCountDownButton.h"
#import "LoginTypeView.h"
#import "UIImageView+WebCache.h"
#import "UIButton+LXMImagePosition.h"
#import "ETHLoginVC.h"
#import "ETHTool.h"
#import "http_mine.h"
#import "SVProgressHUD.h"
#import "MJExtension.h"
#import "UserInfoModel.h"
#import "CQCountDownButton.h"

@interface ETHRegisterVC ()<LoginTypeViewDelegate>

@property (nonatomic, strong) UIImageView* bjIconView;
@property (nonatomic, strong) UIButton *returnButton;
@property (nonatomic, strong) UIImageView* headView;

@property (nonatomic, strong) UIView *bg4View;
@property (nonatomic, strong) UIView *bgView;
@property (nonatomic, strong) UIView *bg1View;
@property (nonatomic, strong) UIView *bg2View;
@property (nonatomic, strong) UIView *bg3View;
@property (nonatomic, strong) UIImageView* iconView;
@property (nonatomic, strong) UIImageView* icon1View;
@property (nonatomic, strong) UIImageView* icon2View;
@property (nonatomic, strong) UIImageView* icon3View;

@property (nonatomic, strong) UILabel *recommenderLabel;
@property (nonatomic, strong) UITextField *recommenderField;
@property (nonatomic, strong) UITextField *phoneTextField;
@property (nonatomic, strong) UITextField *vcodeTextField;
@property (nonatomic, strong) UITextField *passwordTextField;
@property (nonatomic, strong) UITextField *twoPasswordTextField;

@property (nonatomic, strong) UIButton *loginButton;
@property (nonatomic, strong) UIButton *wmButton;
@property (nonatomic, strong) UIButton *twoLoginButton;

@property (nonatomic, strong) CQCountDownButton* vcodeButton;

@end

@implementation ETHRegisterVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    self.view.backgroundColor = [UIColor whiteColor];
    [self setupUI];
    if (self.type.intValue==0)
    {
        [self.loginButton setTitle:@"立即注册" forState:UIControlStateNormal];
        self.isShowBgview = NO;
        self.isShowLabel = NO;
        self.isShowField = NO;
    }
    else
    {
        [self.loginButton setTitle:@"立即找回" forState:UIControlStateNormal];
        
    }
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self.navigationController setNavigationBarHidden:YES animated:animated];
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    [self.navigationController setNavigationBarHidden:NO animated:animated];
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleDefault;
}


- (void)setupUI
{
    [self.view addSubview:self.bjIconView];
    [self.view addSubview:self.returnButton];
    [self.view addSubview:self.headView];
    [self.view addSubview:self.bg4View];
    [self.view addSubview:self.bgView];
    [self.view addSubview:self.bg1View];
    [self.view addSubview:self.bg2View];
    [self.view addSubview:self.bg3View];
    [self.view addSubview:self.iconView];
    [self.view addSubview:self.icon1View];
    [self.view addSubview:self.icon2View];
    [self.view addSubview:self.icon3View];
    [self.view addSubview:self.recommenderLabel];
    [self.view addSubview:self.recommenderField];
    [self.view addSubview:self.phoneTextField];
    [self.view addSubview:self.vcodeTextField];
    [self.view addSubview:self.vcodeButton];
    [self.view addSubview:self.passwordTextField];
    [self.view addSubview:self.twoPasswordTextField];
    
    [self.view addSubview:self.loginButton];
    [self.view addSubview:self.wmButton];
    [self.view addSubview:self.twoLoginButton];
    
    [_bjIconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    
    [_headView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.view);
        make.top.equalTo(self.view).offset(19+LL_StatusBarAndNavigationBarHeight);
    }];
    
    [_returnButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(20);
        make.top.mas_equalTo(30);
    }];
    
    [_bg4View mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->_headView.mas_bottom).offset(40);
        make.left.equalTo(self.view).offset(10);
        make.right.equalTo(self.view).offset(-10);
        make.height.mas_equalTo(40);
    }];
    self.isShowBgview = YES;
    
    [_bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->_bg4View.mas_bottom).offset(10);
        make.left.equalTo(self.view).offset(10);
        make.right.equalTo(self.view).offset(-10);
        make.height.mas_equalTo(40);
    }];
    
    [_bg1View mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->_bgView.mas_bottom).offset(10);
        make.left.equalTo(self.view).offset(10);
        make.width.mas_equalTo(220);
        make.height.mas_equalTo(40);
    }];
    
    [_bg2View mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->_bg1View.mas_bottom).offset(10);
        make.left.equalTo(self.view).offset(10);
        make.right.equalTo(self.view).offset(-10);
        make.height.mas_equalTo(40);
    }];
    
    [_bg3View mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->_bg2View.mas_bottom).offset(10);
        make.left.equalTo(self.view).offset(10);
        make.right.equalTo(self.view).offset(-10);
        make.height.mas_equalTo(40);
    }];
    
    [_iconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->_bgView.mas_left).offset(10);
        make.centerY.equalTo(self->_bgView);
    }];
    
    [_icon1View mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->_bg1View.mas_left).offset(10);
        make.centerY.equalTo(self->_bg1View);
    }];
    
    [_icon2View mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->_bg2View.mas_left).offset(10);
        make.centerY.equalTo(self->_bg2View);
    }];
    
    [_icon3View mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->_bg3View.mas_left).offset(10);
        make.centerY.equalTo(self->_bg3View);
    }];
    
    [_phoneTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->_bgView.mas_left).offset(30);
        make.top.bottom.equalTo(self->_bgView);
        make.right.mas_equalTo(-15);
    }];
    
    [_recommenderLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->_bg4View.mas_left).offset(20);
        make.centerY.equalTo(self->_bg4View);
    }];
    self.isShowLabel = YES;
    
    [_recommenderField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->_recommenderLabel.mas_right);
        make.top.bottom.equalTo(self->_bg4View);
        make.right.mas_equalTo(-15);
    }];
    self.isShowField = YES;
    
    [_vcodeTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->_bg1View.mas_left).offset(30);
        make.top.bottom.equalTo(self->_bg1View);
        make.right.mas_equalTo(-15);
    }];
    
    [_vcodeButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->_bg1View.mas_right).offset(10);
        make.top.bottom.equalTo(self->_bg1View);
        make.width.mas_equalTo(125);
        make.height.mas_equalTo(40);
    }];
    
    [_passwordTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->_bg2View.mas_left).offset(30);
        make.top.bottom.equalTo(self->_bg2View);
        make.right.mas_equalTo(-15);
    }];
    
    
    [_twoPasswordTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->_bg3View.mas_left).offset(30);
        make.top.bottom.equalTo(self->_bg3View);
        make.right.mas_equalTo(-15);
    }];
    
    [_loginButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->_twoPasswordTextField.mas_bottom).offset(30);
        make.left.equalTo(self.view).offset(10);
        make.right.equalTo(self.view).offset(-10);
        make.height.mas_equalTo(40);
    }];
    
    [_wmButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.top.equalTo(self->_loginButton.mas_bottom).offset(5);
    }];
    
    [_twoLoginButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-10);
        make.top.equalTo(self->_loginButton.mas_bottom).offset(5);
    }];

}

-(void)setIsShowBgview:(BOOL)isShowBgview
{
    _isShowBgview = isShowBgview;
    
    self.bg4View.hidden = _isShowBgview;
}

-(void)setIsShowLabel:(BOOL)isShowLabel
{
    _isShowLabel = isShowLabel;
    
    _recommenderLabel.hidden = _isShowLabel;
}

-(void)setIsShowField:(BOOL)isShowField
{
    _isShowField = isShowField;
    
    _recommenderField.hidden = _isShowField;
}


- (void)wmButtonDidClick
{
    ETHRegisterVC* vc = [[ETHRegisterVC alloc]init];
    vc.type = @"1";
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)twoLoginButtonDidClick
{
    ETHLoginVC* vc = [[ETHLoginVC alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)returnButtonDidClick
{
    ETHLoginVC* vc = [[ETHLoginVC alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}


- (UIImageView *)bjIconView {
    if (_bjIconView == nil) {
        _bjIconView = [[UIImageView alloc] init];
        _bjIconView.image = [UIImage imageNamed:@"background"];
    }
    return _bjIconView;
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

- (UILabel *)recommenderLabel {
    if (_recommenderLabel == nil) {
        _recommenderLabel = [[UILabel alloc] init];
        _recommenderLabel.textColor = RGBColorHex(0xffffff);
        _recommenderLabel.font = [UIFont systemFontOfSize:12];
        _recommenderLabel.text = @"推荐人ID:";
    }
    return _recommenderLabel;
}


- (UITextField *)recommenderField {
    if (_recommenderField == nil) {
        _recommenderField = [[UITextField alloc] init];
        _recommenderField.font = [UIFont systemFontOfSize:12];
        _recommenderField.textColor = RGBColorHex(0xffffff);
    }
    return _recommenderField;
}

- (UITextField *)vcodeTextField {
    if (_vcodeTextField == nil) {
        _vcodeTextField = [[UITextField alloc] init];
        _vcodeTextField.placeholder = @"请您输入5位验证码";
        _vcodeTextField.font = [UIFont systemFontOfSize:12];
        _vcodeTextField.textColor = RGBColorHex(0xffffff);
        // 重点
        NSAttributedString *attrString = [[NSAttributedString alloc] initWithString:@"请您输入您的手机号码" attributes:
                                          @{NSForegroundColorAttributeName:RGBColorHex(0x92a0b3),
                                            NSFontAttributeName:_phoneTextField.font
                                            }];
        _vcodeTextField.attributedPlaceholder = attrString;
        _vcodeTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
        _vcodeTextField.keyboardType = UIKeyboardTypeNumberPad;
    }
    return _vcodeTextField;
}

- (UITextField *)passwordTextField {
    if (_passwordTextField == nil) {
        _passwordTextField = [[UITextField alloc] init];
        _passwordTextField.placeholder = @"请输入您的登录密码";
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

- (UITextField *)twoPasswordTextField {
    if (_twoPasswordTextField == nil) {
        _twoPasswordTextField = [[UITextField alloc] init];
        _twoPasswordTextField.placeholder = @"请再输入您的登录密码";
        _twoPasswordTextField.font = [UIFont systemFontOfSize:12];
        _twoPasswordTextField.textColor = RGBColorHex(0xffffff);
        // 重点
        NSAttributedString *attrString = [[NSAttributedString alloc] initWithString:@"请您输入您的登录密码" attributes:
                                          @{NSForegroundColorAttributeName:RGBColorHex(0x92a0b3),
                                            NSFontAttributeName:_passwordTextField.font
                                            }];
        _twoPasswordTextField.attributedPlaceholder = attrString;
        _twoPasswordTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
        _twoPasswordTextField.keyboardType = UIKeyboardTypeNumberPad;
        _twoPasswordTextField.secureTextEntry = YES;
    }
    return _twoPasswordTextField;
}

-(UIView *)bg4View
{
    if(_bg4View==nil)
    {
        _bg4View = [[UIView alloc]initWithFrame:CGRectZero];
        _bg4View.layer.borderWidth = 1.0f;
        _bg4View.layer.borderColor = RGBColorHex(0xcdcdcd).CGColor;
        _bg4View.layer.cornerRadius = 3.0f;
    }
    return _bg4View;
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

-(UIView *)bg2View
{
    if(_bg2View==nil)
    {
        _bg2View = [[UIView alloc]initWithFrame:CGRectZero];
        _bg2View.layer.borderWidth = 1.0f;
        _bg2View.layer.borderColor = RGBColorHex(0xcdcdcd).CGColor;
        _bg2View.layer.cornerRadius = 3.0f;
    }
    return _bg2View;
}

-(UIView *)bg3View
{
    if(_bg3View==nil)
    {
        _bg3View = [[UIView alloc]initWithFrame:CGRectZero];
        _bg3View.layer.borderWidth = 1.0f;
        _bg3View.layer.borderColor = RGBColorHex(0xcdcdcd).CGColor;
        _bg3View.layer.cornerRadius = 3.0f;
    }
    return _bg3View;
}

- (UIImageView *)iconView {
    if (_iconView == nil) {
        _iconView = [[UIImageView alloc] init];
        _iconView.image = [UIImage imageNamed:@"Mobile phone"];
    }
    return _iconView;
}

- (UIImageView *)icon1View {
    if (_icon1View == nil) {
        _icon1View = [[UIImageView alloc] init];
        _icon1View.image = [UIImage imageNamed:@"Verification code"];
    }
    return _icon1View;
}

- (UIImageView *)icon2View {
    if (_icon2View == nil) {
        _icon2View = [[UIImageView alloc] init];
        _icon2View.image = [UIImage imageNamed:@"lock"];
    }
    return _icon2View;
}

- (UIImageView *)icon3View {
    if (_icon3View == nil) {
        _icon3View = [[UIImageView alloc] init];
        _icon3View.image = [UIImage imageNamed:@"lock"];
    }
    return _icon3View;
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

- (UIButton *)wmButton {
    if (_wmButton == nil) {
        _wmButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_wmButton setTitle:@"忘记密码" forState:UIControlStateNormal];
        _wmButton.titleLabel.font = [UIFont systemFontOfSize:10];
        [_wmButton setTitleColor:RGBColorHex(0xdfe4eb) forState:UIControlStateNormal];
        [_wmButton addTarget:self action:@selector(wmButtonDidClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _wmButton;
}

- (UIButton *)twoLoginButton {
    if (_twoLoginButton == nil) {
        _twoLoginButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_twoLoginButton setTitle:@"立即登录" forState:UIControlStateNormal];
        _twoLoginButton.titleLabel.font = [UIFont systemFontOfSize:10];
        [_twoLoginButton setTitleColor:RGBColorHex(0xdfe4eb) forState:UIControlStateNormal];
        [_twoLoginButton addTarget:self action:@selector(twoLoginButtonDidClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _twoLoginButton;
}

- (UIButton *)returnButton {
    if (_returnButton == nil) {
        _returnButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_returnButton setImage:[UIImage imageNamed:@"Left arrow-1"] forState:UIControlStateNormal];
        _returnButton.titleLabel.font = [UIFont systemFontOfSize:10];
        [_returnButton setTitleColor:RGBColorHex(0xdfe4eb) forState:UIControlStateNormal];
        [_returnButton addTarget:self action:@selector(returnButtonDidClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _returnButton;
}


- (void)loginButtonDidClick
{
    NSString* phone = _phoneTextField.text;
    NSString* vcode = _vcodeTextField.text;
    NSString* password = _passwordTextField.text;
    NSString* twoPassword = _twoPasswordTextField.text;
    
    if (kStringIsEmpty(phone))
    {
        [SVProgressHUD showInfoWithStatus:@"请输入手机号"];
        return;
    }
    
    if ( [ETHTool isPhoneNumber:phone]==NO )
    {
        [SVProgressHUD showInfoWithStatus:@"请输入正确的手机号码"];
        return;
    }
    
    if (kStringIsEmpty(vcode))
    {
        [SVProgressHUD showInfoWithStatus:@"请输入5位验证码"];
        return;
    }
    
    if (kStringIsEmpty(password))
    {
        [SVProgressHUD showInfoWithStatus:@"请输入您的登录密码"];
        return;
    }
    
    if (kStringIsEmpty(twoPassword))
    {
        [SVProgressHUD showInfoWithStatus:@"请输入确认登录密码"];
        return;
    }
    
    if ([password isEqualToString:twoPassword]==NO)
    {
        [SVProgressHUD showInfoWithStatus:@"两次密码不一致"];
        return;
    }
    
    ZWeakSelf
    [SVProgressHUD showWithStatus:@"正在注册"];
    NSString* str = nil;
    if (self.type.intValue==0)
    {
        str = @"sms_reg";
    }
    else
    {
        str = @"sms_changepwd";
    }
    [http_mine reg_updpwd:str mobile:phone code:vcode.integerValue pwd:twoPassword success:^(id responseObject)
    {
        [weakSelf sdData:responseObject];
    } failure:^(NSError *error) {
        [SVProgressHUD showErrorWithStatus:error.domain];
    }];
}

-(void)sdData:(id)responseObject
{
    if (self.type.intValue==0)
    {
        [SVProgressHUD showSuccessWithStatus:@"注册成功"];
    }
    else
    {
        [SVProgressHUD showSuccessWithStatus:@"修改密码成功"];
    }
    
    [self.navigationController popToRootViewControllerAnimated:YES];
}


- (void)vcodeButtonDidClick
{
    NSString* phone = _phoneTextField.text;
    
    ZWeakSelf
    NSString* str = nil;
    if (self.type.intValue==0)
    {
        str = @"sms_reg";
    }
    else
    {
        str = @"sms_changepwd";
    }
    [http_mine verifycode:phone temp:str imgcode:@"0" success:^(id responseObject)
     {
         [weakSelf verifycode_ok:responseObject];
         
     } failure:^(NSError *error) {
         [SVProgressHUD showErrorWithStatus:error.domain];
     }];
}

-(void)verifycode_ok:(id)responseObject
{
    [SVProgressHUD showSuccessWithStatus:@"发送成功"];
    
}

- (CQCountDownButton *)vcodeButton
{
    if (_vcodeButton == nil) {
        _vcodeButton = [CQCountDownButton buttonWithType:UIButtonTypeCustom];
        [_vcodeButton setTitle:@"获取验证码" forState:UIControlStateNormal];
        [_vcodeButton setTitleColor:RGBColorHex(0xFFFFFF) forState:UIControlStateNormal];
        _vcodeButton.titleLabel.font = [UIFont systemFontOfSize:12];
        _vcodeButton.layer.cornerRadius = 3.0f;
        _vcodeButton.layer.borderWidth = 1.0f;
        _vcodeButton.layer.borderColor = [UIColor whiteColor].CGColor;
        //        [_vcodeButton addTarget:self action:@selector(vcodeButtonDidClick) forControlEvents:UIControlEventTouchUpInside];
        __weak typeof(self) weakSelf = self;
        [_vcodeButton configDuration:60 buttonClicked:^{
            //========== 按钮点击 ==========//
            if ( kStringIsEmpty(weakSelf.phoneTextField.text) )
            {
                [SVProgressHUD showInfoWithStatus:@"请输入手机号码"];
                weakSelf.vcodeButton.enabled = YES;
                return;
            }
            
            if ( [ETHTool isPhoneNumber:weakSelf.phoneTextField.text]==NO )
            {
                [SVProgressHUD showInfoWithStatus:@"请输入正确的手机号码"];
                weakSelf.vcodeButton.enabled = YES;
                return;
            }
            
            [weakSelf.vcodeButton startCountDown];
            [weakSelf vcodeButtonDidClick];
        } countDownStart:^{
            //========== 倒计时开始 ==========//
            NSLog(@"倒计时开始");
        } countDownUnderway:^(NSInteger restCountDownNum) {
            //========== 倒计时进行中 ==========//
            NSString *title = [NSString stringWithFormat:@"%ldS", restCountDownNum];
            [weakSelf.vcodeButton setTitle:title forState:UIControlStateNormal];
        } countDownCompletion:^{
            //========== 倒计时结束 ==========//
            [weakSelf.vcodeButton setTitle:@"获取验证码" forState:UIControlStateNormal];
            NSLog(@"倒计时结束");
        }];
    }
    return _vcodeButton;
}


@end
