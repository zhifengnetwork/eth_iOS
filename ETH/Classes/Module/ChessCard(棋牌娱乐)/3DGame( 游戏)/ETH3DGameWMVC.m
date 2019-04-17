//
//  ETH3DGameWMVC.m
//  ETH
//
//  Created by admin on 2019/4/13.
//  Copyright © 2019 admin. All rights reserved.
//

#import "ETH3DGameWMVC.h"
#import "ETH3DGameVC.h"
#import "ETHWinRecordVC.h"
#import "ETHBetRecordVC.h"

@interface ETH3DGameWMVC ()

@property (nonatomic, strong) ETH3DGameVC *gameVC;
@property (nonatomic, strong) ETHWinRecordVC *winVC;
@property (nonatomic, strong) ETHBetRecordVC *betVC;
@end

@implementation ETH3DGameWMVC


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"3D游戏";
    self.view.backgroundColor = RGBColorHex(0xffffff);
    
    UISegmentedControl* segment = [[UISegmentedControl alloc]initWithFrame:CGRectMake(0, 0, LL_ScreenWidth, 30)];
    //在索引值为0的位置上插入一个标题为red的按钮，第三个参数为是否开启动画
    [segment insertSegmentWithTitle:@"3D下注" atIndex:0 animated:YES];
    [segment insertSegmentWithTitle:@"押注记录" atIndex:1 animated:YES];
    [segment insertSegmentWithTitle:@"中奖记录" atIndex:2 animated:YES];
    
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
    
    self.gameVC.view.hidden = NO;
}

-(void)segmentAction:(UISegmentedControl*)sender
{
    self.gameVC.view.hidden = YES;
    self.winVC.view.hidden = YES;
    self.betVC.view.hidden = YES;
    if (sender.selectedSegmentIndex==0)
    {
        //3D下注
        self.gameVC.view.hidden = NO;
    }
    else if (sender.selectedSegmentIndex==1)
    {
        //押注记录
        self.betVC.view.hidden = NO;
    }
    else if (sender.selectedSegmentIndex==2)
    {
        //中奖记录
        self.winVC.view.hidden = NO;
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


-(ETH3DGameVC*)gameVC
{
    if (_gameVC==nil) {
        _gameVC = [[ETH3DGameVC alloc]init];
        [self addChildViewController:_gameVC];
        [self.view addSubview:_gameVC.view];
        [_gameVC.view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.bottom.mas_equalTo(0);
            make.top.mas_equalTo(30);
        }];
    }
    
    return _gameVC;
}

- (ETHWinRecordVC *)winVC{
    if (_winVC == nil) {
        _winVC = [[ETHWinRecordVC alloc]init];
        [self addChildViewController:_winVC];
        [self.view addSubview:_winVC.view];
        [_winVC.view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.bottom.mas_equalTo(0);
            make.top.mas_equalTo(30);
        }];
    }
    
    return _winVC;
}

- (ETHBetRecordVC *)betVC{
    if (_betVC == nil) {
        _betVC = [[ETHBetRecordVC alloc]init];
        [self addChildViewController:_betVC];
        [self.view addSubview:_betVC.view];
        [_betVC.view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.bottom.mas_equalTo(0);
            make.top.mas_equalTo(30);
        }];
    }
    
    return _betVC;
}
@end
