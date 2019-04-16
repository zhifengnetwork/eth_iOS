//
//  ETHPayManageVC.m
//  ETH
//
//  Created by weiming zhang on 2019/4/11.
//  Copyright © 2019 admin. All rights reserved.
//

#import "ETHPayManageVC.h"
#import "http_mine.h"
#import "SVProgressHUD.h"
#import "MJExtension.h"
#import "RefreshGifHeader.h"

@interface ETHPayManageVC ()
@property (nonatomic, strong)UIView *view1;
@property (nonatomic, strong)UILabel *cardNumberLabel;
@property (nonatomic, strong)UITextField *cardNumberTF;
@property (nonatomic, strong)UIView *view2;
@property (nonatomic, strong)UILabel *userNameLabel;
@property (nonatomic, strong)UITextField *userNameTF;
@property (nonatomic, strong)UIView *view3;
@property (nonatomic, strong)UILabel *bankNameLabel;
@property (nonatomic, strong)UITextField *bankNameTF;
@property (nonatomic, strong)UIView *view4;
@property (nonatomic, strong)UILabel *alipayLabel;
@property (nonatomic, strong)UIImageView *alipayQRCode;
@property (nonatomic, strong)UIView *view5;
@property (nonatomic, strong)UILabel *weChatLabel;
@property (nonatomic, strong)UIImageView *weChatQRCode;
@property (nonatomic, strong)UIButton *agreeButton;

@end

@implementation ETHPayManageVC

