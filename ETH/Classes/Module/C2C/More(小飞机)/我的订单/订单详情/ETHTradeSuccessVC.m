//
//  ETHTradeSuccessVC.m
//  ETH
//
//  Created by weiming zhang on 2019/4/20.
//  Copyright © 2019 admin. All rights reserved.
//

#import "ETHTradeSuccessVC.h"
#import "ETHDetailTransactionView.h"
#import "ETHComplaintDetailVC.h"
#import "UIImageView+WebCache.h"
#import "http_c2c.h"
#import "SVProgressHUD.h"
#import "MJExtension.h"
#import "ETHBigImageView.h"
#import "RefreshGifHeader.h"
#import "ETHC2CModel.h"
#import "ETHComplaintDetailVC.h"

@interface ETHTradeSuccessVC ()
@property (nonatomic, strong)ETHDetailTransactionView *transactionView;
@property (nonatomic, strong)UILabel *name;
@property (nonatomic, strong)UILabel *nameLabel;
@property (nonatomic, strong)UILabel *paymentLabel;
@property (nonatomic, strong)ETHBigImageView *paymentImageView;
@property (nonatomic, strong)UILabel *emptyLabel;
@property (nonatomic, strong)UIButton *complaintButton;

@property (nonatomic, strong)ETHDetailModel *detailModel;
@end

@implementation ETHTradeSuccessVC

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
    _transactionView = [[ETHDetailTransactionView alloc]init];
    [self.view addSubview:_transactionView];
    [self.view addSubview:self.name];
    [self.view addSubview:self.nameLabel];
    [self.view addSubview:self.paymentLabel];
    [self.view addSubview:self.paymentImageView];
    [self.paymentImageView addSubview:self.emptyLabel];
    [self.view addSubview:self.complaintButton];
    [_transactionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(self.view);
        make.height.mas_equalTo(193);
    }];
    [_name mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.transactionView.mas_bottom).with.offset(15);
        make.left.equalTo(self.view).with.offset(31);
    }];
    [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.name.mas_right).with.offset(18);
        make.centerY.equalTo(self.name.mas_centerY);
    }];
    [_paymentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.name.mas_bottom).with.offset(15);
        make.left.equalTo(self.view).with.offset(31);
    }];
    [_paymentImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.paymentLabel.mas_bottom).with.offset(10);
        make.right.equalTo(self.view).with.offset(-31);
        make.left.equalTo(self.view).with.offset(31);
        make.height.mas_equalTo(130);
    }];
    [_emptyLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.paymentImageView.mas_centerX);
        make.centerY.equalTo(self.paymentImageView.mas_centerY);
    }];
    [_complaintButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.paymentImageView.mas_bottom).with.offset(50);
        make.centerX.equalTo(self.view.mas_centerX);
        make.width.mas_equalTo(140);
        make.height.mas_equalTo(37);
    }];
    ZWeakSelf
    [http_c2c guamaiedit:_vcID success:^(id responseObject)
     {
         [weakSelf showData:responseObject];
     } failure:^(NSError *error) {
         [SVProgressHUD showErrorWithStatus:error.domain];
     }];
}

