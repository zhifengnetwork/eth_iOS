//
//  ETHMoneyTransferVC.m
//  ETH
//
//  Created by admin on 2019/4/18.
//  Copyright © 2019 admin. All rights reserved.
//

#import "ETHMoneyTransferVC.h"
#import "ETHMoneyTransferTableCell.h"
#import "http_index.h"
#import "SVProgressHUD.h"
#import "MJExtension.h"
#import "RefreshGifHeader.h"
#import "ETHTeamModel.h"
#import <MJRefresh.h>

@interface ETHMoneyTransferVC ()

@property (nonatomic , strong)ETHTeamListModel *listModel;
@property (nonatomic,strong)BaseListModel *baselist;

@property (nonatomic, assign) NSInteger pageNum;

@end

@implementation ETHMoneyTransferVC

static NSString *const ETHMoneyTransferTableCellID = @"ETHMoneyTransferTableCellID";


- (void)viewDidLoad {
    [super viewDidLoad];
    self.pageNum = 1;
    self.title = @"转币记录";
    [self setupTableView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAippear:(BOOL)animated{
    
    [super viewWillAppear:animated];
}

-(void) viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
}

- (void)setupTableView
{
    self.tableView.estimatedRowHeight = 0;
    self.tableView.estimatedSectionHeaderHeight = 0;
    self.tableView.estimatedSectionFooterHeight = 0;
    self.tableView.backgroundColor = RGBTableViewBGColor;
    self.tableView.tableFooterView = [UIView new];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.keyboardDismissMode = UIScrollViewKeyboardDismissModeOnDrag;
    
    [self.tableView registerClass:[ETHMoneyTransferTableCell class] forCellReuseIdentifier:ETHMoneyTransferTableCellID];
    
    //自定义刷新动画
    ZWeakSelf
    self.tableView.mj_header = [RefreshGifHeader headerWithRefreshingBlock:^{
        self.pageNum = 1;
        [weakSelf loadData:self.pageNum];
    }];
    [self.tableView.mj_header beginRefreshing];
 
    // 上拉刷新
    MJRefreshAutoNormalFooter *footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreData)];
    // 设置footer
    self.tableView.mj_footer = footer;
    self.tableView.mj_footer.hidden = NO;

}

- (void)loadMoreData {
    [self loadData:self.pageNum];
    
}

- (void)loadData:(NSInteger)pageNum {
    ZWeakSelf
    [http_index investment_record:pageNum type:self.type success:^(id responseObject)
     {
         [self.tableView.mj_header endRefreshing];
//         [self.tableView.mj_footer endRefreshing];

         [weakSelf showData:responseObject];
     } failure:^(NSError *error) {
         [self.tableView.mj_header endRefreshing];
//         [self.tableView.mj_footer endRefreshing];

         [SVProgressHUD showErrorWithStatus:error.domain];
     }];
}

-(void)showData:(id)responseObject
{
    self.isShowEmptyData = YES;
    
    if (kObjectIsEmpty(responseObject))
    {
        return;
    }
    
    if (self.pageNum == 1) {
        self.listModel = [ETHTeamListModel mj_objectWithKeyValues:responseObject];
        self.tableView.mj_footer.hidden = self.listModel.list.count == 0;
    } else {
        ETHTeamListModel *moreListModel = [ETHTeamListModel mj_objectWithKeyValues:responseObject];
        [self.listModel addModel:moreListModel];
    }
    
    if (self.listModel.list.count != self.listModel.total) {
        self.tableView.mj_footer.state = MJRefreshStateIdle;
        self.pageNum += 1;

    }else {
        [self.tableView.mj_footer endRefreshingWithNoMoreData] ;
    }
    
    if (self.isViewLoaded && self.view.window)
    {
        // viewController is visible
        [self.tableView reloadData];
    }
}

//子类重写这个方法显示不同的空白图片
- (UIImage *)imageForEmptyDataSet
{
    return [UIImage imageNamed:@"No orders"];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.listModel.list.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = nil;
    
    ETHMoneyTransferTableCell* scell = [tableView dequeueReusableCellWithIdentifier:ETHMoneyTransferTableCellID];
    if (scell == nil)
    {
        scell = [[ETHMoneyTransferTableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ETHMoneyTransferTableCellID];
    }
    
    ETHTeamModel *teamModel = [self.listModel.list objectAtIndex:indexPath.section];
    scell.teamModel = teamModel;
    
    cell = scell;
    
    return cell;
}


//每行的高度是多少
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 90;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 10;
}


- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView* view = [[UIView alloc]init];
    view.backgroundColor = [UIColor clearColor];
    return view;
}

#pragma mark - TableViewDelegate
//点击了哪个cell
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section==0)
    {
//       ZFPersonalDataVC* vc = [[ZFPersonalDataVC alloc]init];
//       [self.navigationController pushViewController:vc animated:YES];
    }
}
@end
