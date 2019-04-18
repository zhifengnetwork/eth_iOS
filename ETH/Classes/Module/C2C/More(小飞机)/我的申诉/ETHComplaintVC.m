//
//  ETHComplaintVC.m
//  ETH
//
//  Created by weiming zhang on 2019/4/5.
//  Copyright © 2019 admin. All rights reserved.
//

#import "ETHComplaintVC.h"
#import "ETHTitleView.h"
#import "ETHComplaintCell.h"
#import "ETHDetailComplaintVC.h"

@interface ETHComplaintVC ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong)ETHTitleView *titleView;
@property (nonatomic, strong)UIImageView *backImg;
@property (nonatomic, strong)UITableView *tableView;
@end

@implementation ETHComplaintVC
static NSString * const ETHComplaintCellID = @"ETHComplaintCellID";
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
        make.height.mas_equalTo(LL_StatusBarAndNavigationBarHeight +55);
    }];
    [_backImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleView.mas_bottom).with.offset(-60);
        make.left.right.bottom.equalTo(self.view);
    }];
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleView.mas_bottom).with.offset(3);
        make.left.right.bottom.equalTo(self.view);
    }];
    
}
- (UIView *)titleView{
    if (_titleView == nil) {
        _titleView = [[ETHTitleView alloc]init];
        [_titleView hideRightBtn:YES];
    }
    return _titleView;
}

- (UIImageView *)backImg{
    if (_backImg == nil) {
        _backImg = [[UIImageView alloc]init];
        self.backImg.image = [UIImage imageNamed:@"BG-R"];
    }
    return _backImg;
}

- (UITableView *)tableView{
    if (_tableView == nil) {
        _tableView = [[UITableView alloc]init];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.rowHeight = 47;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.backgroundColor = [UIColor clearColor];
        [_tableView registerClass:[ETHComplaintCell class] forCellReuseIdentifier:ETHComplaintCellID];
    }return _tableView;
}


#pragma mark--协议
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ETHComplaintCell *cell = [tableView dequeueReusableCellWithIdentifier:ETHComplaintCellID forIndexPath:indexPath];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    ETHDetailComplaintVC *vc = [[ETHDetailComplaintVC alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}
@end
