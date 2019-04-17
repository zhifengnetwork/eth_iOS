//
//  ETHResetPasswordVC.m
//  ETH
//
//  Created by weiming zhang on 2019/4/12.
//  Copyright © 2019 admin. All rights reserved.
//

#import "ETHResetPasswordVC.h"
#import "http_mine.h"
#import "SVProgressHUD.h"
#import "MJExtension.h"
#import "CQCountDownButton.h"


@interface ETHResetPasswordVC ()
@property (nonatomic, strong)UIView *bgView;
@property (nonatomic, strong)UILabel *phoneNumberLabel;
@property (nonatomic, strong)UITextField *phoneNumberTF;
@property (nonatomic, strong)UIView *lineView1;
@property (nonatomic, strong)UILabel *identifyingCodeLabel;
@property (nonatomic, strong)UITextField *identifyingCodeTF;
@property (nonatomic, strong)UIView *lineView2;
@property (nonatomic, strong)UILabel *freshPassWordLabel;
@property (nonatomic, strong)UITextField *freshPassWordTF;
@property (nonatomic, strong)UIView *lineView3;
@property (nonatomic, strong)UILabel *confirmPassWordLabel;
@property (nonatomic, strong)UITextField *confirmPassWordTF;
@property (nonatomic, strong)UIButton *changeButton;

@property (nonatomic, strong) CQCountDownButton* vcodeButton;
@end

