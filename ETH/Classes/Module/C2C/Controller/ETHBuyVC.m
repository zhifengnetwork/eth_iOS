//
//  ETHBuyVC.m
//  ETH
//
//  Created by weiming zhang on 2019/4/4.
//  Copyright © 2019 admin. All rights reserved.
//

#import "ETHBuyVC.h"
#import "ETHBuyTableViewCell.h"
#import "ETHTitleView.h"
@interface ETHBuyVC ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong)ETHTitleView *titleView;
@property (nonatomic, strong)UIImageView *backImg;
@property (nonatomic, strong)UITableView *tableView;
@property (nonatomic, strong)UIImageView *emptyImageView;
@property (nonatomic, strong)UILabel *emptyLabel;
@end

@implementation ETHBuyVC
static NSString *const ETHBuyTableViewCellID = @"ETHBuyTableViewCellID";

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setup];
}

- (void)setup{
    [self.view addSubview:self.titleView];
    [self.view addSubview:self.backImg];
    [self.view addSubview:self.tableView];
    [_titleView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(self.view);
        make.height.mas_equalTo(113);
    }];
    [_backImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleView.mas_bottom).with.offset(-49);
        make.left.right.bottom.equalTo(self.view);
    }];
    if (0) {
        [self.view addSubview:self.emptyImageView];
        [self.view addSubview:self.emptyLabel];
        [_emptyImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.titleView.mas_bottom).with.offset(150);
            make.centerX.equalTo(self.view.mas_centerX);
        }];
        [_emptyLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.emptyImageView.mas_bottom).with.offset(30);
            make.centerX.equalTo(self.view.mas_centerX);
        }];
    }else{
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.titleView.mas_bottom).with.offset(5);
            make.left.right.bottom.equalTo(self.view);
        }];
    }
}
- (UIView *)titleView{
    if (_titleView == nil) {
        _titleView = [[ETHTitleView alloc]init];
    }
    return _titleView;
}
- (UIImageView *)backImg{
    if (_backImg == nil) {
        _backImg = [[UIImageView alloc]init];
        if (_type ==0) {
            self.backImg.image = [UIImage imageNamed:@"BG2"];
        }else{
            self.backImg.image = [UIImage imageNamed:@"BG3"];
        }
        
    }
    return _backImg;
}
- (UIImageView *)emptyImageView{
    if (_emptyImageView ==nil) {
        _emptyImageView = [[UIImageView alloc]init];
        _emptyImageView.image = [UIImage imageNamed:@"nothing"];
    }
    return _emptyImageView;
}
- (UILabel *)emptyLabel{
    if (_emptyLabel == nil) {
        _emptyLabel = [[UILabel alloc]init];
        _emptyLabel.font = [UIFont boldSystemFontOfSize:14];
        _emptyLabel.textColor = RGBColorHex(0x656a82);
        _emptyLabel.text = @"暂时无任何记录！";
    }
    return _emptyLabel;
}
- (UITableView *)tableView{
    if (_tableView == nil) {
        _tableView = [[UITableView alloc]init];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.backgroundColor = [UIColor clearColor];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_tableView registerClass:[ETHBuyTableViewCell class] forCellReuseIdentifier:ETHBuyTableViewCellID];
        _tableView.rowHeight = 124;
    }
    return _tableView;
}
#pragma mark -- 协议
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 2;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ETHBuyTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ETHBuyTableViewCellID forIndexPath:indexPath];
    [cell setButton:_type];
    return cell;
}
@end
