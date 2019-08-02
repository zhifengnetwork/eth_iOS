//
//  ETHInvestmentIncomeVC.m
//  ETH
//
//  Created by weiming zhang on 2019/4/13.
//  Copyright © 2019 admin. All rights reserved.
//

#import "ETHInvestmentIncomeVC.h"
#import "ETHInvestmentIncomeCell.h"
#import "http_index.h"
#import "SVProgressHUD.h"
#import "MJExtension.h"
#import "RefreshGifHeader.h"
#import "ETHIncomeModel.h"

@interface ETHInvestmentIncomeVC ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong)UITableView *tableView;
@property (nonatomic, strong)UIView *titleView;
@property (nonatomic, strong)UILabel *titleLabel;

@property (nonatomic , strong)ETHIncomeListModel *listModel;

@end

@implementation ETHInvestmentIncomeVC
static NSString *const ETHInvestmentIncomeCellID = @"ETHInvestmentIncomeCellID";
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setup];
}

- (void)setup{
    [self.view addSubview:self.tableView];
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.bottom.equalTo(self.view);
    }];
    UIView *headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, LL_ScreenWidth, 100)];
    self.tableView.tableHeaderView = headerView;
    [headerView addSubview:self.titleView];
    [_titleView addSubview:self.titleLabel];
    [_titleView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.equalTo(headerView).with.offset(10);
        make.right.equalTo(headerView).with.offset(-10);
        make.bottom.equalTo(headerView);
    }];
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.titleView.mas_centerX);
        make.centerY.equalTo(self.titleView.mas_centerY);
    }];
    
    //自定义刷新动画
    ZWeakSelf
    self.tableView.mj_header = [RefreshGifHeader headerWithRefreshingBlock:^{
        
        [weakSelf loadData];
    }];
    [self.tableView.mj_header beginRefreshing];
    
}

-(void)loadData
{
    if (self.incomeType.intValue==1)
    {
        ZWeakSelf
        //总收益
        [http_index income_record:@"4" success:^(id responseObject)
         {
             [self.tableView.mj_header endRefreshing];
             [weakSelf showData:responseObject];
         } failure:^(NSError *error) {
             [self.tableView.mj_header endRefreshing];
             [SVProgressHUD showErrorWithStatus:error.domain];
         }];
        
    }
    else if (self.incomeType.intValue==2)
    {
        ZWeakSelf
        //今日收益 
        [http_index today_record:@"4" success:^(id responseObject)
         {
             [self.tableView.mj_header endRefreshing];
             [weakSelf showData:responseObject];
         } failure:^(NSError *error) {
             [self.tableView.mj_header endRefreshing];
             [SVProgressHUD showErrorWithStatus:error.domain];
         }];
    }
    
}

-(void)showData:(id)responseObject
{
    if (kObjectIsEmpty(responseObject))
    {
        return;
    }
    
    self.listModel = [ETHIncomeListModel mj_objectWithKeyValues:responseObject];
    
    self.titleLabel.text = [NSString stringWithFormat:@"收益总额：%.6f",self.listModel.money.floatValue];
    
    [self.tableView reloadData];
}


- (UITableView *)tableView{
    if (_tableView == nil) {
        _tableView = [[UITableView alloc]init];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.rowHeight = 78;
        _tableView.backgroundColor = [UIColor clearColor];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_tableView registerClass:[ETHInvestmentIncomeCell class] forCellReuseIdentifier:ETHInvestmentIncomeCellID];
    }return _tableView;
}
- (UIView *)titleView{
    if (_titleView == nil) {
        _titleView = [[UIView alloc]init];
        _titleView. backgroundColor = RGBColorHex(0x475065);
        _titleView.layer.cornerRadius = 3;
    }return _titleView;
}
- (UILabel *)titleLabel{
    if (_titleLabel == nil) {
        _titleLabel = [[UILabel alloc]init];
        _titleLabel.font = [UIFont systemFontOfSize:17];
        _titleLabel.textColor = [UIColor whiteColor];
        _titleLabel.text = @"收益总额：";
    }return _titleLabel;
}

#pragma mark -- 协议
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.listModel.list.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ETHInvestmentIncomeCell *cell = [tableView dequeueReusableCellWithIdentifier:ETHInvestmentIncomeCellID forIndexPath:indexPath];
    ETHIncomeModel *incomeModel = [self.listModel.list objectAtIndex:indexPath.section];
    cell.incomeModel = incomeModel;
    
    return cell;
}
@end
