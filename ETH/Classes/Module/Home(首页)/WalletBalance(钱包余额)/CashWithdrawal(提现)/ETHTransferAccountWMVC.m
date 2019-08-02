//
//  ETHTransferAccountWMVC.m
//  ETH
//
//  Created by admin on 2019/4/22.
//  Copyright © 2019 admin. All rights reserved.
//

#import "ETHTransferAccountWMVC.h"
#import "ETHWalletETHVC.h"
#import "ETHCashWithdrawaVC.h"


@interface ETHTransferAccountWMVC ()

@property (nonatomic, strong) ETHWalletETHVC *walletVC;
@property (nonatomic, strong) ETHCashWithdrawaVC *cashWithdVC;

@end

@implementation ETHTransferAccountWMVC


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"提币";
    self.view.backgroundColor = RGBColorHex(0xffffff);
    
    UISegmentedControl* segment = [[UISegmentedControl alloc]initWithFrame:CGRectMake(0, 10, LL_ScreenWidth, 30)];
    //在索引值为0的位置上插入一个标题为red的按钮，第三个参数为是否开启动画
    [segment insertSegmentWithTitle:@"ETH提币" atIndex:0 animated:YES];
//    [segment insertSegmentWithTitle:@"复投账户" atIndex:1 animated:YES];
    
    //设置Segment的字体
    NSDictionary *dic = @{
                          //1.设置字体样式:例如黑体,和字体大小
                          NSFontAttributeName:[UIFont fontWithName:@"Arial" size:17],
                          //2.字体颜色
                          NSForegroundColorAttributeName:RGBColorHex(0x7685a6)
                          };
    
    [segment setTitleTextAttributes:dic forState:UIControlStateNormal];
    
    //设置Segment选中的字体
    NSDictionary *dic2 = @{
                           //1.设置字体样式:例如黑体,和字体大小
                           NSFontAttributeName:[UIFont fontWithName:@"Arial" size:17],
                           //2.字体颜色
                           NSForegroundColorAttributeName:RGBColorHex(0xffffff)
                           };
    
    [segment setTitleTextAttributes:dic2 forState:UIControlStateSelected];
    
    //设置未选中时的背景色
    [segment setBackgroundImage:[UIImage imageNamed:@"backGr"]
                       forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    
//    //设置选中时的背景色
//    [segment setBackgroundImage:[UIImage imageNamed:@"backGround"]
//                       forState:UIControlStateSelected barMetrics:UIBarMetricsDefault];
//
    //设置标题和边框的颜色
    segment.tintColor = RGBColorHex(0xffffff);
    //设置初始选中值，默认是没有选中
    segment.selectedSegmentIndex = 0;
    //    self.view.backgroundColor = [UIColor magentaColor];
    //绑定事件
    [segment addTarget:self action:@selector(segmentAction:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:segment];
    
    self.walletVC.view.hidden = NO;
}

-(void)segmentAction:(UISegmentedControl*)sender
{
    self.walletVC.view.hidden = YES;
    self.cashWithdVC.view.hidden = YES;
    
    if (sender.selectedSegmentIndex==0)
    {
        //ETH提现
        self.walletVC.view.hidden = NO;
    }
//    else if (sender.selectedSegmentIndex==1)
//    {
//        //复投账户
//        self.cashWithdVC.view.hidden = NO;
//    }
    //titleForSegmentAtIndex通过索引值获取被选中的分段控制器的按钮标题，selectedSegmentIndex 是获取被选中按钮的索引值
    NSLog(@"----%@",[sender titleForSegmentAtIndex:sender.selectedSegmentIndex]);
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAippear:(BOOL)animated{
    
    [super viewWillAppear:animated];
}

-(void) viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
}


-(ETHWalletETHVC*)walletVC
{
    if (_walletVC==nil) {
        _walletVC = [[ETHWalletETHVC alloc]init];
        [self addChildViewController:_walletVC];
        [self.view addSubview:_walletVC.view];
        [_walletVC.view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.bottom.mas_equalTo(0);
            make.top.mas_equalTo(40);
        }];
    }
    
    return _walletVC;
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}
//-(ETHCashWithdrawaVC *)cashWithdVC
//{
//    if (_cashWithdVC==nil) {
//        _cashWithdVC = [[ETHCashWithdrawaVC alloc]init];
//        [self addChildViewController:_cashWithdVC];
//        [self.view addSubview:_cashWithdVC.view];
//        [_cashWithdVC.view mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.left.right.bottom.mas_equalTo(0);
//            make.top.mas_equalTo(40);
//        }];
//    }
//
//    return _cashWithdVC;
//}



@end
