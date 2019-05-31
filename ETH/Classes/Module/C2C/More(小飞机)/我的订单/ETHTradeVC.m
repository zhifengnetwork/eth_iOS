//
//  ETHTradeVC.m
//  ETH
//
//  Created by weiming zhang on 2019/4/8.
//  Copyright © 2019 admin. All rights reserved.
//

#import "ETHTradeVC.h"
#import "ETHTradeCell.h"
#import "http_c2c.h"
#import "SVProgressHUD.h"
#import "MJExtension.h"
#import "RefreshGifHeader.h"
#import "ETHC2CModel.h"

@interface ETHTradeVC ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong)UITableView *tableView;

@property (nonatomic , strong)ETHC2CListModel *listModel;
@end

@implementation ETHTradeVC
static NSString *const ETHTradeCellID = @"ETHTradeCellID";
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.tableView];
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.left.right.equalTo(self.view);
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
    if (_type == 0) {
        ZWeakSelf  //stataus 0未交易 1交易中 2交易完成 3交易失败
        [http_c2c number_order:@"0" success:^(id responseObject)
         {
             [self.tableView.mj_header endRefreshing];
             [weakSelf showData:responseObject];
         } failure:^(NSError *error) {
             [self.tableView.mj_header endRefreshing];
             [SVProgressHUD showErrorWithStatus:error.domain];
         }];
    }else if (_type == 1){
        ZWeakSelf
        [http_c2c number_order:@"1" success:^(id responseObject)
         {
             [self.tableView.mj_header endRefreshing];
             [weakSelf showData:responseObject];
         } failure:^(NSError *error) {
             [self.tableView.mj_header endRefreshing];
             [SVProgressHUD showErrorWithStatus:error.domain];
         }];
    }else if (_type == 2){
        ZWeakSelf
        [http_c2c number_order:@"2" success:^(id responseObject)
         {
             [self.tableView.mj_header endRefreshing];
             [weakSelf showData:responseObject];
         } failure:^(NSError *error) {
             [self.tableView.mj_header endRefreshing];
             [SVProgressHUD showErrorWithStatus:error.domain];
         }];
    }else{
        ZWeakSelf
        [http_c2c number_order:@"3" success:^(id responseObject)
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
    
    self.listModel = [ETHC2CListModel mj_objectWithKeyValues:responseObject];
    
    [self.tableView reloadData];
}

- (UITableView *)tableView{
    if (_tableView == nil) {
        _tableView = [[UITableView alloc]init];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.rowHeight = 130;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.backgroundColor = [UIColor clearColor];
        [_tableView registerClass:[ETHTradeCell class] forCellReuseIdentifier:ETHTradeCellID];
    }
    return _tableView;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.listModel.list.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ETHTradeCell *cell = [tableView dequeueReusableCellWithIdentifier:ETHTradeCellID forIndexPath:indexPath];
    ETHC2CModel *model = [self.listModel.list objectAtIndex:indexPath.row];
    cell.model = model;
    if (_type == 0) {
        [cell setStatus:@"未交易"];
    }else if (_type == 1) {
        [cell setStatus:@"交易中"];
        [cell setCutDown:model.apple_time];
    }else if (_type == 2) {
        [cell setStatus:@"交易完成"];
    }else{
        [cell setStatus:@"交易失败"];
    }
    
    return cell;
}
@end
