//
//  ETHTradingVC.m
//  ETH
//
//  Created by weiming zhang on 2019/4/20.
//  Copyright © 2019 admin. All rights reserved.
//

#import "ETHTradingVC.h"
#import "ETHSelectPayButton.h"
#import "ETHComplaintDetailVC.h"
#import "UIImageView+WebCache.h"
#import "http_c2c.h"
#import "http_user.h"
#import "SVProgressHUD.h"
#import "MJExtension.h"
#import "RefreshGifHeader.h"
#import "ETHC2CModel.h"
#import "ETHComplaintDetailVC.h"
#import "TZImagePickerController.h"

@interface ETHTradingVC ()
@property (nonatomic, strong)UIView *view1;
@property (nonatomic, strong)UILabel *orderID;
@property (nonatomic, strong)UILabel *buyerID;
@property (nonatomic, strong)UILabel *orderIDLabel;
@property (nonatomic, strong)UILabel *buyerIDLabel;
@property (nonatomic, strong)UIView *view2;
@property (nonatomic, strong)UILabel *unitPrice;
@property (nonatomic, strong)UILabel *number;
@property (nonatomic, strong)UILabel *unitPriceLabel;
@property (nonatomic, strong)UILabel *numberLabel;
@property (nonatomic, strong)UILabel *total;
@property (nonatomic, strong)UILabel *totalLabel;

@property (nonatomic, strong)UILabel *receiver;
@property (nonatomic, strong)UILabel *receiverLabel;
@property (nonatomic, strong)UILabel *payMethodLabel;
@property (nonatomic, strong)ETHSelectPayButton *selectPayButton;
@property (nonatomic, strong)UIView *view3;

@property (nonatomic, strong)UILabel *QRLabel;
@property (nonatomic, strong)UIImageView *QRimageView;

@property (nonatomic, strong)UILabel *promptLabel;
@property (nonatomic, strong)UILabel *bankLabel;
@property (nonatomic, strong)UIButton *reproduceBtn;
@property (nonatomic, strong)UILabel *cardName;
@property (nonatomic, strong)UIButton *reproduceBtn2;
@property (nonatomic, strong)UILabel *cardID;
@property (nonatomic, strong)UIButton *reproduceBtn3;

@property (nonatomic, strong)UILabel *paymentLabel;

@property (nonatomic, strong)MASConstraint *top;//设置paymentlLabel的高约束

@property (nonatomic, strong)UIImageView *imageView;
@property (nonatomic, strong)UILabel *emptyLabel;
@property (nonatomic, strong)UIButton *confirmButton;
@property (nonatomic, strong)UIButton *complaintButton;

@property (nonatomic, strong)ETHDetailModel *detailModel;
@end

@implementation ETHTradingVC


- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"back"] style:UIBarButtonItemStylePlain target:self action:@selector(backClick)];
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor],NSFontAttributeName:[UIFont boldSystemFontOfSize:22]}];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"BG1"] forBarMetrics:UIBarMetricsDefault];
//    self.title = @"卖出ETH";
    [self setup];
}

