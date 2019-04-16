
//
//  ETHTodayEarningMVVC.m
//  ETH
//
//  Created by weiming zhang on 2019/4/13.
//  Copyright © 2019 admin. All rights reserved.
//

#import "ETHTodayEarningMVVC.h"
#import "ETHPromotionAwardVC.h"
#import "ETHInvestmentIncomeVC.h"

@interface ETHTodayEarningMVVC ()
@property (nonatomic, strong) ETHPromotionAwardVC *promotionAwardVC;
@property (nonatomic, strong) ETHInvestmentIncomeVC *incomeVC;
@end

@implementation ETHTodayEarningMVVC

- (void)viewDidLoad {
    [super viewDidLoad];
    if (_index == 0) {
        self.title = @"收益明细";
    }else{
        self.title = @"今日收益明细";
    }
    self.view.backgroundColor = RGBColorHex(0x080e2c);
    
    UISegmentedControl* segment = [[UISegmentedControl alloc]initWithFrame:CGRectMake(0,10, LL_ScreenWidth, 30)];
    //在索引值为0的位置上插入一个标题为red的按钮，第三个参数为是否开启动画
    [segment insertSegmentWithTitle:@"投资收益" atIndex:0 animated:YES];
    [segment insertSegmentWithTitle:@"直推奖" atIndex:1 animated:YES];
    [segment insertSegmentWithTitle:@"管理奖" atIndex:2 animated:YES];
    [segment insertSegmentWithTitle:@"领导奖" atIndex:3 animated:YES];
    
    //设置Segment的字体
    NSDictionary *dic = @{
                          //1.设置字体样式:例如黑体,和字体大小
                          NSFontAttributeName:[UIFont fontWithName:@"Arial" size:17],
                          //2.字体颜色
                          NSForegroundColorAttributeName:RGBColorHex(0xabb9d9)
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
    
    self.incomeVC.view.hidden = NO;
}

-(void)segmentAction:(UISegmentedControl*)sender
{
    self.promotionAwardVC.view.hidden = YES;
    self.incomeVC.view.hidden = YES;
    
    if (sender.selectedSegmentIndex==0)
    {
        //投资收益
        self.incomeVC.view.hidden = NO;
    }
    else if (sender.selectedSegmentIndex==1)
    {
        //直推奖
        self.promotionAwardVC.view.hidden = NO;
    }
    else if (sender.selectedSegmentIndex==2)
    {
//        //管理奖
//        self.recordVC.view.hidden = NO;
    }
    else if (sender.selectedSegmentIndex==3)
    {
//        //领导奖
//        self.c2cVC.view.hidden = NO;
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


-(ETHPromotionAwardVC*)promotionAwardVC
{
    if (_promotionAwardVC ==nil) {
        _promotionAwardVC = [[ETHPromotionAwardVC alloc]init];
        _promotionAwardVC.incomeType = self.incomeType;
        [self addChildViewController:_promotionAwardVC];
        [self.view addSubview:_promotionAwardVC.view];
        [_promotionAwardVC.view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.bottom.mas_equalTo(0);
            make.top.mas_equalTo(40);
        }];
    }
    
    return _promotionAwardVC;
}

-(ETHInvestmentIncomeVC *)incomeVC
{
    if (_incomeVC==nil) {
        _incomeVC = [[ETHInvestmentIncomeVC alloc]init];
        _incomeVC.incomeType = self.incomeType;
        [self addChildViewController:_incomeVC];
        [self.view addSubview:_incomeVC.view];
        [_incomeVC.view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.bottom.mas_equalTo(0);
            make.top.mas_equalTo(40);
        }];
    }
    
    return _incomeVC;
}

@end
