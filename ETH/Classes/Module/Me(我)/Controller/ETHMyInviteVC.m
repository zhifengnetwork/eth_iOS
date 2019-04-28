//
//  ETHMyInviteVC.m
//  ETH
//
//  Created by weiming zhang on 2019/4/27.
//  Copyright © 2019 admin. All rights reserved.
//

#import "ETHMyInviteVC.h"
#import "http_mine.h"
#import "SVProgressHUD.h"
#import "ETHC2CModel.h"
#import "MJExtension.h"
#import "UIImageView+WebCache.h"

@interface ETHMyInviteVC ()
@property (nonatomic, strong)UIImageView *backImg;
//@property (nonatomic, strong)UIImageView *titleImageView;
//@property (nonatomic, strong)UILabel *nameLabel;
//@property (nonatomic, strong)UILabel *titleLabel;
//@property (nonatomic, strong)UIImageView *midImageView;
//@property (nonatomic, strong)UIImageView *QRImageView;
//@property (nonatomic, strong)UILabel *label1;

@end

@implementation ETHMyInviteVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"我的邀请";
     _backImg = [[UIImageView alloc]init];
    [self.view addSubview:self.backImg];
   
    
    [_backImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.left.right.equalTo(self.view);
    }];
    [self setup];
}

- (void)setup{
//    UIView * view1 = [[UIView alloc]init];
//    view1.layer.cornerRadius = 3;
//    view1.backgroundColor = RGBColorHex(0x224eaf);
//    [self.view addSubview:view1];
//    [self.view addSubview:self.titleImageView];
//    [self.titleImageView addSubview:self.nameLabel];
//    [self.titleImageView addSubview:self.titleLabel];
//    [self.view addSubview:self.midImageView];
//    [self.view addSubview:self.QRImageView];
//    [self.view addSubview:self.label1];
//
//    [view1 mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(self.view).with.offset(15);
//        make.left.equalTo(self.view).with.offset(10);
//        make.width.height.mas_equalTo(40);
//    }];
//
//    [_titleImageView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(self.view).with.offset(15);
//        make.left.equalTo(view1.mas_right).with.offset(7);
//        make.right.equalTo(self.view).with.offset(-10);
//        make.height.mas_equalTo(40);
//    }];
//
//    [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(self.titleImageView).with.offset(7.5);
//        make.left.equalTo(self.titleImageView).with.offset(11.5);
//    }];
//
//    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.equalTo(self.titleImageView).with.offset(11.5);
//        make.bottom.equalTo(self.titleImageView).with.offset(-5);
//    }];
//
//    [_midImageView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.equalTo(self.view).with.offset(10);
//        make.right.equalTo(self.view).with.offset(-10);
//        make.top.equalTo(self.titleImageView.mas_bottom).with.offset(35);
//        make.height.mas_equalTo(197);
//    }];
//
//    [_QRImageView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(self.midImageView.mas_bottom).with.offset(20);
//        make.centerX.equalTo(self.view.mas_centerX);
//        make.width.height.mas_equalTo(135);
//    }];
//
//    [_label1 mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(self.QRImageView.mas_bottom).with.offset(57.5);
//        make.centerX.equalTo(self.view.mas_centerX);
//    }];
//
    ZWeakSelf
    [http_mine qrcode:^(id responseObject)
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
    ETHC2CModel *model = [ETHC2CModel mj_objectWithKeyValues:responseObject];

    [_backImg sd_setImageWithURL:[NSURL URLWithString:model.img]];

}
//
//
//- (UIImageView *)titleImageView{
//    if (_titleImageView == nil) {
//        _titleImageView = [[UIImageView alloc]init];
//        _titleImageView.image = [UIImage imageNamed:@"liaotiankuang"];
//    }return _titleImageView;
//}
//
//- (UILabel *)nameLabel{
//    if (_nameLabel == nil) {
//        _nameLabel = [[UILabel alloc]init];
//        _nameLabel.font = [UIFont systemFontOfSize:10];
//        _nameLabel.textColor = RGBColorHex(0xff7e30);
//        _nameLabel.text = @"我是9527";
//    }return _nameLabel;
//}
//
//- (UILabel *)titleLabel{
//    if (_titleLabel == nil) {
//        _titleLabel = [[UILabel alloc]init];
//        _titleLabel.font = [UIFont systemFontOfSize:10];
//        NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:@"我要为  ETH娱乐生态  代言"];
//        [str addAttribute:NSForegroundColorAttributeName value:RGBColorHex(0x333333) range:NSMakeRange(0,4)]; //设置字体颜色
//        [str addAttribute:NSForegroundColorAttributeName value:RGBColorHex(0xff670b) range:NSMakeRange(5,8)];
//        [str addAttribute:NSForegroundColorAttributeName value:RGBColorHex(0x333333) range:NSMakeRange(14,2)];
//        _titleLabel.attributedText = str;
//    }return _titleLabel;
//}
//
//- (UIImageView *)midImageView{
//    if (_midImageView == nil) {
//        _midImageView = [[UIImageView alloc]init];
//        _midImageView.image = [UIImage imageNamed:@"banner"];
//    }return _midImageView;
//}
//
//- (UIImageView *)QRImageView{
//    if (_QRImageView == nil) {
//        _QRImageView = [[UIImageView alloc]init];
//        _QRImageView.image = [UIImage imageNamed:@"yaoqingma"];
//    }return _QRImageView;
//}
//
//- (UILabel *)label1{
//    if (_label1 == nil) {
//        _label1 = [[UILabel alloc]init];
//        _label1.font = [UIFont systemFontOfSize:15];
//        _label1.textColor = RGBColorHex(0xf0254f);
//        _label1.text = @"关注我们  加入有礼品  购买有惊喜";
//    }return _label1;
//}
@end
