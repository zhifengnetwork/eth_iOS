//
//  ETHSubordinateVC.m
//  ETH
//
//  Created by admin on 2019/4/4.
//  Copyright © 2019 admin. All rights reserved.
//

#import "ETHSubordinateVC.h"
#import "ETHSubordinateHeadTableCell.h"
#import "ETHSubordinateTableCell.h"
#import "http_index.h"
#import "SVProgressHUD.h"
#import "MJExtension.h"
#import "RefreshGifHeader.h"
#import "ETHTeamModel.h"
#import "ETHTool.h"

@interface ETHSubordinateVC ()

@property (nonatomic , strong)ETHTeamListModel *listModel;
@property (nonatomic,assign)NSInteger pageNum;
@end

@implementation ETHSubordinateVC

static NSString *const ETHSubordinateHeadTableCellID = @"ETHSubordinateHeadTableCellID";
static NSString *const ETHSubordinateTableCellID = @"ETHSubordinateTableCellID";


- (void)viewDidLoad {
    [super viewDidLoad];
    self.pageNum = 1;
    self.title = @"下级明细";
    [self setupTableView];
    
}

- (void)deleteButtonDidClick
{
    
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
    self.view.backgroundColor = RGBColorHex(0xffffff);
    self.tableView.estimatedRowHeight = 0;
    self.tableView.estimatedSectionHeaderHeight = 0;
    self.tableView.estimatedSectionFooterHeight = 0;
    self.tableView.backgroundColor = RGBColorHex(0xffffff);
    self.tableView.tableFooterView = [UIView new];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.keyboardDismissMode = UIScrollViewKeyboardDismissModeOnDrag;
    
    [self.tableView registerClass:[ETHSubordinateHeadTableCell class] forCellReuseIdentifier:ETHSubordinateHeadTableCellID];
    [self.tableView registerClass:[ETHSubordinateTableCell class] forCellReuseIdentifier:ETHSubordinateTableCellID];
    
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
    self.tableView.mj_footer.hidden = YES;
}
-(void)loadMoreData
{
    [self loadData:self.pageNum];
}

-(void)loadData:(NSInteger)pageNum
{
    ZWeakSelf
    [http_index xiaji_get_list:self.pageNum success:^(id responseObject)
     {
         [self.tableView.mj_header endRefreshing];
         [weakSelf showData:responseObject];
     } failure:^(NSError *error) {
         [self.tableView.mj_header endRefreshing];
         [SVProgressHUD showErrorWithStatus:error.domain];
     }];
    
//    ZWeakSelf
//    [http_index investment_record:1 type:self.type success:^(id responseObject)
//     {
//         [self.tableView.mj_header endRefreshing];
//         [weakSelf showData:responseObject];
//     } failure:^(NSError *error) {
//         [self.tableView.mj_header endRefreshing];
//         [SVProgressHUD showErrorWithStatus:error.domain];
//     }];
}

-(void)showData:(id)responseObject
{
    if (kObjectIsEmpty(responseObject))
    {
        return;
    }
    NSLog(@"%ld",self.listModel.list.count);
//    self.listModel = [ETHTeamListModel mj_objectWithKeyValues:responseObject];
    if (self.pageNum == 1) {
        self.listModel = [ETHTeamListModel mj_objectWithKeyValues:responseObject];
        self.tableView.mj_footer.hidden = self.listModel.list.count == 0;
    }else {
        ETHTeamListModel *moreListModel = [ETHTeamListModel mj_objectWithKeyValues:responseObject];
        [self.listModel addModel:moreListModel];
    }
    
    NSMutableArray *zhiArray = [NSMutableArray new];
    NSMutableArray *tuanArray = [NSMutableArray new];
    
    for (ETHTeamModel *teamModel in self.listModel.list) {
        if (teamModel.type == 1) {
            [zhiArray addObject:teamModel];
        }else{
            [tuanArray addObject:teamModel];
        }
    }
    
    for (int i = 0; i < zhiArray.count; i++) {
        for (int j = 0; j < zhiArray.count - 1 - i; j++) {
            
            ETHTeamModel *jModel = zhiArray[j];
            ETHTeamModel *iModel = zhiArray[j+1];
            NSInteger count  = [ETHTool getDateDifferenceWithNowDateStr:jModel.createtime deadlineStr:iModel.createtime];
            if (count>= 0) {
                ETHTeamModel* tmp = zhiArray[j];
                zhiArray[j] = zhiArray[j + 1];
                zhiArray[j + 1] = tmp;
            }
        }
    }
    
    
    
    
    for (int i = 0; i < tuanArray.count; i++) {
        for (int j = 0; j < tuanArray.count - 1 - i; j++) {
           
            ETHTeamModel *jModel = tuanArray[j];
             ETHTeamModel *iModel = tuanArray[j+1];
            NSInteger count  = [ETHTool getDateDifferenceWithNowDateStr:jModel.createtime deadlineStr:iModel.createtime];
            if (count>= 0) {
                ETHTeamModel* tmp = tuanArray[j];
                tuanArray[j] = tuanArray[j + 1];
                tuanArray[j + 1] = tmp;
            }
        }
    }
    
    if ([responseObject isKindOfClass:[NSDictionary class]]) {
        NSArray *dataArray = responseObject[@"list"];
        if (dataArray.count == 10) {
            self.tableView.mj_footer.state = MJRefreshStateIdle;
            self.pageNum += 1;
        }else {
            [self.tableView.mj_footer endRefreshingWithNoMoreData] ;
            
        }
    }
    
    [self.listModel.list removeAllObjects];
    
    for (ETHTeamModel *teamModel in zhiArray) {
        [self.listModel.list addObject:teamModel];
    }
    for (ETHTeamModel *teamModel in tuanArray) {
        [self.listModel.list addObject:teamModel];
    }
    
    if (self.isViewLoaded && self.view.window) {
        [self.tableView reloadData];
    }
//    [self.tableView reloadData];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1+self.listModel.list.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = nil;
    
    if (indexPath.section==0)
    {
        ETHSubordinateHeadTableCell* scell = [tableView dequeueReusableCellWithIdentifier:ETHSubordinateHeadTableCellID];
        scell = [[ETHSubordinateHeadTableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ETHSubordinateHeadTableCellID];
        
        cell = scell;
    }
    else
    {
        ETHSubordinateTableCell* pcell = [tableView dequeueReusableCellWithIdentifier:ETHSubordinateTableCellID];
        pcell = [[ETHSubordinateTableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ETHSubordinateTableCellID];
        ETHTeamModel *teamModel = [self.listModel.list objectAtIndex:indexPath.section-1];
        pcell.teamModel = teamModel;
        cell = pcell;
    }
    
    return cell;
}


//每行的高度是多少
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section==0)
    {
        return 40;
    }else {
        ETHTeamModel *teamModel = self.listModel.list[indexPath.section -1];
        if (teamModel.isChoice) {
            return 75;
        }else {
            return 50;
        }

    }
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
        //        ZFPersonalDataVC* vc = [[ZFPersonalDataVC alloc]init];
        //        [self.navigationController pushViewController:vc animated:YES];
        
    }
   ETHTeamModel *teamModel = self.listModel.list[indexPath.section -1];
    teamModel.isChoice = !teamModel.isChoice;
    
    NSIndexSet *indexSet=[[NSIndexSet alloc]initWithIndex:indexPath.section];
    [self.tableView reloadSections:indexSet withRowAnimation:UITableViewRowAnimationAutomatic];

}


@end
