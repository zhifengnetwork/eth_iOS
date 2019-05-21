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
#import "http_wallet.h"
#import "SVProgressHUD.h"
#import "MJExtension.h"
#import "ETHTZModel.h"

@interface ETHDoubleThrowVC ()<ETHAmountInvesTableCellDelegate>

@property (nonatomic, strong) ETHTZModel *tz;

@end

@implementation ETHDoubleThrowVC

static NSString *const ETHCurrentInvestmentTableCellID = @"ETHCurrentInvestmentTableCellID";
static NSString *const ETHAmountInvesTableCellID = @"ETHAmountInvesTableCellID";
static NSString *const ETHPaymentTableCellID = @"ETHPaymentTableCellID";


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"复投";
    [self setupTableView];
    [self loadData];
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

-(void)loadData
{
    ZWeakSelf
    [http_wallet fotou_info:^(id responseObject)  {
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
    
    self.tz = [ETHTZModel mj_objectWithKeyValues:responseObject];
    
    [self.tableView reloadData];
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
        scell.name = self.tz.credit1;
        
        cell = scell;
    }
    else if (indexPath.section==1)
    {
        if (self.type.intValue==0)
        {
            scell.title = @"复投账户：";
            scell.name = self.tz.credit4;
        }
        else
        {
            scell.title = @"自由钱包：";
            scell.name = self.tz.credit2;
        }
        
        
        cell = scell;
    }
    else if (indexPath.section==2)
    {
        ETHAmountInvesTableCell* ocell = [tableView dequeueReusableCellWithIdentifier:ETHAmountInvesTableCellID];
        ocell = [[ ETHAmountInvesTableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier: ETHAmountInvesTableCellID];
        ocell.delegate = self;
        
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
    if (section==3) {
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
    if (indexPath.section==3)
    {
        [self loadData2];
    }
}


-(void)loadData2
{
    ETHAmountInvesTableCell* xcell = [self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:2]];
    if (xcell)
    {
        self.tz.creditmy = [xcell getAmountText];
    }
    
    ZWeakSelf
    NSString* str = nil;
    if (self.type.intValue==0)
    {
        str = @"4";
    }
    else
    {
        str = @"2";
    }
    [http_wallet yijianfutou:str money:self.tz.creditmy success:^(id responseObject)  {
        if (self.tz.creditmy.integerValue == 0) {
            [SVProgressHUD showErrorWithStatus:@"复投金额不能为0"];
        }else{
            [weakSelf showData2:responseObject];
        }
        
    } failure:^(NSError *error)
    {
        [SVProgressHUD showErrorWithStatus:error.domain];
    }];
}

-(void)showData2:(id)responseObject
{
    [SVProgressHUD showSuccessWithStatus:@"一键复投成功"];
    [self.navigationController popViewControllerAnimated:YES];
}


//正在输入中
-(void)ETHAmountInvesTableCellInputing:(NSString*)text indexPath:(NSIndexPath*)indexPath
{
    self.tz.creditmy = text;
}



@end