- (void)setup{
    self.view.backgroundColor = RGBColorHex(0x36394a);
    [self.view addSubview:self.view1];
    [self.view1 addSubview:self.orderID];
    [self.view1 addSubview:self.buyerID];
    [self.view1 addSubview:self.orderIDLabel];
    [self.view1 addSubview:self.buyerIDLabel];
    [self.view addSubview:self.view2];
    [self.view2 addSubview:self.unitPrice];
    [self.view2 addSubview:self.number];
    [self.view2 addSubview:self.unitPriceLabel];
    [self.view2 addSubview:self.numberLabel];
    [self.view addSubview:self.total];
    [self.view addSubview:self.totalLabel];
    [self.view addSubview:self.receiver];
    [self.view addSubview:self.receiverLabel];
    [self.view addSubview:self.payMethodLabel];
    [self.view addSubview:self.view3];
    
    [self.view3 addSubview:self.QRLabel];
    [self.view3 addSubview:self.QRimageView];
    
    [self.view3 addSubview:self.promptLabel];
    [self.view3 addSubview:self.bankLabel];
    [self.view3 addSubview:self.reproduceBtn];
    [self.view3 addSubview:self.cardName];
    [self.view3 addSubview:self.reproduceBtn2];
    [self.view3 addSubview:self.cardID];
    [self.view3 addSubview:self.reproduceBtn3];
    
    [self.view addSubview:self.paymentLabel];
    [self.view addSubview:self.imageView];
    
    [self.view addSubview:self.confirmButton];
    [self.view addSubview:self.complaintButton];
    
    [self.imageView addSubview:self.emptyLabel];
    
    _selectPayButton = [[ETHSelectPayButton alloc] init];
    [self.view addSubview:self.selectPayButton];
    [_selectPayButton setupDefaultTable];
    //注册监听button的enabled状态
    [_selectPayButton addObserver:self forKeyPath:@"titleLabel.text" options:NSKeyValueObservingOptionNew context:@"test_button"];
    
    _selectPayButton.backgroundColor = RGBColorHex(0x4b4f66);
    [_selectPayButton setTitle:@"选择支付方式" List:@[@"银行", @"支付宝",@"微信"]];
    
    [_view1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).with.offset(15);
        make.left.equalTo(self.view).with.offset(16);
        make.right.equalTo(self.view).with.offset(-16);
        make.height.mas_equalTo(64);
    }];
    [_orderID mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.equalTo(self.view1).with.offset(15);
    }];
    [_orderIDLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.orderID.mas_right).with.offset(15);
        make.centerY.equalTo(self.orderID.mas_centerY);
    }];
    [_buyerID mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.orderID.mas_bottom).with.offset(7);
        make.left.equalTo(self.view1).with.offset(15);
    }];
    [_buyerIDLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.buyerID.mas_right).with.offset(15);
        make.centerY.equalTo(self.buyerID.mas_centerY);
    }];
    [_view2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view1.mas_bottom).with.offset(15);
        make.left.equalTo(self.view).with.offset(16);
        make.right.equalTo(self.view).with.offset(-16);
        make.height.mas_equalTo(94);
    }];
    [_unitPrice mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.equalTo(self.view2).with.offset(15);
    }];
    [_unitPriceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.unitPrice.mas_right).with.offset(15);
        make.centerY.equalTo(self.unitPrice.mas_centerY);
    }];
    [_number mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.unitPrice.mas_bottom).with.offset(7);
        make.left.equalTo(self.view2).with.offset(15);
    }];
    [_numberLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.number.mas_right).with.offset(15);
        make.centerY.equalTo(self.number.mas_centerY);
    }];
    [_total mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.number.mas_bottom).with.offset(7);
        make.left.equalTo(self.view2).with.offset(15);
    }];
    [_totalLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.total.mas_right).with.offset(15);
        make.centerY.equalTo(self.total.mas_centerY);
    }];
    
    [_receiver mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).with.offset(32);
        make.top.equalTo(self.view2.mas_bottom).with.offset(13);
    }];
    [_receiverLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.receiver.mas_right).with.offset(15);
        make.centerY.equalTo(self.receiver.mas_centerY);
    }];
    [_payMethodLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).with.offset(32);
        make.top.equalTo(self.receiver.mas_bottom).with.offset(10);
    }];
    [_selectPayButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.payMethodLabel.mas_right).with.offset(15);
        make.centerY.equalTo(self.payMethodLabel.mas_centerY);
        make.width.mas_equalTo(180);
        make.height.mas_equalTo(22);
    }];
    [_view3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).with.offset(32);
        make.right.equalTo(self.view).with.offset(-32);
        make.top.equalTo(self.payMethodLabel.mas_bottom).with.offset(13);
        make.height.mas_equalTo(94.5);
    }];
    [_QRLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view3);
        make.centerX.equalTo(self.view3.mas_centerX);
    }];
    
    [_QRimageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view3.mas_centerX);
        make.top.equalTo(self.QRLabel.mas_bottom);
        make.bottom.equalTo(self.view3);
        make.width.mas_equalTo(84);
    }];
    
    [_promptLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view3).with.offset(9);
        self.top = make.top.equalTo(self.view3).with.offset(9);
    }];
    [_bankLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.promptLabel.mas_bottom).with.offset(8);
        make.left.equalTo(self.view3).with.offset(9);
    }];
    [_reproduceBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.bankLabel.mas_centerY);
        make.right.equalTo(self.view3).with.offset(-9);
        make.height.mas_equalTo(14);
        make.width.mas_equalTo(37);
    }];
    [_cardName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.bankLabel.mas_bottom).with.offset(8);
        make.left.equalTo(self.view3).with.offset(9);
    }];
    [_reproduceBtn2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.cardName.mas_centerY);
        make.right.equalTo(self.view3).with.offset(-9);
        make.height.mas_equalTo(14);
        make.width.mas_equalTo(37);
    }];
    [_cardID mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.cardName.mas_bottom).with.offset(8);
        make.left.equalTo(self.view3).with.offset(9);
    }];
    [_reproduceBtn3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.cardID.mas_centerY);
        make.right.equalTo(self.view3).with.offset(-9);
        make.height.mas_equalTo(14);
        make.width.mas_equalTo(37);
    }];
    
    [_paymentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view3.mas_bottom).with.offset(13);
        make.left.equalTo(self.view3.mas_left);
    }];
    [_imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.paymentLabel.mas_bottom).with.offset(10);
        make.left.equalTo(self.view3.mas_left);
        make.right.equalTo(self.view3.mas_right);
        make.width.mas_equalTo(313);
        make.height.mas_equalTo(95);
    }];
    
    [_emptyLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.imageView.mas_centerX);
        make.centerY.equalTo(self.imageView.mas_centerY);
    }];
    
    [_confirmButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.imageView.mas_bottom).with.offset(13);
        make.centerX.equalTo(self.view.mas_centerX);
        make.width.mas_equalTo(110);
        make.height.mas_equalTo(25);
    }];
    [_complaintButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.confirmButton.mas_bottom).with.offset(13);
        make.centerX.equalTo(self.view.mas_centerX);
        make.width.mas_equalTo(110);
        make.height.mas_equalTo(25);
    }];
    
    
    
    ZWeakSelf
    [http_c2c guamaiedit:_vcID success:^(id responseObject)
     {
         [weakSelf showData:responseObject];
     } failure:^(NSError *error) {
         [SVProgressHUD showErrorWithStatus:error.domain];
     }];
}
#pragma mark -- 显示数据
-(void)showData:(id)responseObject
{
    if (kObjectIsEmpty(responseObject))
    {
        return;
    }
    
    self.detailModel = [ETHDetailModel mj_objectWithKeyValues:responseObject];
    ETHC2CModel *model = self.detailModel.list;
    if ([model.type isEqualToString:@"1"]) {//买入时
        self.title = @"买入ETH";
        _payMethodLabel.hidden = NO;
        _view3.hidden = NO;
        //调整paymentLabel的高度约束
        [self.top uninstall];//先销毁约束
        [_paymentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            self.top = make.top.equalTo(self.view3.mas_bottom).with.offset(9);
        }];
        _receiver.text =@"收 款 人 ：";
        _selectPayButton.hidden = NO;
        _paymentLabel.text =@"上传凭证";
        _emptyLabel.text = @"点击上传支付凭证";
        [_confirmButton setTitle:@"确认" forState:UIControlStateNormal];
        _imageView.userInteractionEnabled = YES;
    }else{//卖出时把控件隐藏
        self.title = @"卖出ETH";
        _payMethodLabel.hidden = YES;
        _view3.hidden = YES;
        
        //调整paymentLabel的高度约束
        [self.top uninstall];//先销毁约束
        [_paymentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            self.top = make.top.equalTo(self.receiver.mas_bottom).with.offset(9);
        }];
        _receiver.text =@"付 款 人 ：";
        _selectPayButton.hidden = YES;
        _paymentLabel.text =@"支付凭证";
        _emptyLabel.text = @"未上传支付凭证";
        [_confirmButton setTitle:@"确认收款" forState:UIControlStateNormal];
        
        _imageView.userInteractionEnabled = NO;
    }
    _orderIDLabel.text = [NSString stringWithFormat:@"%@",model.ID];
    _buyerIDLabel.text = [NSString stringWithFormat:@"%@",model.mobile];
    _unitPriceLabel.text = [NSString stringWithFormat:@"%@",model.price];
    _numberLabel.text = [NSString stringWithFormat:@"%@",model.trx];
    _totalLabel.text = [NSString stringWithFormat:@"%@",model.money];
    _receiverLabel.text = [NSString stringWithFormat:@"%@",model.mobile2];
    _cardID.text = [NSString stringWithFormat:@"卡号：%@",model.bankid];
    _bankLabel.text = [NSString stringWithFormat:@"银行：%@",model.bank];
    _cardName.text = [NSString stringWithFormat:@"户主：%@",model.bankname];
    if ([model.file isEqualToString:@""]) {
        _emptyLabel.hidden = NO;
    }else{
        _emptyLabel.hidden = YES;
        [_imageView sd_setImageWithURL:[NSURL URLWithString:model.file]];
    }
}

