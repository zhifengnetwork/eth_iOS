//
//  ETHAllRecordVC.m
//  ETH
//
//  Created by weiming zhang on 2019/5/25.
//  Copyright © 2019 admin. All rights reserved.
//

#import "ETHAllRecordVC.h"
#import "http_wallet.h"
#import "SVProgressHUD.h"
#import "MJExtension.h"
#import "RefreshGifHeader.h"
#import "ETHAllRecordCell.h"
#import "ETHTeamModel.h"

@interface ETHAllRecordVC ()

@property (nonatomic , strong)ETHTeamListModel *listModel;
@property (nonatomic,strong)BaseListModel *baseListModel;
@property (nonatomic,assign)NSInteger pageNum;
@end

@implementation ETHAllRecordVC

static NSString * const ETHAllRecordCellID = @"ETHAllRecordCellID";

- (void)viewDidLoad {
    [super viewDidLoad];
    self.pageNum = 1;
    self.title = @"总记录";
    [self setupTableView];
}



- (void)setupTableView
{
    self.tableView.estimatedRowHeight = 0;
    self.tableView.estimatedSectionHeaderHeight = 0;
    self.tableView.estimatedSectionFooterHeight = 0;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.backgroundColor = RGBTableViewBGColor;
    self.tableView.tableFooterView = [UIView new];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.keyboardDismissMode = UIScrollViewKeyboardDismissModeOnDrag;
    
    [self.tableView registerClass:[ETHAllRecordCell class] forCellReuseIdentifier:ETHAllRecordCellID];
    
    //自定义刷新动画
    ZWeakSelf
    self.tableView.mj_header = [RefreshGifHeader headerWithRefreshingBlock:^{
        self.pageNum = 1;
        [weakSelf loadData:self.pageNum];
    }];
    [self.tableView.mj_header beginRefreshing];
    MJRefreshAutoNormalFooter *footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreData)];
    self.tableView.mj_footer = footer;
    self.tableView.mj_footer.hidden = YES;
    
}
-(void)loadMoreData
{
    [self loadData:self.pageNum];
}
-(void)loadData:(NSInteger)pageNum
{
    ZWeakSelf
    [http_wallet money_log:6 page:pageNum success:^(id responseObject)
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
    self.isShowEmptyData = YES;
    
    if (kObjectIsEmpty(responseObject))
    {
        return;
    }
    if (self.pageNum == 1) {
    self.listModel = [ETHTeamListModel mj_objectWithKeyValues:responseObject];
        self.tableView.mj_footer.hidden = self.listModel.list.count ==0;
    }else
    {
        ETHTeamListModel *moreListModel = [ETHTeamListModel mj_objectWithKeyValues:responseObject];
        [self.listModel addModel:moreListModel];
    }
    if (self.listModel.list.count != self.listModel.total) {
        self.tableView.mj_footer.state = MJRefreshStateIdle;
        self.pageNum+=1;
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
//    ETHAllRecordCell *cell = [tableView dequeueReusableCellWithIdentifier:ETHAllRecordCellID forIndexPath:indexPath];
//    cell.teamModel = [self.listModel.list objectAtIndex:indexPath.section];
    
    
    ETHAllRecordCell* scell = [tableView dequeueReusableCellWithIdentifier:ETHAllRecordCellID];
    if (scell == nil)
    {
        scell = [[ETHAllRecordCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ETHAllRecordCellID];
    }
    ETHTeamModel *teamModel = [self.listModel.list objectAtIndex:indexPath.section];
    scell.teamModel = teamModel;
    
//    cell = scell;
    
    return scell;
}


//每行的高度是多少做两个判断如果是
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
//   ETHAllRecordCell *cell=[tableView cellForRowAtIndexPath:indexPath];
    ETHTeamModel *teamModel = [self.listModel.list objectAtIndex:indexPath.section];

    if ([teamModel.title isEqualToString:@"转币"]||[teamModel.title isEqualToString:@"ETH提现余额"]||[teamModel.title isEqualToString:@"ETH提币余额"]) {
        return 140;
    }else{
        return 110;
    }
    
//    if (_teamModel.type ==3) {
//        return 120;
//    }else{
//        return 120;
//
//    return cell.frame.size.height;

//    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 5;
}


- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView* view = [[UIView alloc]init];
    view.backgroundColor = [UIColor clearColor];
    return view;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
