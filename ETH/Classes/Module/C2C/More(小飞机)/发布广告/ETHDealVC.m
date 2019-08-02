//
//  ETHDealVC.m
//  ETH
//
//  Created by weiming zhang on 2019/4/9.
//  Copyright © 2019 admin. All rights reserved.
//

#import "ETHDealVC.h"
#import "ETHDealTF.h"
#import "ETHCancelAlertView.h"
#import "TYAlertController.h"
#import "http_c2c.h"
#import "ETHC2CModel.h"
#import "http_mine.h"
#import "SVProgressHUD.h"
#import "MJExtension.h"

@interface ETHDealVC ()<UITextFieldDelegate>
@property (nonatomic, strong)UIView *bgView;
@property (nonatomic, strong)UILabel *priceLabel;
@property (nonatomic, strong)ETHDealTF *priceTF;
@property (nonatomic, strong)UILabel *referenceLabel;
@property (nonatomic, strong)UIView *lineView1;
@property (nonatomic, strong)UILabel *numberLabel;
@property (nonatomic, strong)ETHDealTF *numberTF;
@property (nonatomic, strong)UILabel *billCountLabel;
@property (nonatomic, strong)ETHDealTF *billCountTF;
@property (nonatomic, strong)UILabel *serviceCharge;
@property (nonatomic, strong)UIView *lineView2;
@property (nonatomic, strong)UILabel *totalLabel;
@property (nonatomic, strong)ETHDealTF *totalTF;
@property (nonatomic, strong)UIButton *agreeButton;

@property (nonatomic, strong)ETHDetailModel *detailModel;
//@property (nonatomic, assign)NSInteger tempCount;
@end

@implementation ETHDealVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setup];
}

- (void)setup{
    [self.view addSubview:self.bgView];
    [self.bgView addSubview:self.priceLabel];
    [self.bgView addSubview:self.priceTF];
    [self.bgView addSubview:self.referenceLabel];
    [self.bgView addSubview:self.lineView1];
    [self.bgView addSubview:self.numberLabel];
    [self.bgView addSubview:self.numberTF];
    [self.bgView addSubview:self.billCountLabel];
    [self.bgView addSubview:self.billCountTF];
    [self.bgView addSubview:self.serviceCharge];
    [self.bgView addSubview:self.lineView2];
    [self.bgView addSubview:self.totalLabel];
    [self.bgView addSubview:self.totalTF];
    [self.view addSubview:self.agreeButton];
    _priceTF.delegate = self;
    _numberTF.delegate = self;
    [_bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(self.view);
//        make.height.mas_equalTo(355);
    }];
    [_priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.bgView).with.offset(15);
        make.left.equalTo(self.bgView).with.offset(16);
    }];
    [_priceTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.priceLabel.mas_bottom).with.offset(8);
        make.left.equalTo(self.bgView).with.offset(16);
        make.right.equalTo(self.bgView).with.offset(-16);
        make.height.mas_equalTo(35);
    }];
    [_referenceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.priceTF.mas_bottom).with.offset(7);
        make.right.equalTo(self.priceTF.mas_right);
    }];
    [_lineView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.referenceLabel.mas_bottom).with.offset(9);
        make.left.equalTo(self.bgView).with.offset(16);
        make.right.equalTo(self.bgView).with.offset(-16);
        make.height.mas_equalTo(1);
    }];
    [_numberLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.lineView1.mas_bottom).with.offset(9);
        make.left.equalTo(self.bgView).with.offset(16);
    }];
    [_numberTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.numberLabel.mas_bottom).with.offset(8);
        make.left.equalTo(self.bgView).with.offset(16);
        make.right.equalTo(self.bgView).with.offset(-16);
        make.height.mas_equalTo(35);
    }];
    [_billCountLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.numberTF.mas_bottom).with.offset(8);
        make.left.equalTo(self.bgView).with.offset(16);
    }];
    [_billCountTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.billCountLabel.mas_bottom).with.offset(8);
        make.left.equalTo(self.bgView).with.offset(16);
        make.right.equalTo(self.bgView).with.offset(-16);
        make.height.mas_equalTo(35);
    }];
    [_serviceCharge mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.billCountTF.mas_bottom).with.offset(7);
        make.right.equalTo(self.billCountTF.mas_right);
    }];
    [_lineView2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.serviceCharge.mas_bottom).with.offset(9);
        make.left.equalTo(self.bgView).with.offset(16);
        make.right.equalTo(self.bgView).with.offset(-16);
        make.height.mas_equalTo(1);
    }];
    [_totalLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.lineView2.mas_bottom).with.offset(9);
        make.left.equalTo(self.bgView).with.offset(16);
    }];
    [_totalTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.totalLabel.mas_bottom).with.offset(8);
        make.left.equalTo(self.bgView).with.offset(16);
        make.right.equalTo(self.bgView).with.offset(-16);
        make.height.mas_equalTo(35);
        make.bottom.equalTo(self.bgView).with.offset(-15);
    }];
    [_agreeButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.bgView.mas_bottom).with.offset(20);
        make.centerX.equalTo(self.view.mas_centerX);
        make.width.mas_equalTo(140);
        make.height.mas_equalTo(37);
    }];
    
    [http_mine ether:^(id responseObject) {
        [self showData:responseObject];
    } failure:^(NSError *error) {
        [SVProgressHUD showErrorWithStatus:error.domain];
    }];
}
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
//    if (textField == _priceTF) {
//
//        if (textField.text.length >= 10)
//            return NO;
//
//    }
    if (textField == self.priceTF) {
        //这里的if时候为了获取删除操作,如果没有次if会造成当达到字数限制后删除键也不能使用的后果.
        if (range.length == 1 && string.length == 0) {
            return YES;
        }
        //so easy
        else if (self.priceTF.text.length >= 10) {
            self.priceTF.text = [textField.text substringToIndex:10];
            return NO;
        }
    }
    if (textField == self.numberTF) {
        //这里的if时候为了获取删除操作,如果没有次if会造成当达到字数限制后删除键也不能使用的后果.
        if (range.length == 1 && string.length == 0) {
            return YES;
        }
        //so easy
        else if (self.numberTF.text.length >= 10) {
            self.numberTF.text = [textField.text substringToIndex:10];
            return NO;
        }
    }

    return YES;
   
}