@implementation ETHResetPasswordVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = RGBColorHex(0xf5f5f5);
    self.title = @"修改密码";
    [self setup];
}
- (void)setup{
    [self.view addSubview:self.bgView];
    [self.bgView addSubview:self.phoneNumberLabel];
    [self.bgView addSubview:self.phoneNumberTF];
    [self.bgView addSubview:self.lineView1];
    [self.bgView addSubview:self.identifyingCodeLabel];
    [self.bgView addSubview:self.identifyingCodeTF];
    [self.bgView addSubview:self.lineView2];
    [self.bgView addSubview:self.freshPassWordLabel];
    [self.bgView addSubview:self.freshPassWordTF];
    [self.bgView addSubview:self.lineView3];
    [self.bgView addSubview:self.confirmPassWordLabel];
    [self.bgView addSubview:self.confirmPassWordTF];
    [self.view addSubview:self.changeButton];
    [self.view addSubview:self.vcodeButton];
    [_bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).with.offset(10);
        make.left.equalTo(self.view).with.offset(9);
        make.right.equalTo(self.view).with.offset(-9);
        make.height.mas_equalTo(123);
    }];
    [_phoneNumberLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.bgView).with.offset(9.5);
        make.left.equalTo(self.bgView).with.offset(15);
    }];
    [_phoneNumberTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.bgView);
        make.left.equalTo(self.phoneNumberLabel.mas_right).with.offset(32.5);
        make.width.mas_equalTo(200);
        make.height.mas_equalTo(30);
    }];
    [_lineView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.bgView).with.offset(30);
        make.left.equalTo(self.bgView).with.offset(15);
        make.right.equalTo(self.bgView).with.offset(-15);
        make.height.mas_equalTo(1);
    }];
    [_identifyingCodeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.lineView1).with.offset(9.5);
        make.left.equalTo(self.bgView).with.offset(15);
    }];
    [_identifyingCodeTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.lineView1);
        make.left.equalTo(self.identifyingCodeLabel.mas_right).with.offset(32.5);
        make.width.mas_equalTo(200);
        make.height.mas_equalTo(30);
    }];
    
    [_vcodeButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.identifyingCodeTF);
        make.right.equalTo(self.bgView).with.offset(-18);
        make.width.mas_equalTo(70);
        make.height.mas_equalTo(20);
    }];
    
    [_lineView2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.lineView1).with.offset(30);
        make.left.equalTo(self.bgView).with.offset(15);
        make.right.equalTo(self.bgView).with.offset(-15);
        make.height.mas_equalTo(1);
    }];
    [_freshPassWordLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.lineView2).with.offset(9.5);
        make.left.equalTo(self.bgView).with.offset(15);
    }];
    [_freshPassWordTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.lineView2);
        make.left.equalTo(self.freshPassWordLabel.mas_right).with.offset(32.5);
        make.width.mas_equalTo(200);
        make.height.mas_equalTo(30);
    }];
    [_lineView3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.lineView2).with.offset(30);
        make.left.equalTo(self.bgView).with.offset(15);
        make.right.equalTo(self.bgView).with.offset(-15);
        make.height.mas_equalTo(1);
    }];
    [_confirmPassWordLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.lineView3).with.offset(9.5);
        make.left.equalTo(self.bgView).with.offset(15);
    }];
    [_confirmPassWordTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.lineView3);
        make.left.equalTo(self.confirmPassWordLabel.mas_right).with.offset(20.5);
        make.width.mas_equalTo(200);
        make.height.mas_equalTo(30);
    }];
    [_changeButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.bgView.mas_bottom).with.offset(290.5);
        make.left.equalTo(self.view).with.offset(9);
        make.right.equalTo(self.view).with.offset(-9);
        make.height.mas_equalTo(35);
    }];
}
- (UIView *)bgView{
    if (_bgView == nil) {
        _bgView = [[UIView alloc]init];
        _bgView.backgroundColor = RGBColorHex(0x224eaf);
        _bgView.layer.cornerRadius = 3;
    }return _bgView;
}
- (UILabel *)phoneNumberLabel{
    if (_phoneNumberLabel == nil) {
        _phoneNumberLabel = [[UILabel alloc]init];
        _phoneNumberLabel.font = [UIFont systemFontOfSize:12];
        _phoneNumberLabel.textColor = [UIColor whiteColor];
        _phoneNumberLabel.text = @"手机号";
    }return _phoneNumberLabel;
}
- (UITextField *)phoneNumberTF{
    if (_phoneNumberTF == nil) {
        _phoneNumberTF = [[UITextField alloc]init];
        _phoneNumberTF.textColor = RGBColorHex(0xe3e3e3);
        _phoneNumberTF.font =[UIFont systemFontOfSize:10];
        _phoneNumberTF.placeholder = @"请输入手机号";
        [_phoneNumberTF setValue:RGBColorHex(0xe3e3e3) forKeyPath:@"_placeholderLabel.textColor"];
        [_phoneNumberTF setValue:[UIFont systemFontOfSize:10] forKeyPath:@"_placeholderLabel.font"];
    }return _phoneNumberTF;
}
- (UIView *)lineView1{
    if (_lineView1 == nil) {
        _lineView1 = [[UIView alloc]init];
        _lineView1.backgroundColor = [UIColor whiteColor];
    }return _lineView1;
}
- (UILabel *)identifyingCodeLabel{
    if (_identifyingCodeLabel == nil) {
        _identifyingCodeLabel = [[UILabel alloc]init];
        _identifyingCodeLabel.font = [UIFont systemFontOfSize:12];
        _identifyingCodeLabel.textColor = [UIColor whiteColor];
        _identifyingCodeLabel.text = @"验证码";
    }return _identifyingCodeLabel;
}
- (UITextField *)identifyingCodeTF{
    if (_identifyingCodeTF == nil) {
        _identifyingCodeTF = [[UITextField alloc]init];
        _identifyingCodeTF.textColor = RGBColorHex(0xe3e3e3);
        _identifyingCodeTF.font =[UIFont systemFontOfSize:10];
        _identifyingCodeTF.placeholder = @"请输入5位验证码";
        [_identifyingCodeTF setValue:RGBColorHex(0xe3e3e3) forKeyPath:@"_placeholderLabel.textColor"];
        [_identifyingCodeTF setValue:[UIFont systemFontOfSize:10] forKeyPath:@"_placeholderLabel.font"];
    }return _identifyingCodeTF;
}
- (UIView *)lineView2{
    if (_lineView2 == nil) {
        _lineView2 = [[UIView alloc]init];
        _lineView2.backgroundColor = [UIColor whiteColor];
    }return _lineView2;
}
- (UILabel *)freshPassWordLabel{
    if (_freshPassWordLabel == nil) {
        _freshPassWordLabel = [[UILabel alloc]init];
        _freshPassWordLabel.font = [UIFont systemFontOfSize:12];
        _freshPassWordLabel.textColor = [UIColor whiteColor];
        _freshPassWordLabel.text = @"新密码";
    }return _freshPassWordLabel;
}
- (UITextField *)freshPassWordTF{
    if (_freshPassWordTF == nil) {
        _freshPassWordTF = [[UITextField alloc]init];
        _freshPassWordTF.textColor = RGBColorHex(0xe3e3e3);
        _freshPassWordTF.font =[UIFont systemFontOfSize:10];
        _freshPassWordTF.placeholder = @"请输入您的登录密码";
        [_freshPassWordTF setValue:RGBColorHex(0xe3e3e3) forKeyPath:@"_placeholderLabel.textColor"];
        [_freshPassWordTF setValue:[UIFont systemFontOfSize:10] forKeyPath:@"_placeholderLabel.font"];
    }return _freshPassWordTF;
}
- (UIView *)lineView3{
    if (_lineView3 == nil) {
        _lineView3 = [[UIView alloc]init];
        _lineView3.backgroundColor = [UIColor whiteColor];
    }return _lineView3;
}
- (UILabel *)confirmPassWordLabel{
    if (_confirmPassWordLabel == nil) {
        _confirmPassWordLabel = [[UILabel alloc]init];
        _confirmPassWordLabel.font = [UIFont systemFontOfSize:12];
        _confirmPassWordLabel.textColor = [UIColor whiteColor];
        _confirmPassWordLabel.text = @"确认密码";
    }return _confirmPassWordLabel;
}
- (UITextField *)confirmPassWordTF{
    if (_confirmPassWordTF == nil) {
        _confirmPassWordTF = [[UITextField alloc]init];
        _confirmPassWordTF.textColor = RGBColorHex(0xe3e3e3);
        _confirmPassWordTF.font =[UIFont systemFontOfSize:10];
        _confirmPassWordTF.placeholder = @"请输入确认登录密码";
        [_confirmPassWordTF setValue:RGBColorHex(0xe3e3e3) forKeyPath:@"_placeholderLabel.textColor"];
        [_confirmPassWordTF setValue:[UIFont systemFontOfSize:10] forKeyPath:@"_placeholderLabel.font"];
    }return _confirmPassWordTF;
}
- (UIButton *)changeButton{
    if (_changeButton == nil) {
        _changeButton = [[UIButton alloc]init];
        _changeButton.titleLabel.font = [UIFont systemFontOfSize:20];
        [_changeButton setTitle:@"立即修改" forState:UIControlStateNormal];
        [_changeButton setTitleColor:RGBColorHex(0xffffff) forState:UIControlStateNormal];
        _changeButton.layer.cornerRadius = 3;
        _changeButton.backgroundColor = RGBColorHex(0x224eaf);
        [_changeButton addTarget:self action:@selector(changeButtonClick) forControlEvents:UIControlEventTouchUpInside];
    }return _changeButton;
}

