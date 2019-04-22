//
//  ETHMyWalletVC.m
//  ETH
//
//  Created by weiming zhang on 2019/4/11.
//  Copyright © 2019 admin. All rights reserved.
//

#import "ETHMyWalletVC.h"
#import "http_mine.h"
#import "SVProgressHUD.h"
#import "MJExtension.h"
#import "RefreshGifHeader.h"
#import "TZImagePickerController.h"
#import "http_user.h"
#import "UIImageView+WebCache.h"


@interface ETHMyWalletVC ()
@property (nonatomic, strong)UIView *view1;
@property (nonatomic, strong)UILabel *walletAddressLabel;
@property (nonatomic, strong)UITextField *walletAddressTF;
@property (nonatomic, strong)UIView *view2;
@property (nonatomic, strong)UILabel *walletLabel;
@property (nonatomic, strong)UIImageView *walletQRCode;
@property (nonatomic, strong)UIButton *ensureButton;

@property (nonatomic, strong)NSString *url;
@end

@implementation ETHMyWalletVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"钱包地址";
    [self setup];
    [self loadData];
}
- (void)setup{
    [self.view addSubview:self.view1];
    [self.view1 addSubview:self.walletAddressLabel];
    [self.view1 addSubview:self.walletAddressTF];
    [self.view addSubview:self.view2];
    [self.view2 addSubview:self.walletLabel];
    [self.view2 addSubview:self.walletQRCode];
    [self.view addSubview:self.ensureButton];
    [_view1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).with.offset(9);
        make.right.equalTo(self.view).with.offset(-9);
        make.top.equalTo(self.view).with.offset(10);
        make.height.mas_equalTo(25);
    }];
    [_walletAddressLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view1).with.offset(16);
        make.centerY.equalTo(self.view1.mas_centerY);
    }];
    [_walletAddressTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.walletAddressLabel.mas_right).with.offset(5);
        make.top.bottom.equalTo(self.view1);
        make.width.mas_equalTo(300);
    }];
    [_view2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view1.mas_bottom).with.offset(25);
        make.centerX.equalTo(self.view.mas_centerX);
        make.width.mas_equalTo(172.5);
        make.height.mas_equalTo(175);
    }];
    [_walletLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view2).with.offset(10);
        make.centerX.equalTo(self.view2.mas_centerX);
    }];
    [_walletQRCode mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.walletLabel.mas_bottom).with.offset(16);
        make.centerX.equalTo(self.view2.mas_centerX);
        make.width.height.mas_equalTo(130);
    }];
    [_ensureButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view2.mas_bottom).with.offset(100);
        make.left.equalTo(self.view).with.offset(9);
        make.right.equalTo(self.view).with.offset(-9);
        make.height.mas_equalTo(35);
    }];
}
- (UIView *)view1{
    if (_view1 == nil) {
        _view1 = [[UIView alloc]init];
        _view1.layer.cornerRadius = 3;
        _view1.backgroundColor = RGBColorHex(0x224eaf);
    }return _view1;
}
- (UILabel *)walletAddressLabel{
    if (_walletAddressLabel == nil) {
        _walletAddressLabel = [[UILabel alloc]init];
        _walletAddressLabel.font = [UIFont systemFontOfSize:12];
        _walletAddressLabel.textColor = [UIColor whiteColor];
        _walletAddressLabel.text = @"钱包地址：";
    }return _walletAddressLabel;
}
- (UITextField *)walletAddressTF{
    if (_walletAddressTF == nil) {
        _walletAddressTF = [[UITextField alloc]init];
        _walletAddressTF.font = [UIFont systemFontOfSize:12];
        _walletAddressTF.textColor = [UIColor whiteColor];
    }return _walletAddressTF;
}
- (UIView *)view2{
    if (_view2 == nil) {
        _view2 = [[UIView alloc]init];
        _view2.layer.cornerRadius = 5;
        _view2.backgroundColor = RGBColorHex(0x224eaf);
    }return _view2;
}
- (UILabel *)walletLabel{
    if (_walletLabel == nil) {
        _walletLabel = [[UILabel alloc]init];
        _walletLabel.font = [UIFont systemFontOfSize:12];
        _walletLabel.textColor = [UIColor whiteColor];
        _walletLabel.text = @"钱包二维码";
    }return _walletLabel;
}
- (UIImageView *)walletQRCode{
    if (_walletQRCode == nil) {
        _walletQRCode = [[UIImageView alloc]init];
        _walletQRCode.image = [UIImage imageNamed:@"erweima"];
        _walletQRCode.userInteractionEnabled = YES;
        UITapGestureRecognizer* singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleSingleTap:)];
        [_walletQRCode addGestureRecognizer:singleTap];
    }return _walletQRCode;
}
- (UIButton *)ensureButton{
    if (_ensureButton == nil) {
        _ensureButton = [[UIButton alloc]init];
        _ensureButton.layer.cornerRadius = 3;
        _ensureButton.backgroundColor = RGBColorHex(0x224eaf);
        _ensureButton.titleLabel.font = [UIFont systemFontOfSize:20];
        [_ensureButton setTitle:@"确认" forState:UIControlStateNormal];
        [_ensureButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_ensureButton addTarget:self action:@selector(ensureButtonClick) forControlEvents:UIControlEventTouchUpInside];
    }return _ensureButton;
}

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
    
    self.url = [responseObject objectForKey:@"img"];
    [SVProgressHUD showSuccessWithStatus:@"上传成功"];
    [_walletQRCode sd_setImageWithURL:[NSURL URLWithString:self.url]];
}

- (void)ensureButtonClick
{
    NSString* address = _walletAddressTF.text;
    
    if (kStringIsEmpty(address))
    {
        [SVProgressHUD showInfoWithStatus:@"请输入钱包地址"];
        return;
    }
    
    ZWeakSelf
     [http_mine pay_submit:address url:self.url zfbfile:nil wxfile:nil bankid:nil bankname:nil bank:nil success:^(id responseObject)
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
    
    _walletAddressTF.text = self.userInfo.bankid;
    if (self.userInfo.walletcode)
    {
        [_walletQRCode sd_setImageWithURL:[NSURL URLWithString:self.userInfo.walletcode]];
    }
}



@end
