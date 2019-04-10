
//
//  ETHTradeFailVC.m
//  ETH
//
//  Created by weiming zhang on 2019/4/8.
//  Copyright © 2019 admin. All rights reserved.
//

#import "ETHTradeFailVC.h"
#import "ETHDetailTransactionView.h"
@interface ETHTradeFailVC ()
@property (nonatomic, strong)UILabel *name;
@property (nonatomic, strong)UILabel *nameLabel;
@property (nonatomic, strong)UILabel *paymentLabel;
@property (nonatomic, strong)UIImageView *paymentImageView;
@property (nonatomic, strong)UILabel *emptyLabel;
@end

@implementation ETHTradeFailVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"back"] style:UIBarButtonItemStylePlain target:self action:@selector(backClick)];
    self.navigationItem.leftBarButtonItem.tintColor = [UIColor whiteColor];
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor],NSFontAttributeName:[UIFont boldSystemFontOfSize:22]}];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"BG1"] forBarMetrics:UIBarMetricsDefault];
    self.title = @"卖出ETH";
    [self setup];
}
- (void)setup{
    self.view.backgroundColor = RGBColorHex(0x36394a);
    ETHDetailTransactionView *view = [[ETHDetailTransactionView alloc]init];
    [self.view addSubview:view];
    [self.view addSubview:self.name];
    [self.view addSubview:self.nameLabel];
    [self.view addSubview:self.paymentLabel];
    [self.view addSubview:self.paymentImageView];
    [self.paymentImageView addSubview:self.emptyLabel];
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(self.view);
        make.height.mas_equalTo(193);
    }];
    [_name mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(view.mas_bottom).with.offset(15);
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
- (UIImageView *)paymentImageView{
    if (_paymentImageView == nil) {
        _paymentImageView = [[UIImageView alloc]init];
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
- (void)backClick{
    self.navigationController.navigationBar.hidden = YES;
    [self.navigationController popViewControllerAnimated:YES];
}
@end
