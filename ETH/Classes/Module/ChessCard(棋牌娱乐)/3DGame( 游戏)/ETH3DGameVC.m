//
//  ETH3DGameVC.m
//  ETH
//
//  Created by admin on 2019/4/12.
//  Copyright © 2019 admin. All rights reserved.
//

#import "ETH3DGameVC.h"
#import "RefreshGifHeader.h"
#import "ETHListWinnersTableCell.h"
#import "ETH3DGameTableCell.h"
#import "SVProgressHUD.h"
#import "MJExtension.h"
#import "ETHKeyPackageTableCell.h"
#import "ETH3DGameFooterView.h"

@interface ETH3DGameVC()<ETH3DGameFooterViewDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong)UIButton *agreeButton;

@property (nonatomic, strong) ETH3DGameFooterView *footerView;

@interface ETH3DGameVC()

@property (nonatomic, strong) UITableView *tableView;
@end


@implementation ETH3DGameVC

static NSString *const ETHListWinnersTableCellID = @"ETHListWinnersTableCellID";
static NSString *const ETH3DGameTableCellID = @"ETH3DGameTableCellID";
static NSString *const ETHKeyPackageTableCellID = @"ETHKeyPackageTableCellID";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"3D游戏";
    [self setupUI];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
//    [self.navigationController setNavigationBarHidden:YES animated:animated];
    
    //用户信息
//    [self loadData];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
//    [self.navigationController setNavigationBarHidden:NO animated:animated];
}

- (void)setupUI
{
    [self.view addSubview:self.footerView];
    [_footerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self.view);
        make.height.mas_equalTo(30);
    }];
    
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.equalTo(self.view);
        make.bottom.equalTo(self->_footerView.mas_top);
    }];
    
    self.tableView.backgroundColor = RGBColorHex(0xffffff);
    self.tableView.tableFooterView = [UIView new];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    //自动计算高度
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 50;
    
    [self.tableView registerClass:[ETHListWinnersTableCell class] forCellReuseIdentifier:ETHListWinnersTableCellID];
    [self.tableView registerClass:[ETH3DGameTableCell class] forCellReuseIdentifier:ETH3DGameTableCellID];
    [self.tableView registerClass:[ETHKeyPackageTableCell class] forCellReuseIdentifier:ETHKeyPackageTableCellID];
}

//加载数据
//-(void)loadData
//{
//    ZWeakSelf
//    [http_user userinfo:^(id responseObject)
//     {
//         [weakSelf loadData_ok:responseObject];
//
//     } failure:^(NSError *error) {
//
//         [SVProgressHUD showInfoWithStatus:error.domain];
//     }];
//}

//加载数据完成
//-(void)loadData_ok:(id)responseObject
//{
//    if (kObjectIsEmpty(responseObject))
//    {
//        return;
//    }
//
//    //jsonToModel
//    self.userInfo = [UserInfoModel mj_objectWithKeyValues:responseObject];
//    //刷新数据
//    self.headView.userInfo = self.userInfo;
//    [self.tableView reloadData];
//}




#pragma mark - Table view data source
//有多少组
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 5;
}

//每个组有多少行
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

//每行使用的Cell是什么
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ETH3DGameTableCell* cell = [tableView dequeueReusableCellWithIdentifier:ETH3DGameTableCellID];
    if (cell == nil)
    {
        cell = [[ETH3DGameTableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ETH3DGameTableCellID];
    }
    
    if (indexPath.section==0)
    {
        ETHListWinnersTableCell* cell = [tableView dequeueReusableCellWithIdentifier:ETHListWinnersTableCellID];
        if (cell == nil)
        {
            cell = [[ETHListWinnersTableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ETHListWinnersTableCellID];
        }
//        cell.delegate = self;
        return cell;
    }
    else if (indexPath.section==1)
    {
        cell.title = @"百位";
//        cell.delegate = self;
        return cell;
    }
    else if (indexPath.section==2)
    {
        cell.title = @"十位";
        //        cell.delegate = self;
        return cell;
    }
    else if (indexPath.section==3)
    {
        cell.title = @"个位";
        //        cell.delegate = self;
        return cell;
    }
    else if (indexPath.section==4)
    {
        ETHKeyPackageTableCell* cell = [tableView dequeueReusableCellWithIdentifier:ETHKeyPackageTableCellID];
        if (cell == nil)
        {
            cell = [[ETHKeyPackageTableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ETHKeyPackageTableCellID];
        }
        //        cell.delegate = self;
        return cell;
    }
    
    return nil;
}

//每行的高度是多少
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section==0)
    {
        return 30;
    }
    else if (indexPath.section==4)
    {
        return 45;
    }
    
    return 98.0f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 10;
}

- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *cview = [[UIView alloc]init];
    cview.backgroundColor = [UIColor clearColor];
    return cview;
}


- (UITableView *)tableView {
    if (_tableView == nil) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, LL_ScreenWidth, LL_ScreenHeight) style:UITableViewStylePlain];
        //设置数据源，注意必须实现对应的UITableViewDataSource协议
        _tableView.dataSource=self;
        //设置代理
        _tableView.delegate=self;
        _tableView.keyboardDismissMode = UIScrollViewKeyboardDismissModeOnDrag;
        [self.view addSubview:_tableView];
    }
    return _tableView;
}

- (void)handleSingleTap:(UITouch *)touch
{
    
}

-(ETH3DGameFooterView *)footerView
{
    if (_footerView==nil)
    {
        _footerView = [[ETH3DGameFooterView alloc]init];
        _footerView.backgroundColor = RGBColorHex(0xf4f4f4);
        
        //UIView增加点击事件
        _footerView.userInteractionEnabled = YES;
        UITapGestureRecognizer* singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleSingleTap:)];
        [_footerView addGestureRecognizer:singleTap];
    }
    
    return _footerView;
}


//3D游戏底部
- (void)ETH3DGameFooterViewDidClick
{
    
}

@end
