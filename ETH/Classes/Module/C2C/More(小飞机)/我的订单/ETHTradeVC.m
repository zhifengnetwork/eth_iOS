//
//  ETHTradeVC.m
//  ETH
//
//  Created by weiming zhang on 2019/4/8.
//  Copyright © 2019 admin. All rights reserved.
//

#import "ETHTradeVC.h"
#import "ETHTradeCell.h"
@interface ETHTradeVC ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong)UITableView *tableView;
@end

@implementation ETHTradeVC
static NSString *const ETHTradeCellID = @"ETHTradeCellID";
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.tableView];
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.left.right.equalTo(self.view);
    }];
}
- (UITableView *)tableView{
    if (_tableView == nil) {
        _tableView = [[UITableView alloc]init];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.rowHeight = 110;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.backgroundColor = [UIColor clearColor];
        [_tableView registerClass:[ETHTradeCell class] forCellReuseIdentifier:ETHTradeCellID];
    }
    return _tableView;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ETHTradeCell *cell = [tableView dequeueReusableCellWithIdentifier:ETHTradeCellID forIndexPath:indexPath];
    if (_type == 0) {
        [cell setStatus:@"未交易"];
        if (indexPath.row == 1||indexPath.row ==2) {
            [cell settransaction:NO];
        }
    }else if (_type == 1) {
        if (indexPath.row == 1||indexPath.row ==2) {
            [cell settransaction:NO];
        }
        [cell setStatus:@"交易中"];
    }else if (_type == 2) {
        [cell setStatus:@"交易完成"];
    }else{
        [cell setStatus:@"交易失败"];
    }
    return cell;
}
@end
