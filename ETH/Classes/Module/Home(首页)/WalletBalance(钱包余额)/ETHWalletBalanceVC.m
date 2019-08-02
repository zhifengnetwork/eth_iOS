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
#import "http_wallet.h"
#import "SVProgressHUD.h"
#import "MJExtension.h"
#import "RefreshGifHeader.h"
#import "UserInfoModel.h"
#import "ETHChessCardVC.h"
#import "ETHC2C.h"
#import "ETHTransferAccountWMVC.h"

@interface ETHWalletBalanceVC ()<ETHDoubleThrowTableCellDelegate,ETHTwoDoubleThrowTableCellDelegate>

@property (nonatomic , strong)UserInfoModel *userInfo;

@property (nonatomic , assign)BOOL show1;
@property (nonatomic , assign)BOOL show2;
@end

@implementation ETHWalletBalanceVC

static NSString *const ETHWalletBalanceTableCellID = @"ETHWalletBalanceTableCellID";
static NSString *const ETHDoubleThrowTableCellID = @"ETHDoubleThrowTableCellID";
static NSString *const ETHTwoDoubleThrowTableCellID = @"ETHTwoDoubleThrowTableCellID";


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"钱包余额";
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
    
    self.navigationController.navigationBar.hidden = NO;
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
    //自定义刷新动画
    ZWeakSelf
    self.tableView.mj_header = [RefreshGifHeader headerWithRefreshingBlock:^{
        
        [weakSelf loadData];
    }];
    [self.tableView.mj_header beginRefreshing];
}

- (void)setType:(NSInteger)type{
    _type = type;
    [self.tableView reloadData];
}