- (void)setType:(NSInteger)type{
    _type = type;
    if (self.type == 1) {
        self.title = @"买入ETH";
    }else{
        self.title = @"卖出ETH";
    }
}

- (UIView *)view1{
    if (_view1 == nil) {
        _view1 = [[UIView alloc]init];
        _view1.layer.cornerRadius = 5;
        _view1.backgroundColor = RGBColorHex(0x4b4f66);
    }
    return _view1;
}
- (UILabel *)orderID{
    if (_orderID == nil) {
        _orderID = [[UILabel alloc]init];
        _orderID.font = [UIFont boldSystemFontOfSize:15];
        _orderID.textColor = RGBColorHex(0x949bc3);
        _orderID.text = @"订 单 号 ：";
    }
    return _orderID;
}
- (UILabel *)orderIDLabel{
    if (_orderIDLabel == nil) {
        _orderIDLabel = [[UILabel alloc]init];
        _orderIDLabel.font = [UIFont boldSystemFontOfSize:15];
        _orderIDLabel.textColor = [UIColor whiteColor];
        _orderIDLabel.text = @"182";
    }
    return _orderIDLabel;
}
- (UILabel *)buyerID{
    if (_buyerID == nil) {
        _buyerID = [[UILabel alloc]init];
        _buyerID.font = [UIFont boldSystemFontOfSize:15];
        _buyerID.textColor = RGBColorHex(0x949bc3);
        _buyerID.text = @"挂 卖 人 ：";
    }
    return _buyerID;
}
- (UILabel *)buyerIDLabel{
    if (_buyerIDLabel == nil) {
        _buyerIDLabel = [[UILabel alloc]init];
        _buyerIDLabel.font = [UIFont boldSystemFontOfSize:15];
        _buyerIDLabel.textColor = [UIColor whiteColor];
        _buyerIDLabel.text = @"18223424832";
    }
    return _buyerIDLabel;
}
- (UIView *)view2{
    if (_view2 == nil) {
        _view2 = [[UIView alloc]init];
        _view2.layer.cornerRadius = 5;
        _view2.backgroundColor = RGBColorHex(0x4b4f66);
    }
    return _view2;
}
- (UILabel *)unitPrice{
    if (_unitPrice == nil) {
        _unitPrice = [[UILabel alloc]init];
        _unitPrice.font = [UIFont systemFontOfSize:15];
        _unitPrice.textColor = RGBColorHex(0x949bc3);
        _unitPrice.text = @"挂卖单价：";
    }
    return _unitPrice;
}
- (UILabel *)unitPriceLabel{
    if (_unitPriceLabel == nil) {
        _unitPriceLabel = [[UILabel alloc]init];
        _unitPriceLabel.font = [UIFont systemFontOfSize:15];
        _unitPriceLabel.textColor = [UIColor whiteColor];
        _unitPriceLabel.text = @"4.00";
    }
    return _unitPriceLabel;
}
- (UILabel *)number{
    if (_number == nil) {
        _number = [[UILabel alloc]init];
        _number.font = [UIFont systemFontOfSize:15];
        _number.textColor = RGBColorHex(0x949bc3);
        _number.text = @"挂卖数量：";
    }
    return _number;
}
- (UILabel *)numberLabel{
    if (_numberLabel == nil) {
        _numberLabel = [[UILabel alloc]init];
        _numberLabel.font = [UIFont systemFontOfSize:15];
        _numberLabel.textColor = [UIColor whiteColor];
        _numberLabel.text = @"2";
    }
    return _numberLabel;
}
- (UILabel *)total{
    if (_total == nil) {
        _total = [[UILabel alloc]init];
        _total.font = [UIFont systemFontOfSize:15];
        _total.textColor = RGBColorHex(0x949bc3);
        _total.text = @"需 付 款  ：";
    }
    return _total;
}
- (UILabel *)totalLabel{
    if (_totalLabel == nil) {
        _totalLabel = [[UILabel alloc]init];
        _totalLabel.font = [UIFont systemFontOfSize:15];
        _totalLabel.textColor = [UIColor whiteColor];
        _totalLabel.text = @"8.00";
    }
    return _totalLabel;
}

