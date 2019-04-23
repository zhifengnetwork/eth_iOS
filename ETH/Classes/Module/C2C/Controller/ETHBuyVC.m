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
#import "http_c2c.h"
#import "SVProgressHUD.h"
#import "MJExtension.h"
#import "RefreshGifHeader.h"
#import "ETHC2CModel.h"

@interface ETHBuyVC ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong)ETHTitleView *titleView;
@property (nonatomic, strong)UIImageView *backImg;
@property (nonatomic, strong)UITableView *tableView;
@property (nonatomic, strong)UIImageView *emptyImageView;
@property (nonatomic, strong)UILabel *emptyLabel;

@property (nonatomic , strong)ETHC2CListModel *listModel;
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
        make.height.mas_equalTo(LL_StatusBarAndNavigationBarHeight +60);
    }];
    [_backImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleView.mas_bottom).with.offset(-60);
        make.left.right.bottom.equalTo(self.view);
    }];
    
    if (kStringIsEmpty(_name)==NO)
    {
        [_titleView hideLeftBtn:NO];
    }
    
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
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleView.mas_bottom).with.offset(5);
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
    if (_type == 0) {
        ZWeakSelf
        //买入
        [http_c2c guamairecordjilu:1 type:@"1" success:^(id responseObject)
         {
             [self.tableView.mj_header endRefreshing];
             [weakSelf showData:responseObject];
         } failure:^(NSError *error) {
             [self.tableView.mj_header endRefreshing];
             [SVProgressHUD showErrorWithStatus:error.domain];
         }];
    }else{
        ZWeakSelf
        //卖出
        [http_c2c guamairecordjilu:1 type:@"0" success:^(id responseObject)
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
    if (self.listModel.total == 0) {
        self.emptyImageView.hidden = NO;
        self.emptyLabel.hidden = NO;
    }else{
        self.emptyImageView.hidden = YES;
        self.emptyLabel.hidden = YES;
    }
    [self.tableView reloadData];
}

- (UIView *)titleView{
    if (_titleView == nil) {
        _titleView = [[ETHTitleView alloc]init];
        [_titleView hideLeftBtn:YES];
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
        _tableView.rowHeight = 134;
    }
    return _tableView;
}
#pragma mark -- 协议
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.listModel.list.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    ETHBuyTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ETHBuyTableViewCellID forIndexPath:indexPath];
    
    ETHC2CModel *c2cModel = [self.listModel.list objectAtIndex:indexPath.row];
    cell.c2cModel = c2cModel;
        
    [cell setButton:_type];
    return cell;
}
@end
