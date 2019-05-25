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
#import "http_wallet.h"
#import "SVProgressHUD.h"
#import "MJExtension.h"
#import "ETHTZModel.h"
#import "ETHMyWalletVC.h"
#import "UserInfoModel.h"
#import "http_wallet.h"


@interface ETHWalletETHVC ()<ETHWalletETHTableCellDelegate>

@property (nonatomic, strong) ETHTZDataModel *tz;
@property (nonatomic, strong) NSString *tx;

@property (nonatomic , strong)UserInfoModel *userInfo;

@end

@implementation ETHWalletETHVC

static NSString *const ETHWalletETHTableCellID = @"ETHWalletETHTableCellID";
static NSString *const ETHPaymentTableCellID = @"ETHPaymentTableCellID";


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"提现";
    [self setupTableView];
    [self loadDatay];
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
        pcell.credit = self.userInfo.member.credit2;
        pcell.delegate = self;
        cell = pcell;
    }
    else if (indexPath.section==1)
    {
        ETHPaymentTableCell* ocell = [tableView dequeueReusableCellWithIdentifier:ETHPaymentTableCellID];
        ocell = [[ETHPaymentTableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ETHPaymentTableCellID];
        ocell.title = @"提币";
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
        if (indexPath.section==0)
        {
//            ZFPersonalDataVC* vc = [[ZFPersonalDataVC alloc]init];
//            [self.navigationController pushViewController:vc animated:YES];
        }
        else if (indexPath.section==1)
        {
            [self loadData];
        }
}

-(void)loadData
{
    ZWeakSelf
    [http_wallet my_wallet:self.tx success:^(id responseObject) {
        [weakSelf showData:responseObject];
    } failure:^(NSError *error)
     {
         if ([error.domain isEqualToString:@"请完善钱包信息!"])
         {
             ETHMyWalletVC* vc = [[ETHMyWalletVC alloc]init];
             [weakSelf.navigationController pushViewController:vc animated:YES];
         }
         else
         {
            [SVProgressHUD showErrorWithStatus:error.domain];
         }
         
     }];
}

-(void)showData:(id)responseObject
{
    [SVProgressHUD showSuccessWithStatus:@"提币成功"];
    [self.navigationController popViewControllerAnimated:YES];
}


//正在输入中
-(void)ETHWalletETHTableCellInputing:(NSString*)text indexPath:(NSIndexPath*)indexPath
{
    self.tx = text;
    NSLog(@"%@",text);
}


-(void)loadDatay
{
    ZWeakSelf
    //总收益
    [http_wallet my_wallet:^(id responseObject)
     {
         [weakSelf showDatay:responseObject];
     } failure:^(NSError *error) {
         [SVProgressHUD showErrorWithStatus:error.domain];
     }];
}
-(void)showDatay:(id)responseObject
{
    if (kObjectIsEmpty(responseObject))
    {
        return;
    }
    
    self.userInfo = [UserInfoModel mj_objectWithKeyValues:responseObject];
    
    [self.tableView reloadData];
}


@end