- (UILabel *)receiver{
    if (_receiver == nil) {
        _receiver = [[UILabel alloc]init];
        _receiver.font = [UIFont boldSystemFontOfSize:15];
        _receiver.textColor = [UIColor whiteColor];
        _receiver.text =@"收 款 人 ：";
    }return _receiver;
}

- (UILabel *)receiverLabel{
    if (_receiverLabel == nil) {
        _receiverLabel = [[UILabel alloc]init];
        _receiverLabel.font = [UIFont boldSystemFontOfSize:15];
        _receiverLabel.textColor = [UIColor whiteColor];
        _receiverLabel.text =@"15114833943";
    }return _receiverLabel;
}

- (UILabel *)payMethodLabel{
    if (_payMethodLabel == nil) {
        _payMethodLabel = [[UILabel alloc]init];
        _payMethodLabel.font = [UIFont boldSystemFontOfSize:15];
        _payMethodLabel.textColor = [UIColor whiteColor];
        _payMethodLabel.text =@"支付方式：";
    }return _payMethodLabel;
}

- (UIView *)view3{
    if (_view3 == nil) {
        _view3 = [[UIView alloc]init];
        _view3.layer.borderColor = RGBColorHex(0x6c91fa).CGColor;
        _view3.layer.borderWidth = 1;
    }
    return _view3;
}

