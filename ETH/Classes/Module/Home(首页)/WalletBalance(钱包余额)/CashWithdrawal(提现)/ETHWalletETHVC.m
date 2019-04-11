//
//  ETHWalletETHVC.m
//  ETH
//
//  Created by admin on 2019/4/11.
//  Copyright © 2019 admin. All rights reserved.
//

#import "ETHWalletETHVC.h"
#import "ETHWalletETHTableCell.h"
#import "ETHPaymentTableCell.h"

@interface ETHWalletETHVC ()

@end

@implementation ETHWalletETHVC

static NSString *const ETHWalletETHTableCellID = @"ETHWalletETHTableCellID";
static NSString *const ETHPaymentTableCellID = @"ETHPaymentTableCellID";


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"提现";
    [self setupTableView];
    
    UISegmentedControl* segment = [[UISegmentedControl alloc]initWithFrame:CGRectMake(10, 30, 200, 30)];
    //在索引值为0的位置上插入一个标题为red的按钮，第三个参数为是否开启动画
    [segment insertSegmentWithTitle:@"ETH提现" atIndex:0 animated:YES];
    [segment insertSegmentWithTitle:@"复投账户" atIndex:1 animated:YES];
    
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
    
    
    NSArray* array = @[@"ETH提现",@"复投账户"];
    UISegmentedControl* segment1 = [[UISegmentedControl alloc]initWithItems:array];
    //设置位置和大小
    segment1.frame = CGRectMake(0, 0, LL_ScreenWidth, 40);
    [self.view addSubview:segment1];
    
    self.tableView.tableHeaderView = segment;
    
    //删除索引为0的按钮
    [segment1 removeSegmentAtIndex:0 animated:YES];
    
    //删除所有按钮
    [segment1 removeAllSegments];
    
}

-(void)segmentAction:(UISegmentedControl*)sender
{
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

- (void)setupTableView
{
    self.tableView.estimatedRowHeight = 0;
    self.tableView.estimatedSectionHeaderHeight = 0;
    self.tableView.estimatedSectionFooterHeight = 0;
    self.tableView.backgroundColor = RGBColorHex(0xffffff);
    self.tableView.tableFooterView = [UIView new];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.alwaysBounceVertical=NO;
    
    [self.tableView registerClass:[ETHWalletETHTableCell class] forCellReuseIdentifier:ETHWalletETHTableCellID];
    [self.tableView registerClass:[ETHPaymentTableCell class] forCellReuseIdentifier:ETHPaymentTableCellID];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = nil;
    
    if (indexPath.section==0)
    {
        ETHWalletETHTableCell* pcell = [tableView dequeueReusableCellWithIdentifier:ETHWalletETHTableCellID];
        pcell = [[ETHWalletETHTableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ETHWalletETHTableCellID];
        
        cell = pcell;
    }
    else if (indexPath.section==1)
    {
        ETHPaymentTableCell* ocell = [tableView dequeueReusableCellWithIdentifier:ETHPaymentTableCellID];
        ocell = [[ETHPaymentTableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ETHPaymentTableCellID];
        ocell.title = @"提现";
        cell = ocell;
    }
    
    return cell;
}


//每行的高度是多少
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section==0) {
        return 180;
    }
    return 40;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section==1) {
        return 40;
    }
    return 10;
}


- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView* view = [[UIView alloc]init];
    view.backgroundColor = [UIColor clearColor];
    return view;
}

#pragma mark - TableViewDelegate
//点击了哪个cell
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //    if (indexPath.section==0)
    //    {
    //        ZFPersonalDataVC* vc = [[ZFPersonalDataVC alloc]init];
    //        [self.navigationController pushViewController:vc animated:YES];
    //    }
    //    else if (indexPath.section==1)
    //    {
    //        if (indexPath.row==0)
    //        {
    //            ZFAddressManagementVC* vc = [[ZFAddressManagementVC alloc]init];
    //            [self.navigationController pushViewController:vc animated:YES];
    //        }
    //
    //    }
}


@end
