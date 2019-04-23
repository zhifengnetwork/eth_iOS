//
//  ETHComplaintDetailVC.m
//  ETH
//
//  Created by weiming zhang on 2019/4/22.
//  Copyright © 2019 admin. All rights reserved.
//

#import "ETHComplaintDetailVC.h"
#import "ETHComplaintTF.h"
#import "http_c2c.h"
#import "http_user.h"
#import "SVProgressHUD.h"
#import "MJExtension.h"
#import "TZImagePickerController.h"
#import "UIImageView+WebCache.h"

@interface ETHComplaintDetailVC ()
@property (nonatomic, strong)UILabel *titleLabel;
@property (nonatomic, strong)ETHComplaintTF *titleTF;
@property (nonatomic, strong)UILabel *contentLabel;
@property (nonatomic, strong)UITextView *contentTextView;
@property (nonatomic, strong)UIImageView *QRCodeImageView;
@property (nonatomic, strong)UIButton *selectImagebButton;
@property (nonatomic, strong)UIButton *confirmButton;
@property (nonatomic, strong)UILabel *emptyImageLabel;

@property (nonatomic, strong)NSString *file;
@end

@implementation ETHComplaintDetailVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor],NSFontAttributeName:[UIFont boldSystemFontOfSize:22]}];
    self.title = @"申诉";
    [self setup];
}

- (void)setup{
    self.view.backgroundColor = RGBColorHex(0x36394a);
    [self.view addSubview:self.titleLabel];
    [self.view addSubview:self.titleTF];
    [self.view addSubview:self.contentLabel];
    [self.view addSubview:self.contentTextView];
    [self.view addSubview:self.QRCodeImageView];
    [self.view addSubview:self.selectImagebButton];
    [self.view addSubview:self.confirmButton];
    
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).with.offset(16);
        make.top.equalTo(self.view).with.offset(20);
    }];
    
    [_titleTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.titleLabel.mas_right).with.offset(17);
        make.top.equalTo(self.view).with.offset(15);
        make.height.mas_equalTo(29);
        make.width.mas_equalTo(220);
    }];
    
    [_contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).with.offset(16);
        make.top.equalTo(self.titleLabel.mas_bottom).with.offset(25);
    }];
    [_contentTextView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentLabel.mas_right).with.offset(17);
        make.top.equalTo(self.titleTF.mas_bottom).with.offset(15);
        make.height.mas_equalTo(80);
        make.width.mas_equalTo(220);
    }];
    
    [_QRCodeImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).with.offset(16);
        make.right.equalTo(self.view).with.offset(-16);
        make.top.equalTo(self.contentTextView.mas_bottom).with.offset(15);
        make.height.mas_equalTo(95);
    }];
    
    [_selectImagebButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.QRCodeImageView.mas_bottom).with.offset(10);
        make.centerX.equalTo(self.view.mas_centerX);
        make.width.mas_equalTo(110);
        make.height.mas_equalTo(25);
    }];
    
    [_confirmButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.selectImagebButton.mas_bottom).with.offset(50);
        make.centerX.equalTo(self.view.mas_centerX);
        make.width.mas_equalTo(140);
        make.height.mas_equalTo(37);
    }];
}

- (UILabel *)titleLabel{
    if (_titleLabel == nil) {
        _titleLabel = [[UILabel alloc]init];
        _titleLabel.font = [UIFont boldSystemFontOfSize:15];
        _titleLabel.textColor = [UIColor whiteColor];
        _titleLabel.text = @"申诉标题：";
    }return _titleLabel;
}

- (UITextField *)titleTF{
    if (_titleTF == nil) {
        _titleTF = [[ETHComplaintTF alloc]init];
        _titleTF.layer.cornerRadius = 3;
        _titleTF.backgroundColor = RGBColorHex(0x4b4f66);
        _titleTF.font = [UIFont systemFontOfSize:12];
        _titleTF.textColor = RGBColorHex(0xcccccc);
        _titleTF.placeholder = @"请输入标题";
        [_titleTF setValue:RGBColorHex(0xcccccc) forKeyPath:@"_placeholderLabel.textColor"];
        [_titleTF setValue:[UIFont systemFontOfSize:12] forKeyPath:@"_placeholderLabel.font"];
    }return _titleTF;
}