-(void)loadData
{
        ZWeakSelf
        //总收益
        [http_wallet my_wallet:^(id responseObject)
         {
             [self.tableView.mj_header endRefreshing];
             [weakSelf showData:responseObject];
         } failure:^(NSError *error) {
             [self.tableView.mj_header endRefreshing];
             [SVProgressHUD showErrorWithStatus:error.domain];
         }];
}
-(void)showData:(id)responseObject
{
    if (kObjectIsEmpty(responseObject))
    {
        return;
    }

    self.userInfo = [UserInfoModel mj_objectWithKeyValues:responseObject];

    [self.tableView reloadData];
}
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    if (_type == 1) {
        return 1;
    }
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section==0)
    {
        if (self.show1)
        {
            return 2;
        }
    }
    else if (section==1)
    {
        if (self.show2)
        {
            return 2;
        }
    }
    
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = nil;
    
    ETHWalletBalanceTableCell* pcell = [tableView dequeueReusableCellWithIdentifier:ETHWalletBalanceTableCellID];
    pcell = [[ETHWalletBalanceTableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ETHWalletBalanceTableCellID];
    if (_type == 1) {//已锁户
        if (indexPath.row==0)
        {
            pcell.title = @"自由钱包";
            pcell.name = self.userInfo.member.credit2;
            cell = pcell;
        }
        else if (indexPath.row==1)
        {
            ETHTwoDoubleThrowTableCell* kcell = [tableView dequeueReusableCellWithIdentifier:ETHDoubleThrowTableCellID];
            kcell = [[ETHTwoDoubleThrowTableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ETHTwoDoubleThrowTableCellID];
            kcell.delegate = self;
            kcell.type = 1;
            cell = kcell;
        }
    }else if (_type == 2){//复投账号锁户
        
        if (indexPath.section==0)
        {
            if (indexPath.row==0)
            {
                pcell.title = @"复投账户";
                pcell.name = self.userInfo.member.credit4;
                cell = pcell;
            }
            else if (indexPath.row==1)
            {
                ETHDoubleThrowTableCell* kcell = [tableView dequeueReusableCellWithIdentifier:ETHDoubleThrowTableCellID];
                kcell = [[ETHDoubleThrowTableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ETHDoubleThrowTableCellID];
                kcell.delegate = self;
                kcell.type = 2;
                cell = kcell;
            }
        }
        else if (indexPath.section==1)
        {
            if (indexPath.row==0)
            {
                pcell.title = @"自由钱包";
                pcell.name = self.userInfo.member.credit2;
                cell = pcell;
            }
            else if (indexPath.row==1)
            {
                ETHTwoDoubleThrowTableCell* kcell = [tableView dequeueReusableCellWithIdentifier:ETHDoubleThrowTableCellID];
                kcell = [[ETHTwoDoubleThrowTableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ETHTwoDoubleThrowTableCellID];
                kcell.delegate = self;
                kcell.type = 2;
                cell = kcell;
            }
        }
        
    }else{
        //未锁户
        if (indexPath.section==0)
        {
            if (indexPath.row==0)
            {
                pcell.title = @"复投账户";
                pcell.name = self.userInfo.member.credit4;
                cell = pcell;
            }
            else if (indexPath.row==1)
            {
                ETHDoubleThrowTableCell* kcell = [tableView dequeueReusableCellWithIdentifier:ETHDoubleThrowTableCellID];
                kcell = [[ETHDoubleThrowTableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ETHDoubleThrowTableCellID];
                kcell.delegate = self;
                
                cell = kcell;
            }
        }
        else if (indexPath.section==1)
        {
            if (indexPath.row==0)
            {
                pcell.title = @"自由钱包";
                pcell.name = self.userInfo.member.credit2;
                cell = pcell;
            }
            else if (indexPath.row==1)
            {
                ETHTwoDoubleThrowTableCell* kcell = [tableView dequeueReusableCellWithIdentifier:ETHDoubleThrowTableCellID];
                kcell = [[ETHTwoDoubleThrowTableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ETHTwoDoubleThrowTableCellID];
                kcell.delegate = self;
                
                cell = kcell;
            }
        }
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
    else if (section==1)
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
    if (indexPath.section==0)
    {
        if (indexPath.row==0)
        {
            if (self.show1)
            {
                self.show1 = NO;
            }
            else
            {
                self.show1 = YES;
            }
        }
    }
    else if (indexPath.section==1)
    {
        if (indexPath.row==0)
        {
            if (self.show2)
            {
                self.show2 = NO;
            }
            else
            {
                self.show2 = YES;
            }
        }
    }
    
    [self.tableView reloadData];
}

//按钮被点击 1:一键复投 2:棋牌娱乐
- (void)ETHDoubleThrowTableCellDidClick:(int)type
{
    if (type==1)
    {
        //跳转到一键复投
        ETHDoubleThrowVC* vc = [[ETHDoubleThrowVC alloc]init];
        vc.type = @"0";
        [self.navigationController pushViewController:vc animated:YES];
       
    }
    else if (type==2)
    {
        //跳转到棋牌娱乐
        ETHChessCardVC* vc = [[ETHChessCardVC alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
    }
}

//按钮被点击 1:一键复投 2:提币3:C2C 4:棋牌娱乐 5:互转

- (void)ETHTwoDoubleThrowTableCellDidClick:(int)type
{
   
    
    
    if (type==1)
    {
        //跳转到一键复投
        ETHDoubleThrowVC* vc = [[ETHDoubleThrowVC alloc]init];
        vc.type = @"1";
        [self.navigationController pushViewController:vc animated:YES];
    }
    else if (type==2)
    {
        //跳转到提币
        ETHTransferAccountWMVC* vc = [[ETHTransferAccountWMVC alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
    }
    else if (type==3)
    {
        //跳转到C2C
        ETHC2C* vc = [[ETHC2C alloc]init];
        vc.name = @"vc";
        [self.navigationController pushViewController:vc animated:YES];
    }
    else if (type==4)
    {
        //跳转到棋牌娱乐
        ETHChessCardVC* vc = [[ETHChessCardVC alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
    }
    else if (type==5)
    {
        //跳转到互转
        ETHTransferAccountVC* vc = [[ETHTransferAccountVC alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
        
    }
}
@end
