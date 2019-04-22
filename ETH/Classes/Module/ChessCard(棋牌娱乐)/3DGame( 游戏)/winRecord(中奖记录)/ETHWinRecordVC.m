//
//  ETHWinRecordVC.m
//  ETH
//
//  Created by weiming zhang on 2019/4/17.
//  Copyright © 2019 admin. All rights reserved.
//

#import "ETHWinRecordVC.h"
#import "ETHWinRecordCell.h"
#import "http_indexedit.h"
#import "SVProgressHUD.h"
#import "MJExtension.h"
#import "RefreshGifHeader.h"
#import "ETHBetRecordModel.h"

@interface ETHWinRecordVC ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong)UITableView *tableView;

@property (nonatomic , strong)ETHBetRecordListModel *listModel;
@end

@implementation ETHWinRecordVC
static NSString *const ETHWinRecordCellID = @"ETHWinRecordCellID";
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
    //中奖记录
    [http_indexedit winningrecordis:1 success:^(id responseObject)
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
        [_tableView registerClass:[ETHWinRecordCell class] forCellReuseIdentifier:ETHWinRecordCellID];
    }return _tableView;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.listModel.list.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ETHWinRecordCell *cell = [tableView dequeueReusableCellWithIdentifier:ETHWinRecordCellID forIndexPath:indexPath];
    ETHBetRecordModel *recordModel = [self.listModel.list objectAtIndex:indexPath.row];
    cell.recordModel = recordModel;
    return cell;
}
@end
