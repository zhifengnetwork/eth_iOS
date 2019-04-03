//
//  ETHMeVC.m
//  ETH
//
//  Created by admin on 2019/4/3.
//  Copyright © 2019 admin. All rights reserved.
//

#import "ETHMeVC.h"
#import "ETHHeaderView.h"
@interface ETHMeVC ()
@property (nonatomic, strong)UITableView *tableView;
@property (nonatomic, strong)ETHHeaderView *headerView;
@end

@implementation ETHMeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setup];
}

- (void)setup{
    self.navigationController.navigationBar.hidden = YES;
    [self.view addSubview:self.tableView];
    _headerView = [[ETHHeaderView alloc]initWithFrame:CGRectMake(0, 0, LL_ScreenWidth, 165)];
    [_tableView setTableHeaderView:_headerView];
    
}
- (UITableView *)tableView{
    if (_tableView == nil) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, LL_ScreenWidth, LL_ScreenHeight) style:UITableViewStyleGrouped];
        
    }
    return _tableView;
}

@end
