//
//  ETHTransferAccountVC.m
//  ETH
//
//  Created by admin on 2019/4/11.
//  Copyright © 2019 admin. All rights reserved.
//

#import "ETHTransferAccountVC.h"
#import "ETHTransferTableCell.h"
#import "ETHCashWithdrAmountTableCell.h"
#import "ETHTransferTipsTableCell.h"
#import "ETHPaymentTableCell.h"

@interface ETHTransferAccountVC ()

@end

@implementation ETHTransferAccountVC

static NSString *const ETHTransferTableCellID = @"ETHTransferTableCellID";
static NSString *const ETHCashWithdrAmountTableCellID = @"ETHCashWithdrAmountTableCellID";
static NSString *const ETHPaymentTableCellID = @"ETHPaymentTableCellID";
static NSString *const ETHTransferTipsTableCellID = @"ETHTransferTipsTableCellID";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"转账";
    [self setupTableView];
    
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
    //自动计算高度
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 150;
    
    self.view.backgroundColor = RGBColorHex(0xffffff);
    self.tableView.estimatedRowHeight = 0;
    self.tableView.estimatedSectionHeaderHeight = 0;
    self.tableView.estimatedSectionFooterHeight = 0;
    self.tableView.backgroundColor = RGBColorHex(0xffffff);
    self.tableView.tableFooterView = [UIView new];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.keyboardDismissMode = UIScrollViewKeyboardDismissModeOnDrag;
    
    [self.tableView registerClass:[ETHTransferTableCell class] forCellReuseIdentifier:ETHTransferTableCellID];
    [self.tableView registerClass:[ETHCashWithdrAmountTableCell class] forCellReuseIdentifier:ETHCashWithdrAmountTableCellID];
    [self.tableView registerClass:[ETHPaymentTableCell class] forCellReuseIdentifier:ETHPaymentTableCellID];
    [self.tableView registerClass:[ETHTransferTipsTableCell class] forCellReuseIdentifier:ETHTransferTipsTableCellID];
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
    
    if (indexPath.section==0)
    {
        ETHTransferTableCell* scell = [tableView dequeueReusableCellWithIdentifier:ETHTransferTableCellID];
        scell = [[ETHTransferTableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ETHTransferTableCellID];
        
        cell = scell;
    }
    else if (indexPath.section==1)
    {
        ETHCashWithdrAmountTableCell* ocell = [tableView dequeueReusableCellWithIdentifier:ETHCashWithdrAmountTableCellID];
        ocell = [[ ETHCashWithdrAmountTableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier: ETHCashWithdrAmountTableCellID];
        
        cell = ocell;
    }
    else if (indexPath.section==2)
    {
        ETHPaymentTableCell* pcell = [tableView dequeueReusableCellWithIdentifier:ETHPaymentTableCellID];
        pcell = [[ETHPaymentTableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ETHPaymentTableCellID];
        pcell.title = @"确定转账";
        
        cell = pcell;
    }
    else if (indexPath.section==3)
    {
        ETHTransferTipsTableCell* hcell = [tableView dequeueReusableCellWithIdentifier:ETHTransferTipsTableCellID];
        hcell = [[ETHTransferTipsTableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ETHTransferTipsTableCellID];
        
        cell = hcell;
    }
    
    return cell;
}


//每行的高度是多少
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section==0)
    {
        return 30;
    }
    else if (indexPath.section==1)
    {
        return 195;
    }
    return 40;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section==2) {
        return 40;
    }
    else if (section==3)
    {
        return 5;
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
    if (indexPath.section==0)
    {
        //        ZFPersonalDataVC* vc = [[ZFPersonalDataVC alloc]init];
        //        [self.navigationController pushViewController:vc animated:YES];
    }
}

@end