- (void)showData:(id)responseObject{
    if (kObjectIsEmpty(responseObject)) {
        return;
    }
    self.detailModel = [ETHDetailModel mj_objectWithKeyValues:responseObject];
    _referenceLabel.text = [NSString stringWithFormat:@"参考价格：￥%.6f~¥%.6f",_detailModel.list.trxprice.floatValue*0.900000,_detailModel.list.trxprice.floatValue*1.100000];
    _serviceCharge.text = [NSString stringWithFormat:@"手续费：%@%%",_detailModel.list.trxsxf];
}

- (UIView *)bgView{
    if (_bgView == nil) {
        _bgView = [[UIView alloc]init];
        _bgView.backgroundColor = RGBColorHex(0x3c3f51);
    }
    return _bgView;
}
- (UILabel *)priceLabel{
    if (_priceLabel == nil) {
        _priceLabel = [[UILabel alloc]init];
        _priceLabel.font = [UIFont boldSystemFontOfSize:15];
        _priceLabel.textColor = [UIColor whiteColor];
        _priceLabel.text = @"价格(CNY)";
    }
    return _priceLabel;
}
- (UITextField *)priceTF{
    if (_priceTF ==nil) {
        _priceTF = [[ETHDealTF alloc]init];
        _priceTF.layer.cornerRadius = 3;
        _priceTF.backgroundColor = RGBColorHex(0x4d5167);
        _priceTF.placeholder = @"请输入买入的价格";
        [_priceTF setValue:RGBColorHex(0x737792) forKeyPath:@"_placeholderLabel.textColor"];
        [_priceTF setValue:[UIFont systemFontOfSize:12] forKeyPath:@"_placeholderLabel.font"];
        [_priceTF addTarget:self action:@selector(priceTFDidChange:) forControlEvents:UIControlEventEditingChanged];
    }
    return _priceTF;
}
- (UILabel *)referenceLabel{
    if (_referenceLabel ==nil) {
        _referenceLabel = [[UILabel alloc]init];
        _referenceLabel.font= [UIFont systemFontOfSize:9];
        _referenceLabel.textColor = RGBColorHex(0x737792);
        _referenceLabel.text = @"参考价格：￥3.6-4.4";
    }
    return _referenceLabel;
}
- (UIView *)lineView1{
    if (_lineView1 ==nil) {
        _lineView1 = [[UIView alloc]init];
        _lineView1.backgroundColor =RGBColorHex(0x4f5367);
    }
    return _lineView1;
}
- (UILabel *)numberLabel{
    if (_numberLabel ==nil) {
        _numberLabel = [[UILabel alloc]init];
        _numberLabel.font = [UIFont boldSystemFontOfSize:15];
        _numberLabel.textColor = [UIColor whiteColor];
        _numberLabel.text = @"买入数量(ETH)";
        
    }
    return _numberLabel;
}
- (ETHDealTF *)numberTF{
    if (_numberTF ==nil) {
        _numberTF = [[ETHDealTF alloc]init];
        _numberTF.layer.cornerRadius = 3;
        _numberTF.backgroundColor = RGBColorHex(0x4d5167);
        _numberTF.placeholder = @"请输入购买的数量";
        [_numberTF setValue:RGBColorHex(0x737792) forKeyPath:@"_placeholderLabel.textColor"];
        [_numberTF setValue:[UIFont systemFontOfSize:12] forKeyPath:@"_placeholderLabel.font"];
        [_numberTF addTarget:self action:@selector(numberTFDidChange:) forControlEvents:UIControlEventEditingChanged];
        
    }
    return _numberTF;
}
- (UILabel *)billCountLabel{
    if (_billCountLabel ==nil) {
        _billCountLabel = [[UILabel alloc]init];
        _billCountLabel.font = [UIFont boldSystemFontOfSize:15];
        _billCountLabel.textColor = [UIColor whiteColor];
        _billCountLabel.text = @"预获币数(ETH)";
        
    }
    return _billCountLabel;
}
- (ETHDealTF *)billCountTF{
    if (_billCountTF ==nil) {
        _billCountTF = [[ETHDealTF alloc]init];
        _billCountTF.layer.cornerRadius = 3;
        _billCountTF.backgroundColor = RGBColorHex(0x4d5167);
        _billCountTF.placeholder = @"0";
        [_billCountTF setValue:RGBColorHex(0x737792) forKeyPath:@"_placeholderLabel.textColor"];
        [_billCountTF setValue:[UIFont systemFontOfSize:12] forKeyPath:@"_placeholderLabel.font"];
        _billCountTF.enabled = NO;
    }
    return _billCountTF;
}
- (UILabel *)serviceCharge{
    if (_serviceCharge == nil) {
        _serviceCharge = [[UILabel alloc]init];
        _serviceCharge.font= [UIFont systemFontOfSize:9];
        _serviceCharge.textColor = RGBColorHex(0x737792);
        _serviceCharge.text = @"手续费：1%";
    }
    return _serviceCharge;
}
- (UIView *)lineView2{
    if (_lineView2 ==nil) {
        _lineView2 = [[UIView alloc]init];
        _lineView2.backgroundColor =RGBColorHex(0x4f5367);
    }
    return _lineView2;
}
- (UILabel *)totalLabel{
    if (_totalLabel ==nil) {
        _totalLabel = [[UILabel alloc]init];
        _totalLabel.font = [UIFont boldSystemFontOfSize:15];
        _totalLabel.textColor = [UIColor whiteColor];
        _totalLabel.text = @"预付金额(CNY)";
        
    }
    return _totalLabel;
}

