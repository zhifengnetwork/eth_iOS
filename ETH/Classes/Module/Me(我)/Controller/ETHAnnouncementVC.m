//
//  ETHAnnouncementVC.m
//  ETH
//
//  Created by weiming zhang on 2019/4/11.
//  Copyright © 2019 admin. All rights reserved.
//

#import "ETHAnnouncementVC.h"
#import "ETHAnnouncementCell.h"
@interface ETHAnnouncementVC ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong)UIView *lineView1;
@property (nonatomic, strong)UIView *lineView2;
@property (nonatomic, strong)UITableView *tableView;
@end

@implementation ETHAnnouncementVC
static NSString * const ETHAnnouncementCellID = @"ETHAnnouncementCellID";
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = RGBColorHex(0xf5f5f5);
    self.navigationController.navigationBar.barTintColor = RGBColorHex(0x343946);
    self.navigationController.navigationBar.translucent = NO;
    [self.navigationController.navigationBar setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
    self.title = @"系统公告";
    [self.navigationController.navigationBar setTitleTextAttributes:
     @{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    [self.navigationItem.leftBarButtonItem setImage:[[UIImage imageNamed:@"back"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    [self setup];
}
- (void)setup{
    UISegmentedControl* segment = [[UISegmentedControl alloc]initWithFrame:CGRectMake(0, 0, LL_ScreenWidth, 35)];
    //在索引值为0的位置上插入一个标题为red的按钮，第三个参数为是否开启动画
    [segment insertSegmentWithTitle:@"全部分类" atIndex:0 animated:YES];
    [segment insertSegmentWithTitle:@"新手训练营" atIndex:1 animated:YES];
    //设置标题和边框的颜色
    segment.tintColor = [UIColor whiteColor];
    segment.layer.borderWidth = 5;
    segment.layer.borderColor = [UIColor whiteColor].CGColor;
    [segment setTitleTextAttributes:@{NSForegroundColorAttributeName:RGBColorHex(0x224eaf)}forState:UIControlStateSelected];
    [segment setTitleTextAttributes:@{NSForegroundColorAttributeName:RGBColorHex(0x666666),NSFontAttributeName:[UIFont systemFontOfSize:17]}forState:UIControlStateNormal];
    //设置初始选中值，默认是没有选中
    segment.selectedSegmentIndex = 0;
    //    self.view.backgroundColor = [UIColor magentaColor];
    //绑定事件
    [segment addTarget:self action:@selector(segmentAction:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:segment];
    [self.view addSubview:self.lineView1];
    [self.view addSubview:self.lineView2];
    [self.view addSubview:self.tableView];
    [_lineView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.equalTo(segment);
        make.height.mas_equalTo(1);
        make.width.mas_equalTo(LL_ScreenWidth/2);
    }];
    [_lineView2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.bottom.equalTo(segment);
        make.height.mas_equalTo(1);
        make.width.mas_equalTo(LL_ScreenWidth/2);
    }];
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(segment.mas_bottom).with.offset(10);
        make.left.right.bottom.equalTo(self.view);
    }];
}
- (UIView *)lineView1{
    if (_lineView1 == nil) {
        _lineView1 = [[UIView alloc]init];
        _lineView1.backgroundColor = RGBColorHex(0x224eaf);
    }return _lineView1;
}
- (UIView *)lineView2{
    if (_lineView2 == nil) {
        _lineView2 = [[UIView alloc]init];
        _lineView2.backgroundColor = RGBColorHex(0x224eaf);
        _lineView2.hidden = YES;
    }return _lineView2;
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
-(void)segmentAction:(UISegmentedControl*)sender
{
    //titleForSegmentAtIndex通过索引值获取被选中的分段控制器的按钮标题，selectedSegmentIndex 是获取被选中按钮的索引值
    NSLog(@"----%@",[sender titleForSegmentAtIndex:sender.selectedSegmentIndex]);
    if (sender.selectedSegmentIndex == 0) {
        _lineView2.hidden = YES;
        _lineView1.hidden = NO;
    }else{
        _lineView1.hidden = YES;
        _lineView2.hidden = NO;
    }
}
- (void)viewWillDisappear:(BOOL)animated{
    self.navigationController.navigationBar.hidden = YES;
}
#pragma mrak -- 协议
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ETHAnnouncementCell *cell = [tableView dequeueReusableCellWithIdentifier:ETHAnnouncementCellID forIndexPath:indexPath];
    return cell;
}
@end
