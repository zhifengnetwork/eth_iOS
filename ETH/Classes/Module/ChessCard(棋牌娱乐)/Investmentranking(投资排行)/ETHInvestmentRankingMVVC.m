//
//  ETHInvestmentRankingMVVC.m
//  ETH
//
//  Created by weiming zhang on 2019/4/17.
//  Copyright © 2019 admin. All rights reserved.
//

#import "ETHInvestmentRankingMVVC.h"
#import "ETHTodayRankingVC.h"
@interface ETHInvestmentRankingMVVC ()
@property (nonatomic, strong)UIImageView *iconImageView;
@property (nonatomic, strong)UILabel *bgLabel;
@property (nonatomic, strong)ETHTodayRankingVC *todayVC;
@end

@implementation ETHInvestmentRankingMVVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"投资排行";
    self.view.backgroundColor = RGBColorHex(0xffffff);
    [self.view addSubview:self.iconImageView];
    [self.iconImageView addSubview:self.bgLabel];
    [_iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(self.view);
        make.height.mas_equalTo(180);
    }];
    [_bgLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.iconImageView).with.offset(80);
        make.left.equalTo(self.iconImageView).with.offset(17);
    }];
    
    
    UISegmentedControl* segment = [[UISegmentedControl alloc]initWithFrame:CGRectMake(0,185, LL_ScreenWidth, 30)];
    //在索引值为0的位置上插入一个标题为red的按钮，第三个参数为是否开启动画
    [segment insertSegmentWithTitle:@"今日投资排名" atIndex:0 animated:YES];
    [segment insertSegmentWithTitle:@"昨日投资数据" atIndex:1 animated:YES];
    [segment insertSegmentWithTitle:@"中奖名单" atIndex:2 animated:YES];
    
    //设置Segment的字体
    NSDictionary *dic = @{
                          //1.设置字体样式:例如黑体,和字体大小
                          NSFontAttributeName:[UIFont fontWithName:@"Arial" size:18],
                          //2.字体颜色
                          NSForegroundColorAttributeName:RGBColorHex(0xabb9d9)
                          };
    
    [segment setTitleTextAttributes:dic forState:UIControlStateNormal];
    
    //设置Segment选中的字体
    NSDictionary *dic2 = @{
                           //1.设置字体样式:例如黑体,和字体大小
                           NSFontAttributeName:[UIFont fontWithName:@"Arial" size:18],
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
    
    self.todayVC.view.hidden = NO;
}

-(void)segmentAction:(UISegmentedControl*)sender
{
    self.todayVC.view.hidden = YES;
    
    if (sender.selectedSegmentIndex==0)
    {
        //今日投资排名
        self.todayVC.view.hidden = NO;
    }
    //    else if (sender.selectedSegmentIndex==1)
    //    {
    //        //昨日投资数据
    //        self.recordVC.view.hidden = NO;
    //    }
    //    else if (sender.selectedSegmentIndex==2)
    //    {
    //        //中奖名单
    //        self.recordVC.view.hidden = NO;
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

- (UIImageView *)iconImageView{
    if (_iconImageView ==nil) {
        _iconImageView = [[UIImageView alloc]init];
        _iconImageView.image = [UIImage imageNamed:@"touzhiBg"];
    }return _iconImageView;
}

- (UILabel *)bgLabel{
    if (_bgLabel == nil) {
        _bgLabel = [[UILabel alloc]init];
        _bgLabel.font = [UIFont systemFontOfSize:18];
        _bgLabel.textColor = RGBColorHex(0xfcff06);
        _bgLabel.text = @"今日投资总额：20,922";
    }return _bgLabel;
}

-(ETHTodayRankingVC *)todayVC
{
    if (_todayVC==nil) {
        _todayVC = [[ETHTodayRankingVC alloc]init];
        [self addChildViewController:_todayVC];
        [self.view addSubview:_todayVC.view];
        [_todayVC.view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.view).with.offset(10);
            make.right.equalTo(self.view).with.offset(-10);
            make.top.mas_equalTo(220);
            make.bottom.equalTo(self.view);
        }];
    }
    
    return _todayVC;
}

@end
