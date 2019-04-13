//
//  ETHInvestmentIncomeVC.m
//  ETH
//
//  Created by weiming zhang on 2019/4/13.
//  Copyright © 2019 admin. All rights reserved.
//

#import "ETHInvestmentIncomeVC.h"
#import "ETHInvestmentIncomeCell.h"
@interface ETHInvestmentIncomeVC ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong)UITableView *tableView;
@property (nonatomic, strong)UIView *titleView;
@property (nonatomic, strong)UILabel *titleLabel;
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
        _titleLabel.text = @"收益总额：68.987635";
    }return _titleLabel;
}
#pragma mark -- 协议
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 2;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ETHInvestmentIncomeCell *cell = [tableView dequeueReusableCellWithIdentifier:ETHInvestmentIncomeCellID forIndexPath:indexPath];
    return cell;
}
@end
