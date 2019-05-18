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
#import "http_c2c.h"
#import "SVProgressHUD.h"
#import "MJExtension.h"
#import "RefreshGifHeader.h"
#import "ETHC2CModel.h"

@interface ETHComplaintVC ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong)ETHTitleView *titleView;
@property (nonatomic, strong)UIImageView *backImg;
@property (nonatomic, strong)UITableView *tableView;

@property (nonatomic , strong)ETHC2CListModel *listModel;
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
    
    //自定义刷新动画
    ZWeakSelf
    self.tableView.mj_header = [RefreshGifHeader headerWithRefreshingBlock:^{
        
        [weakSelf loadData];
    }];
    [self.tableView.mj_header beginRefreshing];
}

-(void)loadData
{
        ZWeakSelf  //stataus 0未交易 1交易中 2交易完成 3交易失败
        [http_c2c guamai_appeal:@"1" success:^(id responseObject)
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
    
    self.listModel = [ETHC2CListModel mj_objectWithKeyValues:responseObject];
    
    [self.tableView reloadData];
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
        self.backImg.image = [UIImage imageNamed:@"BG"];
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
    return self.listModel.list.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ETHComplaintCell *cell = [tableView dequeueReusableCellWithIdentifier:ETHComplaintCellID forIndexPath:indexPath];
    ETHC2CModel *c2cModel = [self.listModel.list objectAtIndex:indexPath.row];
    cell.c2cModel = c2cModel;
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    ETHC2CModel *c2cModel = [self.listModel.list objectAtIndex:indexPath.row];
    
    [http_c2c guamai_appeal_list:c2cModel.ID success:^(id responseObject)
     {
         ETHDetailComplaintVC *vc = [[ETHDetailComplaintVC alloc]init];
         if (kObjectIsEmpty(responseObject))
         {
             return;
         }
         ETHDetailModel *listModel = [ETHDetailModel mj_objectWithKeyValues:responseObject];
         ETHC2CModel *detailModel = listModel.list;
         vc.detailModel = detailModel;
         [self.navigationController pushViewController:vc animated:YES];
         
     } failure:^(NSError *error) {
         [SVProgressHUD showErrorWithStatus:error.domain];
     }];
    
}
@end
