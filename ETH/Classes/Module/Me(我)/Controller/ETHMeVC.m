//
//  ETHMeVC.m
//  ETH
//
//  Created by admin on 2019/4/3.
//  Copyright © 2019 admin. All rights reserved.
//

#import "ETHMeVC.h"
#import "ETHHeaderView.h"
#import "ETHMeTableViewCell.h"
#import "ETHPayManageVC.h"
#import "ViewController.h"
#import "ETHMyWalletVC.h"
#import "ETHAnnouncementVC.h"
@interface ETHMeVC ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong)UITableView *tableView;
@property (nonatomic, strong)ETHHeaderView *headerView;
@property (nonatomic, strong)UIButton *logoutButton;
@end

@implementation ETHMeVC
static NSString *const ETHMeTableViewCellID = @"ETHMeTableViewCellID";

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setup];
}

- (void)setup{
    self.navigationController.navigationBar.hidden = YES;
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.tableView];
    _headerView = [[ETHHeaderView alloc]initWithFrame:CGRectMake(0, 0, LL_ScreenWidth, 165)];
    [_tableView setTableHeaderView:_headerView];
    UIView *footerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, LL_ScreenWidth, 100)];
    [_tableView setTableFooterView:footerView];
    [footerView addSubview:self.logoutButton];
    [_logoutButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(footerView).with.offset(31);
        make.width.mas_equalTo(275);
        make.height.mas_equalTo(35);
        make.centerX.equalTo(footerView.mas_centerX);
    }];
}
- (UITableView *)tableView{
    if (_tableView == nil) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, LL_ScreenWidth, LL_ScreenHeight) style:UITableViewStyleGrouped];
        [_tableView registerClass:[ETHMeTableViewCell class] forCellReuseIdentifier:ETHMeTableViewCellID];
        self.tableView.rowHeight = UITableViewAutomaticDimension;
        self.tableView.estimatedRowHeight = 100;
        
        self.tableView.sectionFooterHeight = 0;
        self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        self.tableView.scrollEnabled = NO;
        self.tableView.delegate = self;
        self.tableView.dataSource = self;
    }
    return _tableView;
}
- (UIButton *)logoutButton{
    if (_logoutButton == nil) {
        _logoutButton = [[UIButton alloc]init];
        _logoutButton.layer.cornerRadius = 5;
        _logoutButton.backgroundColor = RGBColorHex(0xf63a3a);
        _logoutButton.titleLabel.font =[UIFont systemFontOfSize:15];
        _logoutButton.titleLabel.textColor = RGBColorHex(0xffffff);
        [_logoutButton setTitle:@"退出登录" forState:UIControlStateNormal];
    }
    return _logoutButton;
}
#pragma mark --协议
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 4;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 10;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    self.navigationController.navigationBar.hidden = NO;
    if (indexPath.section ==0) {
        if (indexPath.row == 0) {
            //跳转到支付管理
            ETHPayManageVC *vc = [[ETHPayManageVC alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
        }if (indexPath.row == 1) {
            //跳转到钱包地址
            ETHMyWalletVC *vc = [[ETHMyWalletVC alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
        }else if (indexPath.row == 2){
            //跳转到C2C订单
            
        }else if (indexPath.row == 3){
            //跳转到修改密码
            
        }
        
    }else{
        if (indexPath.row == 0) {
            //跳转到我的邀请
            
        }else if (indexPath.row == 1) {
            //跳转到平台公告
            ETHAnnouncementVC *vc = [[ETHAnnouncementVC alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
        }else if (indexPath.row == 2){
            //跳转到联系客服
            
        }else if (indexPath.row == 3){
            //跳转到退出机制
            
        }
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ETHMeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ETHMeTableViewCellID forIndexPath:indexPath];
    if (indexPath.section ==0) {
        if (indexPath.row == 1) {
            [cell setIcon:[UIImage imageNamed:@"qianbao"] WithText:@"钱包地址"];
        }else if (indexPath.row == 2){
            [cell setIcon:[UIImage imageNamed:@"C2C-1"] WithText:@"C2C订单"];
        }else if (indexPath.row == 3){
            [cell setIcon:[UIImage imageNamed:@"xiugaimima"] WithText:@"修改密码"];
        }
        
    }else{
        if (indexPath.row == 0) {
            [cell setIcon:[UIImage imageNamed:@"yaoqing"] WithText:@"我的邀请"];
        }else if (indexPath.row == 1) {
            [cell setIcon:[UIImage imageNamed:@"gonggao"] WithText:@"平台公告"];
        }else if (indexPath.row == 2){
            [cell setIcon:[UIImage imageNamed:@"kefu"] WithText:@"联系客服"];
        }else if (indexPath.row == 3){
            [cell setIcon:[UIImage imageNamed:@"touzi"] WithText:@"退出机制"];
        }
    }
    return cell;
    
}
@end
