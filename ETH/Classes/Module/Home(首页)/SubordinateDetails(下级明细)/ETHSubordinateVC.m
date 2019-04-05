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

@interface ETHSubordinateVC ()

@end

@implementation ETHSubordinateVC

static NSString *const ETHSubordinateHeadTableCellID = @"ETHSubordinateHeadTableCellID";
static NSString *const ETHSubordinateTableCellID = @"ETHSubordinateTableCellID";


- (void)viewDidLoad {
    [super viewDidLoad];
    
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
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
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
    else if (indexPath.section==1)
    {
        ETHSubordinateTableCell* pcell = [tableView dequeueReusableCellWithIdentifier:ETHSubordinateTableCellID];
        pcell = [[ETHSubordinateTableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ETHSubordinateTableCellID];
        
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
    }
    return 65;
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
}


@end
