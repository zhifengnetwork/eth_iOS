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
@end

@implementation ETHAllRecordVC

static NSString * const ETHAllRecordCellID = @"ETHAllRecordCellID";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"总记录";
    [self setupTableView];
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
    
    [self.tableView registerClass:[ETHAllRecordCell class] forCellReuseIdentifier:ETHAllRecordCellID];
    
    //自定义刷新动画
    ZWeakSelf
    self.tableView.mj_header = [RefreshGifHeader headerWithRefreshingBlock:^{
        
        [weakSelf loadData];
    }];
    [self.tableView.mj_header beginRefreshing];
    
}

-(void)loadData
{
    ZWeakSelf
    [http_wallet money_log:6 page:1 success:^(id responseObject)
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
    
    self.listModel = [ETHTeamListModel mj_objectWithKeyValues:responseObject];
    
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
    ETHAllRecordCell *cell = [tableView dequeueReusableCellWithIdentifier:ETHAllRecordCellID forIndexPath:indexPath];
    cell.teamModel = [self.listModel.list objectAtIndex:indexPath.section];
    
    
//    ETHRecordWithableCell* scell = [tableView dequeueReusableCellWithIdentifier:ETHRecordWithableCellID];
//    if (scell == nil)
//    {
//        scell = [[ETHRecordWithableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ETHRecordWithableCellID];
//    }
//    ETHTeamModel *teamModel = [self.listModel.list objectAtIndex:indexPath.section];
//    scell.teamModel = teamModel;
//    
//    cell = scell;
    
    return cell;
}


//每行的高度是多少
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 110;
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
