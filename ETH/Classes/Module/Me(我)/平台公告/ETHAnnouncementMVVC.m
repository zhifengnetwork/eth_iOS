//
//  ETHAnnouncementMVVC.m
//  ETH
//
//  Created by weiming zhang on 2019/5/18.
//  Copyright © 2019 admin. All rights reserved.
//

#import "ETHAnnouncementMVVC.h"
#import "ETHAnnouncementVC.h"
#import "http_mine.h"
#import "SVProgressHUD.h"
#import "ETHAnnounceModel.h"
#import "MJExtension.h"
#import "UIImageView+WebCache.h"

@interface ETHAnnouncementMVVC ()
@property (nonatomic, strong)ETHAnnouncementVC *vc;
@property (nonatomic, strong)ETHAnnounceModel *announceModel;
@end

@implementation ETHAnnouncementMVVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = RGBColorHex(0xf5f5f5);
    self.navigationController.navigationBar.barTintColor = RGBColorHex(0x343946);
    self.navigationController.navigationBar.translucent = NO;
    [self.navigationController.navigationBar setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
    self.title = @"系统公告";
    [self.navigationController.navigationBar setTitleTextAttributes:
     @{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    [http_mine article_getlist:1 success:^(id responseObject) {
        if (kObjectIsEmpty(responseObject)) {
            return;
        }
        self.announceModel = [ETHAnnounceModel mj_objectWithKeyValues:responseObject];
        [self setup];
    } failure:^(NSError *error) {
        [SVProgressHUD showErrorWithStatus:error.domain];
    }];
    
}

- (void)setup{
    
    UISegmentedControl* segment = [[UISegmentedControl alloc]initWithFrame:CGRectMake(0, 0, LL_ScreenWidth, 35)];
    //在索引值为0的位置上插入一个标题为red的按钮，第三个参数为是否开启动画
    for (NSInteger i = 0; i<self.announceModel.categorys.count; i++) {
        ETHTitleModel *titleModel = self.announceModel.categorys[i];
        [segment insertSegmentWithTitle:[NSString stringWithFormat:@"%@",titleModel.category_name] atIndex:i animated:YES];
    }
    //设置标题和边框的颜色
    segment.tintColor = [UIColor whiteColor];
//    segment.layer.borderWidth = 5;
//    segment.layer.borderColor = [UIColor whiteColor].CGColor;
    [segment setTitleTextAttributes:@{NSForegroundColorAttributeName:RGBColorHex(0x224eaf)}forState:UIControlStateSelected];
    [segment setTitleTextAttributes:@{NSForegroundColorAttributeName:RGBColorHex(0x666666),NSFontAttributeName:[UIFont systemFontOfSize:17]}forState:UIControlStateNormal];
    //设置初始选中值，默认是没有选中
    segment.selectedSegmentIndex = 0;
    self.vc.view.hidden = NO;
    ETHTitleModel *titleModel = self.announceModel.categorys[0];
    self.vc.uniacid = titleModel.uniacid;
    //    self.view.backgroundColor = [UIColor magentaColor];
    //绑定事件
    [segment addTarget:self action:@selector(segmentAction:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:segment];
}

-(void)segmentAction:(UISegmentedControl*)sender
{
    //titleForSegmentAtIndex通过索引值获取被选中的分段控制器的按钮标题，selectedSegmentIndex 是获取被选中按钮的索引值
    NSLog(@"----%@",[sender titleForSegmentAtIndex:sender.selectedSegmentIndex]);
    ETHTitleModel *titleModel = self.announceModel.categorys[sender.selectedSegmentIndex];
    self.vc.uniacid = titleModel.uniacid;
    
}

- (ETHAnnouncementVC *)vc
{
    if (_vc ==nil) {
        _vc = [[ETHAnnouncementVC alloc]init];
        [self addChildViewController:_vc];
        [self.view addSubview:_vc.view];
        self.vc.articleArray = self.announceModel.articles;
        [_vc.view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.bottom.mas_equalTo(0);
            make.top.mas_equalTo(40);
        }];
    }
    return _vc;
}
@end
