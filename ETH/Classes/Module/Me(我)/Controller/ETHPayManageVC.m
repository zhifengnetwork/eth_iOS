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
#import "http_user.h"
#import "UIImageView+WebCache.h"
#import "RefreshGifHeader.h"
#import "TZImagePickerController.h"


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

@property (nonatomic, copy)NSString *alipayUrl;
@property (nonatomic, copy)NSString *wexinUrl;
@end

@implementation ETHPayManageVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"支付管理";
    self.view.backgroundColor = [UIColor whiteColor];
    [self setup];
    [self loadData];
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
    UIView *lineView = [[UIView alloc]init];
    lineView.backgroundColor = RGBColorHex(0xcccccc);
    [self.view addSubview:lineView];
    UIView *lineView1 = [[UIView alloc]init];
    lineView1.backgroundColor = RGBColorHex(0xcccccc);
    [self.view addSubview:lineView1];
    UIView *lineView2 = [[UIView alloc]init];
    lineView2.backgroundColor = RGBColorHex(0xcccccc);
    [self.view addSubview:lineView2];
    
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
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.cardNumberTF.mas_bottom);
        make.left.equalTo(self.cardNumberTF.mas_left);
        make.right.equalTo(self.view).with.offset(-10);
        make.height.mas_equalTo(1);
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
    [lineView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.userNameTF.mas_bottom);
        make.left.equalTo(self.userNameTF.mas_left);
        make.right.equalTo(self.view).with.offset(-10);
        make.height.mas_equalTo(1);
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
    [lineView2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.bankNameTF.mas_bottom);
        make.left.equalTo(self.bankNameTF.mas_left);
        make.right.equalTo(self.view).with.offset(-10);
        make.height.mas_equalTo(1);
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
        _view1.backgroundColor = [UIColor whiteColor];
    }return _view1;
}
- (UILabel *)cardNumberLabel{
    if (_cardNumberLabel == nil) {
        _cardNumberLabel = [[UILabel alloc]init];
        _cardNumberLabel.font = [UIFont systemFontOfSize:12];
        _cardNumberLabel.textColor = [UIColor blackColor];
        _cardNumberLabel.text = @"银行卡卡号：";
    }return _cardNumberLabel;
}
- (UITextField *)cardNumberTF{
    if (_cardNumberTF == nil) {
        _cardNumberTF = [[UITextField alloc]init];
        _cardNumberTF.font = [UIFont systemFontOfSize:12];
        _cardNumberTF.textColor = [UIColor blackColor];
    }return _cardNumberTF;
}
- (UIView *)view2{
    if (_view2 == nil) {
        _view2 = [[UIView alloc]init];
        _view2.layer.cornerRadius = 3;
        _view2.backgroundColor = [UIColor whiteColor];
    }return _view2;
}
- (UILabel *)userNameLabel{
    if (_userNameLabel == nil) {
        _userNameLabel = [[UILabel alloc]init];
        _userNameLabel.font = [UIFont systemFontOfSize:12];
        _userNameLabel.textColor = [UIColor blackColor];
        _userNameLabel.text = @"开户人：";
    }return _userNameLabel;
}
- (UITextField *)userNameTF{
    if (_userNameTF == nil) {
        _userNameTF = [[UITextField alloc]init];
        _userNameTF.font = [UIFont systemFontOfSize:12];
        _userNameTF.textColor = [UIColor blackColor];
    }return _userNameTF;
}
- (UIView *)view3{
    if (_view3 == nil) {
        _view3 = [[UIView alloc]init];
        _view3.layer.cornerRadius = 3;
        _view3.backgroundColor = [UIColor whiteColor];
    }return _view3;
}
- (UILabel *)bankNameLabel{
    if (_bankNameLabel ==nil) {
        _bankNameLabel = [[UILabel alloc]init];
        _bankNameLabel.font = [UIFont systemFontOfSize:12];
        _bankNameLabel.textColor = [UIColor blackColor];
        _bankNameLabel.text = @"开户行：";
    }return _bankNameLabel;
}
- (UITextField *)bankNameTF{
    if (_bankNameTF == nil) {
        _bankNameTF = [[UITextField alloc]init];
        _bankNameTF.font = [UIFont systemFontOfSize:12];
        _bankNameTF.textColor = [UIColor blackColor];
    }return _bankNameTF;
}
- (UIView *)view4{
    if (_view4 == nil) {
        _view4 = [[UIView alloc]init];
        _view4.layer.cornerRadius = 5;
        _view4.backgroundColor = [UIColor whiteColor];
    }return _view4;
}
- (UILabel *)alipayLabel{
    if (_alipayLabel == nil) {
        _alipayLabel = [[UILabel alloc]init];
        _alipayLabel.font = [UIFont systemFontOfSize:12];
        _alipayLabel.textColor = [UIColor blackColor];
        _alipayLabel.text = @"支付宝收款二维码";
    }return _alipayLabel;
}
- (UIImageView *)alipayQRCode{
    if (_alipayQRCode == nil) {
        _alipayQRCode = [[UIImageView alloc]init];
        _alipayQRCode.image = [UIImage imageNamed:@"erweima"];
        _alipayQRCode.userInteractionEnabled = YES;
        UITapGestureRecognizer* singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleSingleTap:)];
        [_alipayQRCode addGestureRecognizer:singleTap];
    }return _alipayQRCode;
}
- (UIView *)view5{
    if (_view5 == nil) {
        _view5 = [[UIView alloc]init];
        _view5.layer.cornerRadius = 5;
        _view5.backgroundColor = [UIColor whiteColor];
    }return _view5;
}
- (UILabel *)weChatLabel{
    if (_weChatLabel == nil) {
        _weChatLabel = [[UILabel alloc]init];
        _weChatLabel.font = [UIFont systemFontOfSize:12];
        _weChatLabel.textColor = [UIColor blackColor];
        _weChatLabel.text = @"微信收款二维码";
    }return _weChatLabel;
}
- (UIImageView *)weChatQRCode{
    if (_weChatQRCode == nil) {
        _weChatQRCode = [[UIImageView alloc]init];
        _weChatQRCode.image = [UIImage imageNamed:@"erweima"];
        _weChatQRCode.userInteractionEnabled = YES;
        UITapGestureRecognizer* singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleSingleTap1:)];
        [_weChatQRCode addGestureRecognizer:singleTap];
    }return _weChatQRCode;
}
- (UIButton *)agreeButton{
    if (_agreeButton == nil) {
        _agreeButton = [[UIButton alloc]init];
        _agreeButton.layer.cornerRadius = 3;
        _agreeButton.backgroundColor = RGBColorHex(0xcccccc);
        _agreeButton.titleLabel.font = [UIFont systemFontOfSize:20];
        [_agreeButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_agreeButton setTitle:@"确认" forState:UIControlStateNormal];
        [_agreeButton addTarget:self action:@selector(agreeButtonClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _agreeButton;
}


#pragma mark --方法

- (void)handleSingleTap:(UITouch *)touch
{
    TZImagePickerController *imagePickerVc = [[TZImagePickerController alloc] initWithMaxImagesCount:1 delegate:self];
    
    // You can get the photos by block, the same as by delegate.
    // 你可以通过block或者代理，来得到用户选择的照片.
    ZWeakSelf
    [imagePickerVc setDidFinishPickingPhotosHandle:^(NSArray<UIImage *> *photos, NSArray *assets, BOOL isSelectOriginalPhoto)
     {
         [weakSelf uploadImage:[photos firstObject]];
     }];
    [self presentViewController:imagePickerVc animated:YES completion:nil];
}

-(void)uploadImage:(UIImage*)image
{
    NSData *imageData = UIImageJPEGRepresentation(image, 1.0f);
    //NSDataBase64EncodingEndLineWithLineFeed这个枚举值是base64串不换行
    NSString *imageBase64Str = [imageData base64EncodedStringWithOptions:NSDataBase64EncodingEndLineWithLineFeed];
    //    //不转base64
    //    NSString * str =[[NSString alloc] initWithData:imageData encoding:NSUTF8StringEncoding];
    
    ZWeakSelf
    [http_user uploader:imageBase64Str success:^(id responseObject)
     {
         [weakSelf uploadImage_ok:responseObject];
     } failure:^(NSError *error)
     {
         [SVProgressHUD showErrorWithStatus:error.domain];
     }];
}

-(void)uploadImage_ok:(id)responseObject
{
    if (kObjectIsEmpty(responseObject))
    {
        return;
    }
    
    self.alipayUrl = [responseObject objectForKey:@"img"];
    [SVProgressHUD showSuccessWithStatus:@"上传成功"];
    [_alipayQRCode sd_setImageWithURL:[NSURL URLWithString:self.alipayUrl]];
}
//微信二维码
- (void)handleSingleTap1:(UITouch *)touch
{
    TZImagePickerController *imagePickerVc = [[TZImagePickerController alloc] initWithMaxImagesCount:1 delegate:self];
    
    // You can get the photos by block, the same as by delegate.
    // 你可以通过block或者代理，来得到用户选择的照片.
    ZWeakSelf
    [imagePickerVc setDidFinishPickingPhotosHandle:^(NSArray<UIImage *> *photos, NSArray *assets, BOOL isSelectOriginalPhoto)
     {
         [weakSelf uploadImage1:[photos firstObject]];
     }];
    [self presentViewController:imagePickerVc animated:YES completion:nil];
}

-(void)uploadImage1:(UIImage*)image
{
    NSData *imageData = UIImageJPEGRepresentation(image, 1.0f);
    //NSDataBase64EncodingEndLineWithLineFeed这个枚举值是base64串不换行
    NSString *imageBase64Str = [imageData base64EncodedStringWithOptions:NSDataBase64EncodingEndLineWithLineFeed];
    //    //不转base64
    //    NSString * str =[[NSString alloc] initWithData:imageData encoding:NSUTF8StringEncoding];
    
    ZWeakSelf
    [http_user uploader:imageBase64Str success:^(id responseObject)
     {
         [weakSelf uploadImage_ok1:responseObject];
     } failure:^(NSError *error)
     {
         [SVProgressHUD showErrorWithStatus:error.domain];
     }];
}

-(void)uploadImage_ok1:(id)responseObject
{
    if (kObjectIsEmpty(responseObject))
    {
        return;
    }
    
    self.wexinUrl = [responseObject objectForKey:@"img"];
    [SVProgressHUD showSuccessWithStatus:@"上传成功"];
    [_weChatQRCode sd_setImageWithURL:[NSURL URLWithString:self.wexinUrl]];
}


- (void)agreeButtonClick
{
    NSString* number = _cardNumberTF.text;
    NSString* username = _userNameTF.text;
    NSString* bankname = _bankNameTF.text;
    
    if (kStringIsEmpty(number))
    {
        [SVProgressHUD showInfoWithStatus:@"请输入银行卡号"];
        return;
    }
    
    if (kStringIsEmpty(username))
    {
        [SVProgressHUD showInfoWithStatus:@"请输入开户人姓名"];
        return;
    }
    
    if (kStringIsEmpty(bankname))
    {
        [SVProgressHUD showInfoWithStatus:@"请输入开户行名称"];
        return;
    }
    
//    if ([number isEqualToString:self.userInfo.bankid]
//        && [username isEqualToString:self.userInfo.bankname]
//        && [bankname isEqualToString:self.userInfo.bank])
//    {
////        [SVProgressHUD showSuccessWithStatus:@"成功"];
//    }
    
    ZWeakSelf
    [http_mine pay_submit:nil url:nil zfbfile:self.alipayUrl wxfile:self.wexinUrl bankid:number bankname:username bank:bankname success:^(id responseObject)
     {
         [weakSelf sdData:responseObject];
     } failure:^(NSError *error) {
         [SVProgressHUD showErrorWithStatus:error.domain];
     }];
}

-(void)sdData:(id)responseObject
{
    [SVProgressHUD showSuccessWithStatus:@"提交成功"];
    [self.navigationController popToRootViewControllerAnimated:YES];
}

-(void)loadData
{
    ZWeakSelf
    [http_mine pay_management:^(id responseObject)
     {
         [weakSelf showData:responseObject];
     } failure:^(NSError *error) {
         [SVProgressHUD showErrorWithStatus:error.domain];
     }];
}

-(void)showData:(id)responseObject
{
    if (responseObject==nil)
    {
        return;
    }
    
    self.userInfo = [UserInfoModel mj_objectWithKeyValues:responseObject];
    
    _cardNumberTF.text = self.userInfo.bankid;
    _userNameTF.text = self.userInfo.bankname;
    _bankNameTF.text = self.userInfo.bank;
    if (!kStringIsEmpty(self.userInfo.zfbfile)) {
        [_alipayQRCode sd_setImageWithURL:[NSURL URLWithString:self.userInfo.zfbfile]];
    }
    if (!kStringIsEmpty(self.userInfo.wxfile)) {
        [_weChatQRCode sd_setImageWithURL:[NSURL URLWithString:self.userInfo.wxfile]];
    }
    
    
}

@end
