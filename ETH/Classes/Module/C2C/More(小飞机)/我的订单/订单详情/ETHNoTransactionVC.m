//
//  ETHNoTransactionVC.m
//  ETH
//
//  Created by weiming zhang on 2019/4/9.
//  Copyright © 2019 admin. All rights reserved.
//

#import "ETHNoTransactionVC.h"
#import "ETHDetailTransactionView.h"
#import "TYShowAlertView.h"
#import "ETHCancelAlertView.h"
#import "TYAlertController.h"
@interface ETHNoTransactionVC ()
@property (nonatomic, strong)UIButton *cancelButton;
@end

@implementation ETHNoTransactionVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"back"] style:UIBarButtonItemStylePlain target:self action:@selector(backClick)];
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor],NSFontAttributeName:[UIFont boldSystemFontOfSize:22]}];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"BG1"] forBarMetrics:UIBarMetricsDefault];
    self.title = @"卖出ETH";
    [self setup];
}

- (void)setup{
    self.view.backgroundColor = RGBColorHex(0x36394a);
    ETHDetailTransactionView *view = [[ETHDetailTransactionView alloc]init];
    [self.view addSubview:view];
    [self.view addSubview:self.cancelButton];
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(self.view);
        make.height.mas_equalTo(193);
    }];
    [_cancelButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(view.mas_bottom).with.offset(37);
        make.centerX.equalTo(self.view.mas_centerX);
        make.width.mas_equalTo(180);
        make.height.mas_equalTo(37);
    }];
}
- (UIButton *)cancelButton{
    if (_cancelButton == nil) {
        _cancelButton = [[UIButton alloc]init];
        _cancelButton.layer.cornerRadius =5;
        _cancelButton.backgroundColor = RGBColorHex(0xf25858);
        _cancelButton.titleLabel.font = [UIFont boldSystemFontOfSize:14];
        [_cancelButton setTitle:@"未交易是否取消" forState:UIControlStateNormal];
        [_cancelButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_cancelButton addTarget:self action:@selector(cancelButtonClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _cancelButton;
}
- (void)backClick{
    self.navigationController.navigationBar.hidden = YES;
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)cancelButtonClick{
    ETHCancelAlertView *view = [[ETHCancelAlertView alloc]initWithFrame:CGRectMake(100, 100, 235, 99)];
    TYAlertController *alertController = [TYAlertController alertControllerWithAlertView:view preferredStyle:TYAlertControllerStyleAlert transitionAnimation:TYAlertTransitionAnimationScaleFade];
    [self presentViewController:alertController animated:YES completion:nil];
}
@end
