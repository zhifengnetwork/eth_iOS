//
//  ETHDetailComplaintVC.m
//  ETH
//
//  Created by weiming zhang on 2019/4/18.
//  Copyright © 2019 admin. All rights reserved.
//

#import "ETHDetailComplaintVC.h"
#import "ETHTitleView.h"
#import "ETHBigImageView.h"
#import "UIImageView+WebCache.h"

@interface ETHDetailComplaintVC ()
@property (nonatomic, strong)UIView *titleView;
@property (nonatomic, strong)UIImageView *backImg;
@property (nonatomic, strong)UILabel *titleLabel;
@property (nonatomic, strong)UIButton *leftButton;

@property (nonatomic, strong)UIView *view1;
@property (nonatomic, strong)UILabel *problem;
@property (nonatomic, strong)UILabel *problemLabel;
@property (nonatomic, strong)UILabel *reason;
@property (nonatomic, strong)UILabel *reasonLabel;
@property (nonatomic, strong)UIView *view2;
@property (nonatomic, strong)UILabel *order;
@property (nonatomic, strong)UILabel *orderLabel;
@property (nonatomic, strong)UILabel *complainant;//申诉人
@property (nonatomic, strong)UILabel *complainantLabel;
@property (nonatomic, strong)UILabel *respondent;//被申诉人
@property (nonatomic, strong)UILabel *respondentLabel;
@property (nonatomic, strong)UILabel *ethAcount;
@property (nonatomic, strong)UILabel *ethAcountLabel;
@property (nonatomic, strong)UILabel *cnyAcount;
@property (nonatomic, strong)UILabel *cnyAcountLabel;
@property (nonatomic, strong)UILabel *status;
@property (nonatomic, strong)UILabel *statusLabel;
@property (nonatomic, strong)UILabel *paymentLabel;
@property (nonatomic, strong)ETHBigImageView *imageView;
@property (nonatomic, strong)UILabel *emptyLabel;
@end