- (UILabel *)QRLabel{
    if (_QRLabel == nil) {
        _QRLabel = [[UILabel alloc]init];
        _QRLabel.font = [UIFont systemFontOfSize:10];
        _QRLabel.textColor = [UIColor whiteColor];
        _QRLabel.text = @"请扫描二维码完成支付";
        _QRLabel.hidden = YES;
    }return _QRLabel;
}

- (UIImageView *)QRimageView{
    if (_QRimageView == nil) {
        _QRimageView = [[UIImageView alloc]init];
        _QRimageView.hidden = YES;
    }return _QRimageView;
}



- (UILabel *)promptLabel{
    if (_promptLabel == nil) {
        _promptLabel = [[UILabel alloc]init];
        _promptLabel.font = [UIFont systemFontOfSize:10];
        _promptLabel.textColor = RGBColorHex(0xf25858);
        _promptLabel.text = @"*请前往当地银行打款";
    }return _promptLabel;
}

- (UILabel *)bankLabel{
    if (_bankLabel == nil) {
        _bankLabel = [[UILabel alloc]init];
        _bankLabel.font = [UIFont boldSystemFontOfSize:12];
        _bankLabel.textColor = [UIColor whiteColor];
        _bankLabel.text = @"银行：广州银行";
    }return _bankLabel;
}
- (UIButton *)reproduceBtn{
    if (_reproduceBtn == nil) {
        _reproduceBtn = [[UIButton alloc]init];
        _reproduceBtn.layer.cornerRadius = 3;
        _reproduceBtn.backgroundColor = RGBColorHex(0x5ec05e);
        _reproduceBtn.titleLabel.font = [UIFont systemFontOfSize:9];
        [_reproduceBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_reproduceBtn setTitle:@"复制" forState:UIControlStateNormal];
        [_reproduceBtn addTarget:self action:@selector(copyBankLabel) forControlEvents:UIControlEventTouchUpInside];
    }return _reproduceBtn;
}

- (UILabel *)cardName{
    if (_cardName == nil) {
        _cardName = [[UILabel alloc]init];
        _cardName.font = [UIFont boldSystemFontOfSize:12];
        _cardName.textColor = [UIColor whiteColor];
        _cardName.text = @"户主：cat";
    }return _cardName;
}