- (ETHDealTF *)totalTF{
    if (_totalTF ==nil) {
        _totalTF = [[ETHDealTF alloc]init];
        _totalTF.layer.cornerRadius = 3;
        _totalTF.backgroundColor = RGBColorHex(0x4d5167);
        _totalTF.placeholder = @"0";
        [_totalTF setValue:RGBColorHex(0x737792) forKeyPath:@"_placeholderLabel.textColor"];
        [_totalTF setValue:[UIFont systemFontOfSize:12] forKeyPath:@"_placeholderLabel.font"];
        _totalTF.enabled = NO;
    }
    return _totalTF;
}
- (UIButton *)agreeButton{
    if (_agreeButton == nil) {
        _agreeButton = [[UIButton alloc]init];
        _agreeButton.layer.cornerRadius = 3;
        _agreeButton.backgroundColor = RGBColorHex(0x5ec05e);
        _agreeButton.titleLabel.font = [UIFont systemFontOfSize:16];
        [_agreeButton setTitle:@"确定买入" forState:UIControlStateNormal];
        [_agreeButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_agreeButton addTarget:self action:@selector(agreeClick:) forControlEvents:UIControlEventTouchUpInside];
   
    }
    return _agreeButton;
}

- (void)setType:(NSInteger)type{
    _type = type;
    if (_type == 0) {
        [_agreeButton setTitle:@"确定买入" forState:UIControlStateNormal];
        _totalLabel.text = @"预付金额(CNY)";
        _billCountLabel.text = @"预获币数(ETH)";
        _numberTF.placeholder = @"请输入购买的数量";
        _numberLabel.text = @"买入数量(ETH)";
        _priceTF.placeholder = @"请输入买入的价格";
    }else{
        [_agreeButton setTitle:@"确定卖出" forState:UIControlStateNormal];
        _totalLabel.text = @"待付金额(ETH)";
        _billCountLabel.text = @"预获金额(CNY)";
        _numberTF.placeholder = @"请输入卖出的数量";
        _numberLabel.text = @"卖出数量(ETH)";
        _priceTF.placeholder = @"请输入卖出的价格";
    }
    
}
//监听textfield值变化
//数量输入框变化
- (void)numberTFDidChange:(id) sender {
    UITextField *_field = (UITextField *)sender;
    if (_type == 0) {
        float count = _field.text.floatValue * 0.99;
        float price = _field.text.floatValue * _priceTF.text.floatValue;
        _billCountTF.text = [NSString stringWithFormat:@"%.2f",count];
        _totalTF.text = [NSString stringWithFormat:@"%.2f",price];
    }else{
        float count = _field.text.floatValue * _priceTF.text.floatValue;
        float price = 1.01 * _field.text.floatValue;
        _billCountTF.text = [NSString stringWithFormat:@"%.2f",count];
        _totalTF.text = [NSString stringWithFormat:@"%.2f",round(price *100)/100];
        
    }
}
//价格输入框变化
- (void)priceTFDidChange:(id) sender {
    UITextField *_field = (UITextField *)sender;
    if (_type == 0) {
        float price = _field.text.floatValue * _numberTF.text.floatValue;
        _totalTF.text = [NSString stringWithFormat:@"%.8f",price];
    }else{
        float count = _field.text.floatValue * _numberTF.text.floatValue;
        _billCountTF.text = [NSString stringWithFormat:@"%.8f",count];
    }
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

- (void)agreeClick: (UIButton *)Btn{
    NSString * shouxufei = [NSString stringWithFormat:@"%ld",self.detailModel.list.trxsxf.integerValue/100];
    /**
     c2c订单中心确认买入或者卖出接口
     @param type     1卖出 0买入
     @param price 买入或者卖出价格
     @param money 买入预付金额或者卖出预获金额
     @param sxf0 手续费
     @param trx 买入或者卖出数量
     @param trx2 卖出所需支付TRX币 ETH
     */
    if (_type == 0) {
    [http_c2c hangonsale:@"0" price:_priceTF.text money:_totalTF.text sxf0:shouxufei trx:_numberTF.text trx2:_billCountTF.text success:^(id responseObject)
     {
         ETHCancelAlertView *view1 = [[ETHCancelAlertView alloc]initWithFrame:CGRectMake(100, 100, 235, 99)];
         view1.isNOApi = YES;
             [view1 setTitle:@"挂买成功"];
         TYAlertController *alertController = [TYAlertController alertControllerWithAlertView:view1 preferredStyle:TYAlertControllerStyleAlert transitionAnimation:TYAlertTransitionAnimationScaleFade];
         [self presentViewController:alertController animated:YES completion:nil];

     } failure:^(NSError *error) {
         [SVProgressHUD showErrorWithStatus:error.domain];
     }];
    }else{
//        挂卖
        [http_c2c hangonsale:@"1" price:_priceTF.text money:_billCountTF.text sxf0:shouxufei trx:_numberTF.text trx2:_totalTF.text success:^(id responseObject)
         {
             ETHCancelAlertView *view1 = [[ETHCancelAlertView alloc]initWithFrame:CGRectMake(100, 100, 235, 99)];
             view1.isNOApi = YES;
             
             [view1 setTitle:@"挂卖成功"];
             TYAlertController *alertController = [TYAlertController alertControllerWithAlertView:view1 preferredStyle:TYAlertControllerStyleAlert transitionAnimation:TYAlertTransitionAnimationScaleFade];
             [self presentViewController:alertController animated:YES completion:nil];
             
         } failure:^(NSError *error) {
             [SVProgressHUD showErrorWithStatus:error.domain];
         }];
    }
    
}

@end