-(void)showData:(id)responseObject
{
    if (kObjectIsEmpty(responseObject))
    {
        return;
    }
    
    self.detailModel = [ETHDetailModel mj_objectWithKeyValues:responseObject];
    _transactionView.model = self.detailModel.list;
    if (self.detailModel.type_own == 1) {//查看订单的角色 1自己买入或者卖出的订单 2购买人买入或者卖出的订单
        if (self.detailModel.list.type.intValue == 1) {
            self.title = @"买入ETH";
            _name.text = @"付 款 人  ： ";
            _nameLabel.text = [NSString stringWithFormat:@"%@",self.detailModel.list.mobile2];

        }else{
            self.title = @"卖出ETH";
            _name.text = @"收 款 人  ： ";
            _nameLabel.text = [NSString stringWithFormat:@"%@",self.detailModel.list.mobile];

        }
        
        if ([_transactionView.model.file isEqualToString:@""]) {
            _emptyLabel.hidden = NO;
        }else{
            _emptyLabel.hidden = YES;
            [_paymentImageView sd_setImageWithURL:[NSURL URLWithString:_transactionView.model.file]];
        }
    }else{
        //购买人买入或者卖出的订单
        if (self.detailModel.list.type.intValue == 1) {
            self.title = @"买入ETH";
            _name.text = @"付 款 人  ： ";
            _nameLabel.text = [NSString stringWithFormat:@"%@",self.detailModel.list.mobile2];
            
        }else{
            self.title = @"卖出ETH";
            _name.text = @"收 款 人  ： ";
            _nameLabel.text = [NSString stringWithFormat:@"%@",self.detailModel.list.mobile];

        }
        if ([_transactionView.model.file isEqualToString:@""]) {
            _emptyLabel.hidden = NO;
        }else{
            _emptyLabel.hidden = YES;
            [_paymentImageView sd_setImageWithURL:[NSURL URLWithString:_transactionView.model.file]];
        }
        
    }
    
    self.transactionView.type = self.type;
    self.transactionView.status = self.detailModel.list.status.integerValue;
    self.transactionView.type_own = self.detailModel.type_own;
    _nameLabel.text = [NSString stringWithFormat:@"%@",self.detailModel.list.mobile2];
    
    
}

- (void)setType:(NSInteger)type{
    _type = type;
    if (self.type == 1) {
        self.title = @"买入ETH";
        
    }else{
        self.title = @"卖出ETH";
       
    }
}

- (UILabel *)name{
    if (_name == nil) {
        _name = [[UILabel alloc]init];
        _name.font = [UIFont boldSystemFontOfSize:15];
        _name.textColor = [UIColor whiteColor];
        _name.text = @"收 款 人  ： ";
    }
    return _name;
}
- (UILabel *)nameLabel{
    if (_nameLabel == nil) {
        _nameLabel = [[UILabel alloc]init];
        _nameLabel.font = [UIFont boldSystemFontOfSize:15];
        _nameLabel.textColor = [UIColor whiteColor];
        _nameLabel.text = @"XXX";
    }
    return _nameLabel;
}
- (UILabel *)paymentLabel{
    if (_paymentLabel == nil) {
        _paymentLabel = [[UILabel alloc]init];
        _paymentLabel.font = [UIFont boldSystemFontOfSize:15];
        _paymentLabel.textColor = [UIColor whiteColor];
        _paymentLabel.text = @"支付凭证：";
    }
    return _paymentLabel;
}
- (ETHBigImageView *)paymentImageView{
    if (_paymentImageView == nil) {
        _paymentImageView = [[ETHBigImageView alloc]init];
        [_paymentImageView.layer setBorderWidth:1];
        
        //设置边框线的颜色
        [_paymentImageView.layer setBorderColor:[RGBColorHex(0x6c91fa) CGColor]];
    }
    return _paymentImageView;
}
- (UILabel *)emptyLabel{
    if (_emptyLabel == nil) {
        _emptyLabel = [[UILabel alloc]init];
        _emptyLabel.font = [UIFont systemFontOfSize:15];
        _emptyLabel.textColor = RGBColorHex(0x737893);
        _emptyLabel.text = @"未上传支付方式";
    }
    return _emptyLabel;
}

- (UIButton *)complaintButton{
    if (_complaintButton == nil) {
        _complaintButton = [[UIButton alloc]init];
        _complaintButton.layer.cornerRadius = 3;
        _complaintButton.backgroundColor = RGBColorHex(0xf25858);
        _complaintButton.titleLabel.font = [UIFont systemFontOfSize:16];
        [_complaintButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_complaintButton setTitle:@"申诉" forState:UIControlStateNormal];
        [_complaintButton addTarget:self action:@selector(complaintClick) forControlEvents:UIControlEventTouchUpInside];
    }return _complaintButton;
}


#pragma mark--方法
- (void)backClick{
    self.navigationController.navigationBar.hidden = YES;
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)complaintClick{
    ETHComplaintDetailVC *vc = [[ETHComplaintDetailVC alloc]init];
    vc.VCID = self.detailModel.list.ID;
    [self.navigationController pushViewController:vc animated:YES];
}
@end