- (UIButton *)reproduceBtn2{
    if (_reproduceBtn2 == nil) {
        _reproduceBtn2 = [[UIButton alloc]init];
        _reproduceBtn2.layer.cornerRadius = 3;
        _reproduceBtn2.backgroundColor = RGBColorHex(0x5ec05e);
        _reproduceBtn2.titleLabel.font = [UIFont systemFontOfSize:9];
        [_reproduceBtn2 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_reproduceBtn2 setTitle:@"复制" forState:UIControlStateNormal];
        [_reproduceBtn2 addTarget:self action:@selector(copyCardName) forControlEvents:UIControlEventTouchUpInside];
    }return _reproduceBtn2;
}

- (UILabel *)cardID{
    if (_cardID == nil) {
        _cardID = [[UILabel alloc]init];
        _cardID.font = [UIFont boldSystemFontOfSize:12];
        _cardID.textColor = [UIColor whiteColor];
        _cardID.text = @"户号：3333333";
    }return _cardID;
}

- (UIButton *)reproduceBtn3{
    if (_reproduceBtn3 == nil) {
        _reproduceBtn3 = [[UIButton alloc]init];
        _reproduceBtn3.layer.cornerRadius = 3;
        _reproduceBtn3.backgroundColor = RGBColorHex(0x5ec05e);
        _reproduceBtn3.titleLabel.font = [UIFont systemFontOfSize:9];
        [_reproduceBtn3 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_reproduceBtn3 setTitle:@"复制" forState:UIControlStateNormal];
        [_reproduceBtn3 addTarget:self action:@selector(copyCardID) forControlEvents:UIControlEventTouchUpInside];
    }return _reproduceBtn3;
}

- (UILabel *)paymentLabel{
    if (_paymentLabel == nil) {
        _paymentLabel = [[UILabel alloc]init];
        _paymentLabel.font = [UIFont boldSystemFontOfSize:15];
        _paymentLabel.textColor = [UIColor whiteColor];
        _paymentLabel.text =@"上传凭证";
    }return _paymentLabel;
}

- (UIImageView *)imageView{
    if (_imageView == nil) {
        _imageView = [[UIImageView alloc]init];
        _imageView.layer.borderWidth = 1;
        _imageView.layer.borderColor = RGBColorHex(0x6c91fa).CGColor;
        
        _imageView.userInteractionEnabled = YES;//打开用户交互
        UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleSingleTap:)];
        [_imageView addGestureRecognizer:singleTap];
        
        
    }
    return _imageView;
}

- (UILabel *)emptyLabel{
    if (_emptyLabel == nil) {
        _emptyLabel = [[UILabel alloc]init];
        _emptyLabel.textColor = RGBColorHex(0x738393);
        _emptyLabel.text = @"点击上传支付凭证";
        _emptyLabel.font = [UIFont systemFontOfSize:15];
    }return _emptyLabel;
}
- (UIButton *)confirmButton{
    if (_confirmButton == nil) {
        _confirmButton = [[UIButton alloc]init];
        _confirmButton.layer.cornerRadius = 3;
        _confirmButton.backgroundColor = RGBColorHex(0x5ec05e);
        _confirmButton.titleLabel.font = [UIFont systemFontOfSize:13];
        [_confirmButton setTitle:@"确认" forState:UIControlStateNormal];
        [_confirmButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_confirmButton addTarget:self action:@selector(confirmClick) forControlEvents:UIControlEventTouchUpInside];
    }return _confirmButton;
}

- (UIButton *)complaintButton{
    if (_complaintButton == nil) {
        _complaintButton = [[UIButton alloc]init];
        _complaintButton.layer.cornerRadius = 3;
        _complaintButton.backgroundColor = RGBColorHex(0xf25858);
        _complaintButton.titleLabel.font = [UIFont systemFontOfSize:13];
        [_complaintButton setTitle:@"申诉" forState:UIControlStateNormal];
        [_complaintButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_complaintButton addTarget:self action:@selector(complaintClick) forControlEvents:UIControlEventTouchUpInside];
    }return _complaintButton;
}

#pragma mark -- 方法
- (void)backClick{
    self.navigationController.navigationBar.hidden = YES;
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)complaintClick{
    ETHComplaintDetailVC *vc = [[ETHComplaintDetailVC alloc]init];
    vc.VCID = self.detailModel.list.ID;
    [self.navigationController pushViewController:vc animated:YES];
}

