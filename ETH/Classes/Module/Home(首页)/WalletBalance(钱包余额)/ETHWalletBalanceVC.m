//
//  ETHWalletBalanceVC.m
//  ZF
//
//  Created by admin on 2019/3/19.
//  Copyright © 2019 hyy. All rights reserved.
//

#import "ETHWalletBalanceVC.h"
#import "ETHWalletBalanceTableCell.h"

@interface ETHWalletBalanceVC ()

@end

@implementation ETHWalletBalanceVC

static NSString *const ETHWalletBalanceTableCellID = @"ETHWalletBalanceTableCellID";


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"钱包余额";
    [self setupTableView];
    
    UISegmentedControl* segment = [[UISegmentedControl alloc]initWithFrame:CGRectMake(10, 30, 200, 30)];
    //在索引值为0的位置上插入一个标题为red的按钮，第三个参数为是否开启动画
    [segment insertSegmentWithTitle:@"钱包" atIndex:0 animated:YES];
    [segment insertSegmentWithTitle:@"提币记录" atIndex:1 animated:YES];
    [segment insertSegmentWithTitle:@"赚币记录" atIndex:2 animated:YES];
    [segment insertSegmentWithTitle:@"C2C记录" atIndex:3 animated:YES];

    //设置默认字体颜色
    NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:RGBColorHex(0xabb9d9),UITextAttributeTextColor,nil];
    [segment  setTitleTextAttributes:dic forState:UIControlStateNormal];

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
    
    
    NSArray* array = @[@"钱包",@"提币记录",@"赚币记录",@"C2C记录"];
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
    
    [self.tableView registerClass:[ETHWalletBalanceTableCell class] forCellReuseIdentifier:ETHWalletBalanceTableCellID];
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
        pcell.title = @"自由钱包";
        pcell.name = @"568299.00";
        
        cell = pcell;
    }
    
    return cell;
}


//每行的高度是多少
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 40;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
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