@implementation ETHDetailComplaintVC
- (void)viewDidLoad{
    
    [self setup];
}
- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        [self setup];
    }
    return self;
}
- (void)setup{
    self.view.backgroundColor = RGBColorHex(0x36384b);
    [self.view addSubview:self.titleView];
    [self.titleView addSubview:self.backImg];
    [self.titleView addSubview:self.titleLabel];
    [self.titleView addSubview:self.leftButton];
    
    [_titleView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.equalTo(self.view);
        make.height.mas_equalTo(64);
    }];
    [_backImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.bottom.equalTo(self.titleView);
    }];
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.titleView.mas_centerX);
        make.top.equalTo(self.titleView).with.offset(28);
    }];
    [_leftButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.titleView).with.offset(16);
        make.centerY.equalTo(self.titleLabel.mas_centerY);
    }];
    
    [self.view addSubview:self.view1];
    [self.view1 addSubview:self.problem];
    [self.view1 addSubview:self.problemLabel];
    [self.view1 addSubview:self.reason];
    [self.view1 addSubview:self.reasonLabel];
    [self.view addSubview:self.view2];
    [self.view2 addSubview:self.order];
    [self.view2 addSubview:self.orderLabel];
    [self.view2 addSubview:self.complainant];
    [self.view2 addSubview:self.complainantLabel];
    [self.view2 addSubview:self.respondent];
    [self.view2 addSubview:self.respondentLabel];
    
    [self.view addSubview:self.ethAcount];
    [self.view addSubview:self.ethAcountLabel];
    [self.view addSubview:self.cnyAcount];
    [self.view addSubview:self.cnyAcountLabel];
    [self.view addSubview:self.status];
    [self.view addSubview:self.statusLabel];
    [self.view addSubview:self.paymentLabel];
    [self.view addSubview:self.imageView];
    [self.imageView addSubview:self.emptyLabel];
    
    [_view1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleView.mas_bottom).with.offset(15);
        make.left.equalTo(self.view).with.offset(16);
        make.right.equalTo(self.view).with.offset(-16);
        make.height.mas_equalTo(64);
    }];
    
    [_problem mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view1).with.offset(15);
        make.left.equalTo(self.view1).with.offset(16);
    }];
    
    [_problemLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.problem.mas_right).with.offset(17);
        make.centerY.equalTo(self.problem.mas_centerY);
    }];
    
    [_reason mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.problem.mas_bottom).with.offset(6);
        make.left.equalTo(self.view1).with.offset(16);
    }];
    
    [_reasonLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.problem.mas_right).with.offset(17);
        make.centerY.equalTo(self.reason.mas_centerY);
    }];
    
    [_view2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view1.mas_bottom).with.offset(15);
        make.left.equalTo(self.view).with.offset(16);
        make.right.equalTo(self.view).with.offset(-16);
        make.height.mas_equalTo(94);
    }];
    
    [_order mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view2).with.offset(15);
        make.left.equalTo(self.view2).with.offset(16);
    }];
    
    [_orderLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.order.mas_right).with.offset(17);
        make.centerY.equalTo(self.order.mas_centerY);
    }];
    
    [_complainant mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.order.mas_bottom).with.offset(6);
        make.left.equalTo(self.view1).with.offset(16);
    }];
    
    [_complainantLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.orderLabel.mas_left);
        make.centerY.equalTo(self.complainant.mas_centerY);
    }];
    
    [_respondent mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.complainant.mas_bottom).with.offset(6);
        make.left.equalTo(self.view1).with.offset(16);
    }];
    
    [_respondentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.respondent.mas_right).with.offset(17);
        make.centerY.equalTo(self.respondent.mas_centerY);
    }];
    
    [_ethAcount mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view2.mas_bottom).with.offset(15);
        make.left.equalTo(self.view).with.offset(32);
    }];
    
    [_ethAcountLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.ethAcount.mas_right).with.offset(17);
        make.centerY.equalTo(self.ethAcount.mas_centerY);
    }];
    
    [_cnyAcount mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.ethAcount.mas_bottom).with.offset(15);
        make.left.equalTo(self.view).with.offset(32);
    }];
    
    [_cnyAcountLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.cnyAcount.mas_right).with.offset(17);
        make.centerY.equalTo(self.cnyAcount.mas_centerY);
    }];
    
    [_status mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.cnyAcount.mas_bottom).with.offset(15);
        make.left.equalTo(self.view).with.offset(32);
    }];
    
    [_statusLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.status.mas_right).with.offset(17);
        make.centerY.equalTo(self.status.mas_centerY);
    }];
    
    [_paymentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.status.mas_bottom).with.offset(15);
        make.left.equalTo(self.view).with.offset(32);
    }];
    
    [_imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.paymentLabel.mas_bottom).with.offset(10);
        make.left.equalTo(self.view).with.offset(32);
        make.right.equalTo(self.view).with.offset(-32);
        make.height.mas_equalTo(130);
    }];
    [_emptyLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.imageView.mas_centerX);
        make.centerY.equalTo(self.imageView.mas_centerY);
    }];
}
- (UIView *)titleView{
    if (_titleView == nil) {
        _titleView = [[UIView alloc]init];
    }return _titleView;
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
        _titleLabel.text = @"申诉详情";
    }
    return _titleLabel;
}
- (UIButton *)leftButton{
    if (_leftButton == nil) {
        _leftButton = [[UIButton alloc]init];
        [_leftButton setImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
        [_leftButton addTarget:self action:@selector(leftButtonClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _leftButton;
}
//懒加载
- (UIView *)view1{
    if (_view1 == nil) {
        _view1 = [[UIView alloc]init];
        _view1.backgroundColor = RGBColorHex(0x4b4f66);
        _view1.layer.cornerRadius = 5;
    }return _view1;
}

- (UILabel *)problem{
    if (_problem == nil) {
        _problem = [[UILabel alloc]init];
        _problem.font = [UIFont boldSystemFontOfSize:15];
        _problem.textColor = RGBColorHex(0x949bc3);
        _problem.text = @"申诉问题：";
    }return _problem;
}

- (UILabel *)problemLabel{
    if (_problemLabel == nil) {
        _problemLabel = [[UILabel alloc]init];
        _problemLabel.font = [UIFont boldSystemFontOfSize:15];
        _problemLabel.textColor = RGBColorHex(0xffffff);
        _problemLabel.text = @"288";
    }return _problemLabel;
}

- (UILabel *)reason{
    if (_reason == nil) {
        _reason = [[UILabel alloc]init];
        _reason.font = [UIFont boldSystemFontOfSize:15];
        _reason.textColor = RGBColorHex(0x949bc3);
        _reason.text = @"申诉原因：";
    }return _reason;
}

- (UILabel *)reasonLabel{
    if (_reasonLabel == nil) {
        _reasonLabel = [[UILabel alloc]init];
        _reasonLabel.font = [UIFont boldSystemFontOfSize:15];
        _reasonLabel.textColor = RGBColorHex(0xffffff);
        _reasonLabel.text = @"4138";
    }return _reasonLabel;
}

- (UIView *)view2{
    if (_view2 == nil) {
        _view2 = [[UIView alloc]init];
        _view2.backgroundColor = RGBColorHex(0x4b4f66);
        _view2.layer.cornerRadius = 5;
    }return _view2;
}

- (UILabel *)order{
    if (_order == nil) {
        _order = [[UILabel alloc]init];
        _order.font = [UIFont boldSystemFontOfSize:15];
        _order.textColor = RGBColorHex(0x949bc3);
        _order.text = @"申诉订单：";
    }return _order;
}
- (UILabel *)orderLabel{
    if (_orderLabel == nil) {
        _orderLabel = [[UILabel alloc]init];
        _orderLabel.font = [UIFont boldSystemFontOfSize:15];
        _orderLabel.textColor = RGBColorHex(0xffffff);
        _orderLabel.text = @"4138232";
    }return _orderLabel;
}

- (UILabel *)complainant{
    if (_complainant == nil) {
        _complainant = [[UILabel alloc]init];
        _complainant.font = [UIFont boldSystemFontOfSize:15];
        _complainant.textColor = RGBColorHex(0x949bc3);
        _complainant.text = @"申 诉 人 :";
    }return _complainant;
}
- (UILabel *)complainantLabel{
    if (_complainantLabel == nil) {
        _complainantLabel = [[UILabel alloc]init];
        _complainantLabel.font = [UIFont boldSystemFontOfSize:15];
        _complainantLabel.textColor = RGBColorHex(0xffffff);
        _complainantLabel.text = @"13178489831";
    }return _complainantLabel;
}

- (UILabel *)respondent{
    if (_respondent == nil) {
        _respondent = [[UILabel alloc]init];
        _respondent.font = [UIFont boldSystemFontOfSize:15];
        _respondent.textColor = RGBColorHex(0x949bc3);
        _respondent.text = @"被申诉人：";
    }return _respondent;
}
- (UILabel *)respondentLabel{
    if (_respondentLabel == nil) {
        _respondentLabel = [[UILabel alloc]init];
        _respondentLabel.font = [UIFont boldSystemFontOfSize:15];
        _respondentLabel.textColor = RGBColorHex(0xffffff);
        _respondentLabel.text = @"wap_user_12_13178489831";
    }return _respondentLabel;
}

- (UILabel *)ethAcount{
    if (_ethAcount == nil) {
        _ethAcount = [[UILabel alloc]init];
        _ethAcount.font = [UIFont boldSystemFontOfSize:15];
        _ethAcount.textColor = [UIColor whiteColor];
        _ethAcount.text = @"ETH数量：";
    }return _ethAcount;
}

- (UILabel *)ethAcountLabel{
    if (_ethAcountLabel == nil) {
        _ethAcountLabel = [[UILabel alloc]init];
        _ethAcountLabel.font = [UIFont boldSystemFontOfSize:13];
        _ethAcountLabel.textColor = [UIColor whiteColor];
        _ethAcountLabel.text = @"1.000000";
    }return _ethAcountLabel;
}

- (UILabel *)cnyAcount{
    if (_cnyAcount == nil) {
        _cnyAcount = [[UILabel alloc]init];
        _cnyAcount.font = [UIFont boldSystemFontOfSize:15];
        _cnyAcount.textColor = [UIColor whiteColor];
        _cnyAcount.text = @"CNY数量：";
    }return _cnyAcount;
}

- (UILabel *)cnyAcountLabel{
    if (_cnyAcountLabel == nil) {
        _cnyAcountLabel = [[UILabel alloc]init];
        _cnyAcountLabel.font = [UIFont boldSystemFontOfSize:13];
        _cnyAcountLabel.textColor = [UIColor whiteColor];
        _cnyAcountLabel.text = @"4.000000";
    }return _cnyAcountLabel;
}

- (UILabel *)status{
    if (_status == nil) {
        _status = [[UILabel alloc]init];
        _status.font = [UIFont boldSystemFontOfSize:15];
        _status.textColor = [UIColor whiteColor];
        _status.text = @"是否审核：";
    }return _status;
}

- (UILabel *)statusLabel{
    if (_statusLabel == nil) {
        _statusLabel = [[UILabel alloc]init];
        _statusLabel.font = [UIFont boldSystemFontOfSize:13];
        _statusLabel.textColor = [UIColor whiteColor];
        _statusLabel.text = @"申诉中";
    }return _statusLabel;
}

- (UILabel *)paymentLabel{
    if (_paymentLabel == nil) {
        _paymentLabel = [[UILabel alloc]init];
        _paymentLabel.font = [UIFont boldSystemFontOfSize:15];
        _paymentLabel.textColor = [UIColor whiteColor];
        _paymentLabel.text = @"支付凭证";
    }return _paymentLabel;
}
- (ETHBigImageView *)imageView{
    if (_imageView == nil) {
        _imageView = [[ETHBigImageView alloc]init];
        _imageView.layer.borderColor = RGBColorHex(0x6c91fa).CGColor;
        _imageView.layer.borderWidth = 1;
    }return _imageView;
}
- (UILabel *)emptyLabel{
    if (_emptyLabel == nil) {
        _emptyLabel = [[UILabel alloc]init];
        
        _emptyLabel.font = [UIFont systemFontOfSize:15];
        _emptyLabel.textColor = RGBColorHex(0x737893);
        _emptyLabel.text = @"未上传支付方式";
    }return _emptyLabel;
}

- (void)setDetailModel:(ETHC2CModel *)detailModel{
    _detailModel = detailModel;
    _problemLabel.text = [NSString stringWithFormat:@"%@",detailModel.text];
    _reasonLabel.text = [NSString stringWithFormat:@"%@",detailModel.textarea];
    _orderLabel.text = [NSString stringWithFormat:@"%@",detailModel.order_id];

    //申请人
    _complainantLabel.text = [NSString stringWithFormat:@"%@",detailModel.mobile];
    //被申请人
    _respondentLabel.text = [NSString stringWithFormat:@"%@",detailModel.openid2];
    
    _ethAcountLabel.text = [NSString stringWithFormat:@"%@",detailModel.trx];
    _cnyAcountLabel.text = [NSString stringWithFormat:@"%@",detailModel.money];
    
    if (detailModel.stuas.intValue == 0) {//申诉状态 0申诉中1申诉成功2申诉失败3申诉无效
        _statusLabel.text = @"申诉中";
    }else if (detailModel.stuas.intValue == 1){
        _statusLabel.text = @"申诉成功";
    }else if (detailModel.stuas.intValue == 2){
        _statusLabel.text = @"申诉失败";
    }else{
        _statusLabel.text = @"申诉无效";
    }
    if ([detailModel.file isEqualToString:@""]) {
        _emptyLabel.hidden = NO;
    }else{
        
        _emptyLabel.hidden = YES;
        
        [_imageView sd_setImageWithURL:[NSURL URLWithString:detailModel.file]];
    }
    
}

#pragma mark --方法
- (void)leftButtonClick{
    [self.navigationController popViewControllerAnimated:YES];
}

@end
