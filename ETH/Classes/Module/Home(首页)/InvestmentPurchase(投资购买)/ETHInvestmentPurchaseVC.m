//
//  ETHInvestmentPurchaseVC.m
//  ETH
//
//  Created by admin on 2019/4/3.
//  Copyright © 2019 admin. All rights reserved.
//

#import "ETHInvestmentPurchaseVC.h"
#import "ETHInvestmentPurchaseTableCell.h"
#import "ETHPaymentTableCell.h"
#import "ETHDefinitePurchaseVC.h"
#import "http_user.h"
#import "SVProgressHUD.h"
#import "MJExtension.h"
#import "ETHTZModel.h"


@interface ETHInvestmentPurchaseVC ()<ETHInvestmentPurchaseTableCellDelegate>

@property (nonatomic, strong) ETHTZDataModel *tz;

@end

@implementation ETHInvestmentPurchaseVC

static NSString *const ETHInvestmentPurchaseTableCellID = @"ETHInvestmentPurchaseTableCellID";
static NSString *const ETHPaymentTableCellID = @"ETHPaymentTableCellID";


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"投资购买";
    [self setupTableView];
    [self loadData];
}

-(void)loadData
{
    ZWeakSelf
    [http_user payment:^(id responseObject)
     {
         [weakSelf showData:responseObject];
     } failure:^(NSError *error)
    {
         [SVProgressHUD showErrorWithStatus:error.domain];
     }];
}

-(void)showData:(id)responseObject
{
    if (kObjectIsEmpty(responseObject))
    {
        return;
    }
    
    self.tz = [ETHTZDataModel mj_objectWithKeyValues:responseObject];
    
    [self.tableView reloadData];
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
    
    [self.tableView registerClass:[ETHInvestmentPurchaseTableCell class] forCellReuseIdentifier:ETHInvestmentPurchaseTableCellID];
    [self.tableView registerClass:[ETHPaymentTableCell class] forCellReuseIdentifier:ETHPaymentTableCellID];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 5;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = nil;
    
    ETHInvestmentPurchaseTableCell* scell = [tableView dequeueReusableCellWithIdentifier:ETHInvestmentPurchaseTableCellID];
    scell = [[ETHInvestmentPurchaseTableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ETHInvestmentPurchaseTableCellID];
    scell.indexPath = indexPath;
    scell.delegate = self;
    if (indexPath.section==0)
    {
        scell.title = @"当前投资额：";
        scell.name = [NSString stringWithFormat:@"%.3f",self.tz.list.credit1.floatValue];
        scell.isInput = NO;
        cell = scell;
    }
    else if (indexPath.section==1)
    {
        scell.title = @"追加投资：";
        scell.isInput = YES;
        cell = scell;
    }
    else if (indexPath.section==2)
    {
        scell.title = @"账户投资上限：";
        scell.name = self.tz.list.bibi;
        scell.isInput = NO;
        cell = scell;
    }
    else if (indexPath.section==3)
    {
        scell.title = @"当前最多可投资：";
        scell.name = [NSString stringWithFormat:@"%.3f",self.tz.list.bibi.floatValue - self.tz.list.credit1.floatValue];
        scell.isInput = NO;
        cell = scell;
    }
    else if (indexPath.section==4)
    {
        ETHPaymentTableCell* pcell = [tableView dequeueReusableCellWithIdentifier:ETHPaymentTableCellID];
        pcell = [[ETHPaymentTableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ETHPaymentTableCellID];
        
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
    if (section==4)
    {
        return 30;
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
    if (indexPath.section==4)
    {
        ETHDefinitePurchaseVC* vc = [[ETHDefinitePurchaseVC alloc]init];
        vc.tz = self.tz;
        [self.navigationController pushViewController:vc animated:YES];
    }
}


//正在输入中
-(void)ETHInvestmentPurchaseTableCellInputing:(NSString*)text indexPath:(NSIndexPath*)indexPath
{
    self.tz.list.creditmy = text;
    NSLog(@"%@",text);
}


@end