//下拉框选中时显示不同控件
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    UIButton *button = (UIButton *)object;
    if (_selectPayButton == button && [@"titleLabel.text" isEqualToString:keyPath]) {
        if ([[change objectForKey:@"new"] isEqualToString:@"微信"]) {
            self.promptLabel.hidden = YES;
            self.bankLabel.hidden = YES;
            self.reproduceBtn.hidden = YES;
            self.cardName.hidden = YES;
            self.reproduceBtn2.hidden = YES;
            self.cardID.hidden = YES;
            self.reproduceBtn3.hidden = YES;
            _QRimageView.hidden = NO;
            [_QRimageView sd_setImageWithURL:[NSURL URLWithString:self.detailModel.list.wxfile]];
            _QRLabel.hidden = NO;
        }else if ([[change objectForKey:@"new"] isEqualToString:@"支付宝"]){
            self.promptLabel.hidden = YES;
            self.bankLabel.hidden = YES;
            self.reproduceBtn.hidden = YES;
            self.cardName.hidden = YES;
            self.reproduceBtn2.hidden = YES;
            self.cardID.hidden = YES;
            self.reproduceBtn3.hidden = YES;
            _QRimageView.hidden = NO;
            [_QRimageView sd_setImageWithURL:[NSURL URLWithString:self.detailModel.list.zfbfile]];
            _QRLabel.hidden = NO;
        }else{
            _QRimageView.hidden = YES;
            _QRLabel.hidden = YES;
            self.promptLabel.hidden = NO;
            self.bankLabel.hidden = NO;
            self.reproduceBtn.hidden = NO;
            self.cardName.hidden = NO;
            self.reproduceBtn2.hidden = NO;
            self.cardID.hidden = NO;
            self.reproduceBtn3.hidden = NO;
            
        }
    }}
- (void)dealloc{
    [_selectPayButton removeObserver:self forKeyPath:@"titleLabel.text"];
}


//点击上传图片
- (void)handleSingleTap:(UIGestureRecognizer *)gestureRecognizer {
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
    
    self.detailModel.list.file = [responseObject objectForKey:@"img"];
    [SVProgressHUD showSuccessWithStatus:@"上传成功"];
    _emptyLabel.hidden = YES;
    [_imageView sd_setImageWithURL:[NSURL URLWithString:self.detailModel.list.file]];
}



- (void)copyBankLabel{
    //复制粘贴功能
    UIPasteboard *pab = [UIPasteboard generalPasteboard];
    pab.string = self.bankLabel.text;
    if (pab == nil) {
        [SVProgressHUD showErrorWithStatus:@"复制失败"];
    }else
    {
        [SVProgressHUD showSuccessWithStatus:@"已复制"];
    }
}
- (void)copyCardName{
    //复制粘贴功能
    UIPasteboard *pab = [UIPasteboard generalPasteboard];
    pab.string = self.cardName.text;
    if (pab == nil) {
        [SVProgressHUD showErrorWithStatus:@"复制失败"];
    }else
    {
        [SVProgressHUD showSuccessWithStatus:@"已复制"];
    }
}
- (void)copyCardID{
    //复制粘贴功能
    UIPasteboard *pab = [UIPasteboard generalPasteboard];
    pab.string = self.cardID.text;
    if (pab == nil) {
        [SVProgressHUD showErrorWithStatus:@"复制失败"];
    }else
    {
        [SVProgressHUD showSuccessWithStatus:@"已复制"];
    }
}

//确认收款或付款
- (void)confirmClick{
    //files 图片文件
    if (self.detailModel.list.type.intValue == 1) {//买入时
        [http_c2c selloutyes:self.detailModel.list.ID type:@"1" file:self.detailModel.list.file success:^(id responseObject){
            [SVProgressHUD showSuccessWithStatus:@"买入成功"];
            [self backClick];
        }failure:^(NSError *error) {
            [SVProgressHUD showErrorWithStatus:error.domain];
        }];
    }else{
        [http_c2c selloutyes:self.detailModel.list.ID type:@"2" file:@"1" success:^(id responseObject){
            [SVProgressHUD showSuccessWithStatus:@"卖出成功"];
            [self backClick];
        }failure:^(NSError *error) {
            [SVProgressHUD showErrorWithStatus:error.domain];
        }];
    }
    
}
@end
