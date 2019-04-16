//
//  ETHWalletBalanceWMVC.m
//  ZF
//
//  Created by admin on 2019/3/19.
//  Copyright © 2019 hyy. All rights reserved.
//

#import "ETHWalletBalanceWMVC.h"
#import "ETHWalletBalanceVC.h"
#import "ETHInvestmentRecordVC.h"
#import "ETHTransactionVC.h"


@interface ETHWalletBalanceWMVC ()

@property (nonatomic, strong) ETHWalletBalanceVC *walletBalanceVC;
@property (nonatomic, strong) ETHInvestmentRecordVC *recordVC;
@property (nonatomic, strong) ETHTransactionVC *c2cVC;

@end

@implementation ETHWalletBalanceWMVC


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"钱包余额";
    self.view.backgroundColor = RGBColorHex(0x080e2c);
    
    UISegmentedControl* segment = [[UISegmentedControl alloc]initWithFrame:CGRectMake(0, 10, LL_ScreenWidth, 30)];
    //在索引值为0的位置上插入一个标题为red的按钮，第三个参数为是否开启动画
    [segment insertSegmentWithTitle:@"钱包" atIndex:0 animated:YES];
    [segment insertSegmentWithTitle:@"提币记录" atIndex:1 animated:YES];
    [segment insertSegmentWithTitle:@"赚币记录" atIndex:2 animated:YES];
    [segment insertSegmentWithTitle:@"C2C记录" atIndex:3 animated:YES];
    
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
    
    //设置选中时的背景色
    [segment setBackgroundImage:[UIImage imageNamed:@"backGround"]
                       forState:UIControlStateSelected barMetrics:UIBarMetricsDefault];
    
    //设置标题和边框的颜色
    segment.tintColor = RGBColorHex(0xffffff);
    //设置初始选中值，默认是没有选中
    segment.selectedSegmentIndex = 0;
    //    self.view.backgroundColor = [UIColor magentaColor];
    //绑定事件
    [segment addTarget:self action:@selector(segmentAction:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:segment];
    
    self.walletBalanceVC.view.hidden = NO;
}

-(void)segmentAction:(UISegmentedControl*)sender
{
    self.walletBalanceVC.view.hidden = YES;
    self.recordVC.view.hidden = YES;
    self.c2cVC.view.hidden = YES;
    
    if (sender.selectedSegmentIndex==0)
    {
        //钱包
        self.walletBalanceVC.view.hidden = NO;
    }
    else if (sender.selectedSegmentIndex==1)
    {
        //提币记录
        self.recordVC.view.hidden = NO;
    }
    else if (sender.selectedSegmentIndex==2)
    {
        //赚币记录
        self.recordVC.view.hidden = NO;
    }
    else if (sender.selectedSegmentIndex==3)
    {
        //C2C记录
        self.c2cVC.view.hidden = NO;
    }
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


-(ETHWalletBalanceVC*)walletBalanceVC
{
    if (_walletBalanceVC==nil) {
        _walletBalanceVC = [[ETHWalletBalanceVC alloc]init];
        [self addChildViewController:_walletBalanceVC];
        [self.view addSubview:_walletBalanceVC.view];
        [_walletBalanceVC.view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.bottom.mas_equalTo(0);
            make.top.mas_equalTo(40);
        }];
    }
    
    return _walletBalanceVC;
}

-(ETHInvestmentRecordVC *)recordVC
{
    if (_recordVC==nil) {
        _recordVC = [[ETHInvestmentRecordVC alloc]init];
        [self addChildViewController:_recordVC];
        [self.view addSubview:_recordVC.view];
        [_recordVC.view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.bottom.mas_equalTo(0);
            make.top.mas_equalTo(40);
        }];
    }
    
    return _recordVC;
}

-(ETHTransactionVC *)c2cVC
{
    if (_c2cVC==nil) {
        _c2cVC = [[ETHTransactionVC alloc]init];
        [self addChildViewController:_c2cVC];
        [self.view addSubview:_c2cVC.view];
        [_c2cVC.view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.bottom.mas_equalTo(0);
            make.top.mas_equalTo(40);
        }];
    }
    
    return _c2cVC;
}

@end
