//
//  ETHWalletBalanceVC.m
//  ZF
//
//  Created by admin on 2019/3/19.
//  Copyright © 2019 hyy. All rights reserved.
//

#import "ETHWalletBalanceVC.h"
#import "ETHWalletBalanceTableCell.h"
#import "ETHDoubleThrowTableCell.h"
#import "ETHTwoDoubleThrowTableCell.h"
#import "ETHDoubleThrowVC.h"
#import "ETHTransferAccountVC.h"
#import "ETHCashWithdrawaVC.h"
#import "ETHWalletETHVC.h"

@interface ETHWalletBalanceVC ()<ETHDoubleThrowTableCellDelegate,ETHTwoDoubleThrowTableCellDelegate>

@end

@implementation ETHWalletBalanceVC

static NSString *const ETHWalletBalanceTableCellID = @"ETHWalletBalanceTableCellID";
static NSString *const ETHDoubleThrowTableCellID = @"ETHDoubleThrowTableCellID";
static NSString *const ETHTwoDoubleThrowTableCellID = @"ETHTwoDoubleThrowTableCellID";


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"钱包余额";
    [self setupTableView];
    
//    UISegmentedControl* segment = [[UISegmentedControl alloc]initWithFrame:CGRectMake(10, 30, 200, 30)];
//    //在索引值为0的位置上插入一个标题为red的按钮，第三个参数为是否开启动画
//    [segment insertSegmentWithTitle:@"钱包" atIndex:0 animated:YES];
//    [segment insertSegmentWithTitle:@"提币记录" atIndex:1 animated:YES];
//    [segment insertSegmentWithTitle:@"赚币记录" atIndex:2 animated:YES];
//    [segment insertSegmentWithTitle:@"C2C记录" atIndex:3 animated:YES];
//
//    //设置Segment的字体
//    NSDictionary *dic = @{
//                          //1.设置字体样式:例如黑体,和字体大小
//                          NSFontAttributeName:[UIFont fontWithName:@"Arial" size:17],
//                          //2.字体颜色
//                          NSForegroundColorAttributeName:RGBColorHex(0x7685a6)
//                          };
//
//    [segment setTitleTextAttributes:dic forState:UIControlStateNormal];
//
//    //设置Segment选中的字体
//    NSDictionary *dic2 = @{
//                           //1.设置字体样式:例如黑体,和字体大小
//                           NSFontAttributeName:[UIFont fontWithName:@"Arial" size:17],
//                           //2.字体颜色
//                           NSForegroundColorAttributeName:RGBColorHex(0xffffff)
//                           };
//
//    [segment setTitleTextAttributes:dic2 forState:UIControlStateSelected];
//
//    //设置未选中时的背景色
//    [segment setBackgroundImage:[UIImage imageNamed:@"backGr"]
//                       forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
//
//    //设置选中时的背景色
//    [segment setBackgroundImage:[UIImage imageNamed:@"backGround"]
//                       forState:UIControlStateSelected barMetrics:UIBarMetricsDefault];
//
//    //设置标题和边框的颜色
//    segment.tintColor = RGBColorHex(0xffffff);
//    //设置初始选中值，默认是没有选中
//    segment.selectedSegmentIndex = 0;
////    self.view.backgroundColor = [UIColor magentaColor];
//    //绑定事件
//    [segment addTarget:self action:@selector(segmentAction:) forControlEvents:UIControlEventValueChanged];
//    [self.view addSubview:segment];
//
//
//    NSArray* array = @[@"钱包",@"提币记录",@"赚币记录",@"C2C记录"];
//    UISegmentedControl* segment1 = [[UISegmentedControl alloc]initWithItems:array];
//    //设置位置和大小
//    segment1.frame = CGRectMake(0, 0, LL_ScreenWidth, 40);
//    [self.view addSubview:segment1];
//
//    self.tableView.tableHeaderView = segment;
//
//    //删除索引为0的按钮
//    [segment1 removeSegmentAtIndex:0 animated:YES];
//
//    //删除所有按钮
//    [segment1 removeAllSegments];
    
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
    self.tableView.backgroundColor = RGBColorHex(0x080e2c);
    self.tableView.tableFooterView = [UIView new];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.alwaysBounceVertical=NO;
    
    [self.tableView registerClass:[ETHWalletBalanceTableCell class] forCellReuseIdentifier:ETHWalletBalanceTableCellID];
    [self.tableView registerClass:[ETHDoubleThrowTableCell class] forCellReuseIdentifier:ETHDoubleThrowTableCellID];
    [self.tableView registerClass:[ETHTwoDoubleThrowTableCell class] forCellReuseIdentifier:ETHTwoDoubleThrowTableCellID];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = nil;
    
    ETHWalletBalanceTableCell* pcell = [tableView dequeueReusableCellWithIdentifier:ETHWalletBalanceTableCellID];
    pcell = [[ETHWalletBalanceTableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ETHWalletBalanceTableCellID];
    
    if (indexPath.section==0)
    {
        pcell.title = @"复投账户";
        pcell.name = @"0.0001";
        
        cell = pcell;
    }
    else if (indexPath.section==1)
    {
        ETHDoubleThrowTableCell* kcell = [tableView dequeueReusableCellWithIdentifier:ETHDoubleThrowTableCellID];
        kcell = [[ETHDoubleThrowTableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ETHDoubleThrowTableCellID];
        kcell.delegate = self;
        
        cell = kcell;
    }
    else if (indexPath.section==2)
    {
        pcell.title = @"自由钱包";
        pcell.name = @"568299.00";
        
        cell = pcell;
    }
    else if (indexPath.section==3)
    {
        ETHTwoDoubleThrowTableCell* kcell = [tableView dequeueReusableCellWithIdentifier:ETHDoubleThrowTableCellID];
        kcell = [[ETHTwoDoubleThrowTableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ETHTwoDoubleThrowTableCellID];
        kcell.delegate = self;
        
        cell = kcell;
    }
    
    return cell;
}


//每行的高度是多少
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section==0)
    {
        return 32;
    }
    else if (section==2)
    {
        return 12;
    }
    return 0;
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

//按钮被点击 1:一键复投 2:棋牌娱乐
- (void)ETHDoubleThrowTableCellDidClick:(int)type
{
    if (type==1)
    {
        //跳转到一键复投
        ETHDoubleThrowVC* vc = [[ETHDoubleThrowVC alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
    }
    else if (type==2)
    {
        
    }
}

//按钮被点击 1:一键复投 2:提现 3:C2C 4:棋牌娱乐 5:互转
- (void)ETHTwoDoubleThrowTableCellDidClick:(int)type
{
    if (type==1)
    {
        //跳转到一键复投
        ETHDoubleThrowVC* vc = [[ETHDoubleThrowVC alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
    }
    else if (type==2)
    {
        ETHWalletETHVC* vc = [[ETHWalletETHVC alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
    }
    else if (type==2)
    {
        
    }
    else if (type==3)
    {
        
    }
    else if (type==4)
    {
        
    }
    else if (type==5)
    {
        ETHTransferAccountVC* vc = [[ETHTransferAccountVC alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
    }
}
@end
