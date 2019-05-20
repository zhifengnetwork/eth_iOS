//
//  ETHAnnouncementVC.m
//  ETH
//
//  Created by weiming zhang on 2019/4/11.
//  Copyright © 2019 admin. All rights reserved.
//

#import "ETHAnnouncementVC.h"
#import "ETHDetailAnnouncementVC.h"
#import "ETHAnnounceModel.h"
#import "UIImageView+WebCache.h"

#import "ETHAnnouncementCell.h"
@interface ETHAnnouncementVC ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong)UITableView *tableView;
@property (nonatomic, strong)NSArray *titleArray;

@end

@implementation ETHAnnouncementVC
static NSString * const ETHAnnouncementCellID = @"ETHAnnouncementCellID";
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = RGBColorHex(0xf5f5f5);
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.bottom.equalTo(self.view);
    }];
//    self.navigationController.navigationBar.barTintColor = RGBColorHex(0x343946);
//    self.navigationController.navigationBar.translucent = NO;
//    [self.navigationController.navigationBar setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
//    self.title = @"系统公告";
//    [self.navigationController.navigationBar setTitleTextAttributes:
//     @{NSForegroundColorAttributeName:[UIColor whiteColor]}];
//    [self.navigationItem.leftBarButtonItem setImage:[[UIImage imageNamed:@"back"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    [self setup];
}

- (void)setUniacid:(NSString *)uniacid{
    _uniacid = uniacid;
    NSMutableArray *tempArray = [[NSMutableArray alloc]init];
    for (ETHArticleModel *articelModel in self.articleArray) {
        
        if ([articelModel.article_category isEqualToString:self.uniacid]) {
            [tempArray addObject:articelModel];
        }
    }
    self.titleArray = tempArray;
    [_tableView reloadData];
}
- (void)setup{
    
//    [http_mine article_getlist:1 success:^(id responseObject) {
//        if (kObjectIsEmpty(responseObject)) {
//            return;
//        }
////        ETHAnnounceModel
//
//    } failure:^(NSError *error) {
//        [SVProgressHUD showErrorWithStatus:error.domain];
//    }];
//    UISegmentedControl* segment = [[UISegmentedControl alloc]initWithFrame:CGRectMake(0, 0, LL_ScreenWidth, 35)];
//    //在索引值为0的位置上插入一个标题为red的按钮，第三个参数为是否开启动画
//    [segment insertSegmentWithTitle:@"全部分类" atIndex:0 animated:YES];
//    [segment insertSegmentWithTitle:@"新手训练营" atIndex:1 animated:YES];
//    //设置标题和边框的颜色
//    segment.tintColor = [UIColor whiteColor];
//    segment.layer.borderWidth = 5;
//    segment.layer.borderColor = [UIColor whiteColor].CGColor;
//    [segment setTitleTextAttributes:@{NSForegroundColorAttributeName:RGBColorHex(0x224eaf)}forState:UIControlStateSelected];
//    [segment setTitleTextAttributes:@{NSForegroundColorAttributeName:RGBColorHex(0x666666),NSFontAttributeName:[UIFont systemFontOfSize:17]}forState:UIControlStateNormal];
//    //设置初始选中值，默认是没有选中
//    segment.selectedSegmentIndex = 0;
//    //    self.view.backgroundColor = [UIColor magentaColor];
//    //绑定事件
//    [segment addTarget:self action:@selector(segmentAction:) forControlEvents:UIControlEventValueChanged];
//    [self.view addSubview:segment];
}

- (UITableView *)tableView{
    if (_tableView == nil) {
        _tableView = [[UITableView alloc]init];
        _tableView.backgroundColor = RGBColorHex(0xf5f5f5);
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.rowHeight = 65;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_tableView registerClass:[ETHAnnouncementCell class] forCellReuseIdentifier:ETHAnnouncementCellID];
    }return _tableView;
}
//-(void)segmentAction:(UISegmentedControl*)sender
//{
//    //titleForSegmentAtIndex通过索引值获取被选中的分段控制器的按钮标题，selectedSegmentIndex 是获取被选中按钮的索引值
//    NSLog(@"----%@",[sender titleForSegmentAtIndex:sender.selectedSegmentIndex]);
//
//}
//- (void)viewWillDisappear:(BOOL)animated{
//    self.navigationController.navigationBar.hidden = YES;
//}
#pragma mrak -- 协议
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.titleArray.count;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    ETHDetailAnnouncementVC *vc = [[ETHDetailAnnouncementVC alloc]init];
    ETHArticleModel *articleModel = [self.articleArray objectAtIndex:indexPath.row];
    vc.aid = articleModel.ID.integerValue;
    [self.navigationController pushViewController:vc animated:YES];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ETHAnnouncementCell *cell = [tableView dequeueReusableCellWithIdentifier:ETHAnnouncementCellID forIndexPath:indexPath];
    ETHArticleModel *articleModel = [self.articleArray objectAtIndex:indexPath.row];
    cell.articleModel = articleModel;
    return cell;
}
@end