- (void)changeButtonClick
{
    NSString* phone = _phoneNumberTF.text;
    NSString* identifying = _identifyingCodeTF.text;
    NSString* freshPass = _freshPassWordTF.text;
    NSString* confirmPass = _confirmPassWordTF.text;
    
    if (kStringIsEmpty(phone))
    {
        [SVProgressHUD showInfoWithStatus:@"请输入手机号"];
        return;
    }
    
    if (kStringIsEmpty(identifying))
    {
        [SVProgressHUD showInfoWithStatus:@"请输入5位验证码"];
        return;
    }
    
    if (kStringIsEmpty(freshPass))
    {
        [SVProgressHUD showInfoWithStatus:@"请输入您的登录密码"];
        return;
    }
    
    if (kStringIsEmpty(confirmPass))
    {
        [SVProgressHUD showInfoWithStatus:@"请输入确认登录密码"];
        return;
    }
    
    if ([freshPass isEqualToString:confirmPass]==NO)
    {
        [SVProgressHUD showInfoWithStatus:@"两次密码不一致"];
        return;
    }
    
    ZWeakSelf
    [http_mine changepwd:phone code:identifying pwd:confirmPass success:^(id responseObject)
    {
        [weakSelf sdData:responseObject];
    } failure:^(NSError *error) {
        [SVProgressHUD showErrorWithStatus:error.domain];
    }];
}

-(void)sdData:(id)responseObject
{
    [SVProgressHUD showSuccessWithStatus:@"修改密码成功"];
    [self.navigationController popToRootViewControllerAnimated:YES];
}


- (void)vcodeButtonDidClick
{
    NSString* phone = _phoneNumberTF.text;
    
    ZWeakSelf
    [http_mine verifycode:phone temp:@"sms_changepwd" imgcode:@"0" success:^(id responseObject)
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
        _vcodeButton.layer.cornerRadius = 5.0f;
        _vcodeButton.layer.borderWidth = 1.0f;
        _vcodeButton.layer.borderColor = [UIColor whiteColor].CGColor;
        //        [_vcodeButton addTarget:self action:@selector(vcodeButtonDidClick) forControlEvents:UIControlEventTouchUpInside];
        __weak typeof(self) weakSelf = self;
        [_vcodeButton configDuration:60 buttonClicked:^{
            //========== 按钮点击 ==========//
            if ( kStringIsEmpty(weakSelf.phoneNumberTF.text) )
            {
                [SVProgressHUD showInfoWithStatus:@"请输入手机号码"];
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
