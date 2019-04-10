//
//  ETHDoubleThrowVC.m
//  ETH
//
//  Created by admin on 2019/4/10.
//  Copyright © 2019 admin. All rights reserved.
//

#import "ETHDoubleThrowVC.h"
#import "ETHCurrentInvestmentTableCell.h"
#import "ETHAmountInvesTableCell.h"
#import "ETHPaymentTableCell.h"

@interface ETHDoubleThrowVC ()

@end

@implementation ETHDoubleThrowVC

static NSString *const ETHCurrentInvestmentTableCellID = @"ETHCurrentInvestmentTableCellID";
static NSString *const ETHAmountInvesTableCellID = @"ETHAmountInvesTableCellID";
static NSString *const ETHPaymentTableCellID = @"ETHPaymentTableCellID";


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"复投";
    [self setupTableView];
    
}

- (void)deleteButtonDidClick
{
    
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
    self.view.backgroundColor = RGBColorHex(0xffffff);
    self.tableView.estimatedRowHeight = 0;
    self.tableView.estimatedSectionHeaderHeight = 0;
    self.tableView.estimatedSectionFooterHeight = 0;
    self.tableView.backgroundColor = RGBColorHex(0xffffff);
    self.tableView.tableFooterView = [UIView new];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.keyboardDismissMode = UIScrollViewKeyboardDismissModeOnDrag;
    
    [self.tableView registerClass:[ETHCurrentInvestmentTableCell class] forCellReuseIdentifier:ETHCurrentInvestmentTableCellID];
    [self.tableView registerClass:[ETHAmountInvesTableCell class] forCellReuseIdentifier:ETHAmountInvesTableCellID];
    [self.tableView registerClass:[ETHPaymentTableCell class] forCellReuseIdentifier:ETHPaymentTableCellID];
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
    
    ETHCurrentInvestmentTableCell* scell = [tableView dequeueReusableCellWithIdentifier:ETHCurrentInvestmentTableCellID];
    scell = [[ETHCurrentInvestmentTableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ETHCurrentInvestmentTableCellID];
    
    if (indexPath.section==0)
    {
        scell.title = @"当前投资额：";
        scell.name = @"1001.00";
        
        cell = scell;
    }
    else if (indexPath.section==1)
    {
        scell.title = @"复投账户：";
        scell.name = @"0.2000";
        
        cell = scell;
    }
    else if (indexPath.section==2)
    {
        ETHAmountInvesTableCell* ocell = [tableView dequeueReusableCellWithIdentifier:ETHAmountInvesTableCellID];
        ocell = [[ ETHAmountInvesTableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier: ETHAmountInvesTableCellID];
        
        cell = ocell;
    }
    else if (indexPath.section==3)
    {
        ETHPaymentTableCell* pcell = [tableView dequeueReusableCellWithIdentifier:ETHPaymentTableCellID];
        pcell = [[ETHPaymentTableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ETHPaymentTableCellID];
        pcell.title = @"确定";
        
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
    if (indexPath.section==0)
    {
        //        ZFPersonalDataVC* vc = [[ZFPersonalDataVC alloc]init];
        //        [self.navigationController pushViewController:vc animated:YES];
    }
}


@end
