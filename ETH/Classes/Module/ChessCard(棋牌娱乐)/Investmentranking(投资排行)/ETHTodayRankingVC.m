//
//  ETHTodayRankingVC.m
//  ETH
//
//  Created by weiming zhang on 2019/4/17.
//  Copyright © 2019 admin. All rights reserved.
//

#import "ETHTodayRankingVC.h"
#import "ETHTodayRankingCell.h"

@interface ETHTodayRankingVC ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong)UILabel *rankLabel;
@property (nonatomic, strong)UILabel *idLabel;
@property (nonatomic, strong)UILabel *nameLabel;
@property (nonatomic, strong)UILabel *winProbabilitylLabel;
@property (nonatomic, strong)UILabel *todayInvestmentAmount;
@property (nonatomic, strong)UIView *lineView;
@property (nonatomic, strong)UITableView *tableView;
@end

@implementation ETHTodayRankingVC
static NSString *const ETHTodayRankingCellID = @"ETHTodayRankingCellID";
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.layer.cornerRadius = 3;
    self.view.backgroundColor = RGBColorHex(0x475065);
    [self setup];
}

- (void)setup{
    [self.view addSubview:self.rankLabel];
    [self.view addSubview:self.idLabel];
    [self.view addSubview:self.nameLabel];
    [self.view addSubview:self.winProbabilitylLabel];
    [self.view addSubview:self.todayInvestmentAmount];
    [self.view addSubview:self.lineView];
    [self.view addSubview:self.tableView];
    [_rankLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).with.offset(13);
        make.top.equalTo(self.view).with.offset(10);
    }];
    
    [_idLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.rankLabel.mas_right).with.offset(25);
        make.centerY.equalTo(self.rankLabel.mas_centerY);
    }];
    
    [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.idLabel.mas_right).with.offset(40);
        make.centerY.equalTo(self.rankLabel.mas_centerY);
    }];
    
    [_winProbabilitylLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.nameLabel.mas_right).with.offset(40);
        make.centerY.equalTo(self.rankLabel.mas_centerY);
    }];
    
    [_todayInvestmentAmount mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.winProbabilitylLabel.mas_right).with.offset(19.5);
        make.centerY.equalTo(self.rankLabel.mas_centerY);
    }];
    
    [_lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.todayInvestmentAmount.mas_bottom).with.offset(5);
        make.left.equalTo(self.view).with.offset(13);
        make.right.equalTo(self.view).with.offset(-13);
        make.height.mas_equalTo(1);
    }];
    
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.lineView.mas_bottom);
        make.left.right.bottom.equalTo(self.view);
    }];
}

- (UILabel *)rankLabel{
    if (_rankLabel == nil) {
        _rankLabel = [[UILabel alloc]init];
        _rankLabel.font = [UIFont systemFontOfSize:12];
        _rankLabel.textColor = [UIColor whiteColor];
        _rankLabel.text = @"排名";
    }return _rankLabel;
}

- (UILabel *)idLabel{
    if (_idLabel == nil) {
        _idLabel = [[UILabel alloc]init];
        _idLabel.font = [UIFont systemFontOfSize:12];
        _idLabel.textColor = [UIColor whiteColor];
        _idLabel.text = @"ID";
    }return _idLabel;
}

- (UILabel *)nameLabel{
    if (_nameLabel == nil) {
        _nameLabel = [[UILabel alloc]init];
        _nameLabel.font = [UIFont systemFontOfSize:12];
        _nameLabel.textColor = [UIColor whiteColor];
        _nameLabel.text = @"昵称";
    }return _nameLabel;
}

- (UILabel *)winProbabilitylLabel{
    if (_winProbabilitylLabel == nil) {
        _winProbabilitylLabel = [[UILabel alloc]init];
        _winProbabilitylLabel.font = [UIFont systemFontOfSize:12];
        _winProbabilitylLabel.textColor = [UIColor whiteColor];
        _winProbabilitylLabel.text = @"预计获奖";
    }return _winProbabilitylLabel;
}

- (UILabel *)todayInvestmentAmount{
    if (_todayInvestmentAmount == nil) {
        _todayInvestmentAmount = [[UILabel alloc]init];
        _todayInvestmentAmount.font = [UIFont systemFontOfSize:12];
        _todayInvestmentAmount.textColor = [UIColor whiteColor];
        _todayInvestmentAmount.text = @"今日投资金额(ETH)";
    }return _todayInvestmentAmount;
}

- (UIView *)lineView{
    if (_lineView == nil) {
        _lineView = [[UIView alloc]init];
        _lineView.backgroundColor = [UIColor whiteColor];
    }return _lineView;
}

- (UITableView *)tableView{
    if (_tableView == nil) {
        _tableView = [[UITableView alloc]init];
        _tableView.backgroundColor = [UIColor clearColor];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.rowHeight = 30;
        [_tableView registerClass:[ETHTodayRankingCell class] forCellReuseIdentifier:ETHTodayRankingCellID];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }return _tableView;
}

#pragma mark --协议
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ETHTodayRankingCell *cell = [tableView dequeueReusableCellWithIdentifier:ETHTodayRankingCellID forIndexPath:indexPath];
    return cell;
}



@end