- (void)viewDidLoad {
    [super viewDidLoad];
    //设置导航栏颜色
    self.navigationController.navigationBar.barTintColor = RGBColorHex(0x343946);
    self.navigationController.navigationBar.translucent = NO;
    [self.navigationController.navigationBar setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
    self.title = @"支付管理";
    [self.navigationController.navigationBar setTitleTextAttributes:
  @{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    [self.navigationItem.leftBarButtonItem setImage:[[UIImage imageNamed:@"back"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    [self setup];
}
- (void)setup{
    [self.view addSubview:self.view1];
    [self.view1 addSubview:self.cardNumberLabel];
    [self.view1 addSubview:self.cardNumberTF];
    [self.view addSubview:self.view2];
    [self.view2 addSubview:self.userNameLabel];
    [self.view2 addSubview:self.userNameTF];
    [self.view addSubview:self.view3];
    [self.view3 addSubview:self.bankNameLabel];
    [self.view3 addSubview:self.bankNameTF];
    [self.view addSubview:self.view4];
    [self.view4 addSubview:self.alipayLabel];
    [self.view4 addSubview:self.alipayQRCode];
    [self.view addSubview:self.view5];
    [self.view5 addSubview:self.weChatLabel];
    [self.view5 addSubview:self.weChatQRCode];
    [self.view addSubview:self.agreeButton];
    [_view1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).with.offset(9);
        make.right.equalTo(self.view).with.offset(-9);
        make.top.equalTo(self.view).with.offset(10);
        make.height.mas_equalTo(25);
    }];
    [_cardNumberLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view1).with.offset(16);
        make.centerY.equalTo(self.view1.mas_centerY);
    }];
    [_cardNumberTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.cardNumberLabel.mas_right).with.offset(5);
        make.top.bottom.equalTo(self.view1);
        make.width.mas_equalTo(300);
    }];
    [_view2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view1.mas_bottom).with.offset(5);
        make.left.equalTo(self.view).with.offset(9);
        make.right.equalTo(self.view).with.offset(-9);
        make.height.mas_equalTo(25);
    }];
    [_userNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view2).with.offset(40);
        make.centerY.equalTo(self.view2.mas_centerY);
    }];
    [_userNameTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.userNameLabel.mas_right).with.offset(5);
        make.top.bottom.equalTo(self.view2);
        make.width.mas_equalTo(300);
    }];
    [_view3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view2.mas_bottom).with.offset(5);
        make.left.equalTo(self.view).with.offset(9);
        make.right.equalTo(self.view).with.offset(-9);
        make.height.mas_equalTo(25);
    }];
    [_bankNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view3).with.offset(40);
        make.centerY.equalTo(self.view3.mas_centerY);
    }];
    [_bankNameTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.bankNameLabel.mas_right).with.offset(5);
        make.top.bottom.equalTo(self.view3);
        make.width.mas_equalTo(300);
    }];
    [_view4 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view3.mas_bottom).with.offset(50);
        make.left.equalTo(self.view).with.offset(9);
        make.width.mas_equalTo(172.5);
        make.height.mas_equalTo(175);
    }];
    [_alipayLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view4).with.offset(10);
        make.centerX.equalTo(self.view4.mas_centerX);
    }];
    [_alipayQRCode mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.alipayLabel.mas_bottom).with.offset(16);
        make.centerX.equalTo(self.view4.mas_centerX);
        make.width.height.mas_equalTo(121.5);
    }];
    [_view5 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view3.mas_bottom).with.offset(50);
        make.right.equalTo(self.view).with.offset(-9);
        make.width.mas_equalTo(172.5);
        make.height.mas_equalTo(175);
    }];
    [_weChatLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view5).with.offset(10);
        make.centerX.equalTo(self.view5.mas_centerX);
    }];
    [_weChatQRCode mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.weChatLabel.mas_bottom).with.offset(16);
        make.centerX.equalTo(self.view5.mas_centerX);
        make.width.height.mas_equalTo(121.5);
    }];
    [_agreeButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).with.offset(9);
        make.right.equalTo(self.view).with.offset(-9);
        make.height.mas_equalTo(35);
        make.top.equalTo(self.view4.mas_bottom).with.offset(100);
    }];
}
- (UIView *)view1{
    if (_view1 == nil) {
        _view1 = [[UIView alloc]init];
        _view1.layer.cornerRadius = 3;
        _view1.backgroundColor = RGBColorHex(0x224eaf);
    }return _view1;
}
- (UILabel *)cardNumberLabel{
    if (_cardNumberLabel == nil) {
        _cardNumberLabel = [[UILabel alloc]init];
        _cardNumberLabel.font = [UIFont systemFontOfSize:12];
        _cardNumberLabel.textColor = [UIColor whiteColor];
        _cardNumberLabel.text = @"银行卡卡号：";
    }return _cardNumberLabel;
}
- (UITextField *)cardNumberTF{
    if (_cardNumberTF == nil) {
        _cardNumberTF = [[UITextField alloc]init];
        _cardNumberTF.font = [UIFont systemFontOfSize:12];
        _cardNumberTF.textColor = [UIColor whiteColor];
    }return _cardNumberTF;
}
- (UIView *)view2{
    if (_view2 == nil) {
        _view2 = [[UIView alloc]init];
        _view2.layer.cornerRadius = 3;
        _view2.backgroundColor = RGBColorHex(0x224eaf);
    }return _view2;
}
- (UILabel *)userNameLabel{
    if (_userNameLabel == nil) {
        _userNameLabel = [[UILabel alloc]init];
        _userNameLabel.font = [UIFont systemFontOfSize:12];
        _userNameLabel.textColor = [UIColor whiteColor];
        _userNameLabel.text = @"开户人：";
    }return _userNameLabel;
}
- (UITextField *)userNameTF{
    if (_userNameTF == nil) {
        _userNameTF = [[UITextField alloc]init];
        _userNameTF.font = [UIFont systemFontOfSize:12];
        _userNameTF.textColor = [UIColor whiteColor];
    }return _userNameTF;
}
- (UIView *)view3{
    if (_view3 == nil) {
        _view3 = [[UIView alloc]init];
        _view3.layer.cornerRadius = 3;
        _view3.backgroundColor = RGBColorHex(0x224eaf);
    }return _view3;
}
- (UILabel *)bankNameLabel{
    if (_bankNameLabel ==nil) {
        _bankNameLabel = [[UILabel alloc]init];
        _bankNameLabel.font = [UIFont systemFontOfSize:12];
        _bankNameLabel.textColor = [UIColor whiteColor];
        _bankNameLabel.text = @"开户行：";
    }return _bankNameLabel;
}
- (UITextField *)bankNameTF{
    if (_bankNameTF == nil) {
        _bankNameTF = [[UITextField alloc]init];
        _bankNameTF.font = [UIFont systemFontOfSize:12];
        _bankNameTF.textColor = [UIColor whiteColor];
    }return _bankNameTF;
}
- (UIView *)view4{
    if (_view4 == nil) {
        _view4 = [[UIView alloc]init];
        _view4.layer.cornerRadius = 5;
        _view4.backgroundColor = RGBColorHex(0x224eaf);
    }return _view4;
}
- (UILabel *)alipayLabel{
    if (_alipayLabel == nil) {
        _alipayLabel = [[UILabel alloc]init];
        _alipayLabel.font = [UIFont systemFontOfSize:12];
        _alipayLabel.textColor = [UIColor whiteColor];
        _alipayLabel.text = @"支付宝二维码";
    }return _alipayLabel;
}
- (UIImageView *)alipayQRCode{
    if (_alipayQRCode == nil) {
        _alipayQRCode = [[UIImageView alloc]init];
        _alipayQRCode.image = [UIImage imageNamed:@"erweima"];
    }return _alipayQRCode;
}
- (UIView *)view5{
    if (_view5 == nil) {
        _view5 = [[UIView alloc]init];
        _view5.layer.cornerRadius = 5;
        _view5.backgroundColor = RGBColorHex(0x224eaf);
    }return _view5;
}
- (UILabel *)weChatLabel{
    if (_weChatLabel == nil) {
        _weChatLabel = [[UILabel alloc]init];
        _weChatLabel.font = [UIFont systemFontOfSize:12];
        _weChatLabel.textColor = [UIColor whiteColor];
        _weChatLabel.text = @"微信二维码";
    }return _weChatLabel;
}
- (UIImageView *)weChatQRCode{
    if (_weChatQRCode == nil) {
        _weChatQRCode = [[UIImageView alloc]init];
        _weChatQRCode.image = [UIImage imageNamed:@"erweima"];
    }return _weChatQRCode;
}
- (UIButton *)agreeButton{
    if (_agreeButton == nil) {
        _agreeButton = [[UIButton alloc]init];
        _agreeButton.layer.cornerRadius = 3;
        _agreeButton.backgroundColor = RGBColorHex(0x224eaf);
        _agreeButton.titleLabel.font = [UIFont systemFontOfSize:20];
        [_agreeButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_agreeButton setTitle:@"确认" forState:UIControlStateNormal];
        [_agreeButton addTarget:self action:@selector(agreeButtonClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _agreeButton;
}


- (void)viewWillDisappear:(BOOL)animated{
    self.navigationController.navigationBar.hidden = YES;
}

- (void)agreeButtonClick
{
    NSString* number = _cardNumberTF.text;
    NSString* username = _userNameTF.text;
    NSString* bankname = _bankNameTF.text;
    
    if (kStringIsEmpty(number))
    {
        [SVProgressHUD showInfoWithStatus:@"请输入银行卡号"];
    }
    
    if (kStringIsEmpty(username))
    {
        [SVProgressHUD showInfoWithStatus:@"请输入开户人禾姓名"];
    }
    
    if (kStringIsEmpty(bankname))
    {
        [SVProgressHUD showInfoWithStatus:@"请输入开户行名称"];
    }
    
    ZWeakSelf
    [http_mine pay_submit:nil url:nil zfbfile:nil wxfile:nil bankid:number bankname:username bank:bankname success:^(id responseObject)
     {
         [weakSelf showData:responseObject];
     } failure:^(NSError *error) {
         [SVProgressHUD showErrorWithStatus:error.domain];
     }];
}

-(void)showData:(id)responseObject
{
    [SVProgressHUD showSuccessWithStatus:@"提交成功"];
}

@end