- (UILabel *)contentLabel{
    if (_contentLabel == nil) {
        _contentLabel = [[UILabel alloc]init];
        _contentLabel.font = [UIFont boldSystemFontOfSize:15];
        _contentLabel.textColor = [UIColor whiteColor];
        _contentLabel.text = @"申诉内容：";
    }return _contentLabel;
}

- (UITextView *)contentTextView{
    if (_contentTextView == nil) {
        _contentTextView = [[UITextView alloc]init];
        _contentTextView.layer.cornerRadius = 3;
        _contentTextView.backgroundColor = RGBColorHex(0x4b4f66);
        _contentTextView.font = [UIFont systemFontOfSize:12];
        _contentTextView.textColor = RGBColorHex(0xcccccc);
        _contentTextView.text = @"  请输入内容";
    }return _contentTextView;
}

- (UIImageView *)QRCodeImageView{
    if (_QRCodeImageView == nil) {
        _QRCodeImageView = [[UIImageView alloc]init];
        _QRCodeImageView.layer.borderWidth = 1;
        _QRCodeImageView.layer.borderColor = RGBColorHex(0x6c91fa).CGColor;
        if (_QRCodeImageView.image == nil) {
            _emptyImageLabel = [[UILabel alloc]init];
            _emptyImageLabel.font = [UIFont systemFontOfSize:12];
            _emptyImageLabel.textColor = RGBColorHex(0x737893);
            _emptyImageLabel.text = @"请点击“选择图片”上传二维码";
            [self.QRCodeImageView addSubview:self.emptyImageLabel];
            [_emptyImageLabel mas_makeConstraints:^(MASConstraintMaker *make) {
                make.centerX.equalTo(self.QRCodeImageView.mas_centerX);
                make.centerY.equalTo(self.QRCodeImageView.mas_centerY);
            }];
        }
    }
    return _QRCodeImageView;
}

- (UIButton *)selectImagebButton{
    if (_selectImagebButton == nil) {
        _selectImagebButton = [[UIButton alloc]init];
        _selectImagebButton.layer.cornerRadius = 3;
        _selectImagebButton.backgroundColor = RGBColorHex(0x4b4f66);
        _selectImagebButton.titleLabel.font = [UIFont systemFontOfSize:13];
        [_selectImagebButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_selectImagebButton setTitle:@"选择图片" forState:UIControlStateNormal];
        [_selectImagebButton addTarget:self action:@selector(selectImage) forControlEvents:UIControlEventTouchUpInside];
    }return _selectImagebButton;
}

- (UIButton *)confirmButton{
    if (_confirmButton == nil) {
        _confirmButton = [[UIButton alloc]init];
        _confirmButton.layer.cornerRadius = 3;
        _confirmButton.backgroundColor = RGBColorHex(0x5ec05e);
        _confirmButton.titleLabel.font = [UIFont systemFontOfSize:16];
        [_confirmButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_confirmButton setTitle:@"确定" forState:UIControlStateNormal];
        [_confirmButton addTarget:self action:@selector(confirmClick) forControlEvents:UIControlEventTouchUpInside];
    }return _confirmButton;
}


#pragma mark -- 方法
- (void)selectImage{
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
    
    _file = [responseObject objectForKey:@"img"];
    [SVProgressHUD showSuccessWithStatus:@"上传成功"];
    
    [_QRCodeImageView sd_setImageWithURL:[NSURL URLWithString:_file]];
}

//添加申诉接口方法
- (void)confirmClick{

    //files 图片文件
    [http_c2c guamai_appeal_add:_VCID files:_file text:_titleTF.text textarea:_contentTextView.text success:^(id responseObject){
        [SVProgressHUD showSuccessWithStatus:@"提交申诉成功"];
    }failure:^(NSError *error) {
        [SVProgressHUD showErrorWithStatus:error.domain];
    }];
}
@end
