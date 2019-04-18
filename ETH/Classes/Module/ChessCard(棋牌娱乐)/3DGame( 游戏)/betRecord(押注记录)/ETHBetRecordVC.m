//
//  ETHBetRecordVC.m
//  ETH
//
//  Created by weiming zhang on 2019/4/17.
//  Copyright © 2019 admin. All rights reserved.
//
#import "ETHBetRecordVC.h"
#import "ETHBetRecordCell.h"
#import "http_ indexedit.h"
#import "SVProgressHUD.h"
#import "MJExtension.h"
#import "RefreshGifHeader.h"
#import "ETHBetRecordModel.h"

@interface ETHBetRecordVC ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong)UITableView *tableView;

@property (nonatomic , strong)ETHBetRecordListModel *listModel;
@end

@implementation ETHBetRecordVC
static NSString *const ETHBetRecordCellID = @"ETHBetRecordCellID";
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
        ZWeakSelf
        //押注记录
        [http__indexedit stakejiluis:1 success:^(id responseObject)
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
    
    self.listModel = [ETHBetRecordListModel mj_objectWithKeyValues:responseObject];
    
    [self.tableView reloadData];
}

- (UITableView *)tableView{
    if (_tableView == nil) {
        _tableView = [[UITableView alloc]init];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.rowHeight = 79;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_tableView registerClass:[ETHBetRecordCell class] forCellReuseIdentifier:ETHBetRecordCellID];
    }return _tableView;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.listModel.list.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ETHBetRecordCell *cell = [tableView dequeueReusableCellWithIdentifier:ETHBetRecordCellID forIndexPath:indexPath];
    ETHBetRecordModel *recordModel = [self.listModel.list objectAtIndex:indexPath.row];
    
    cell.recordModel = recordModel;

    return cell;
}
@end
