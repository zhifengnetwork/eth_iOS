//
//  ETHMeVC.m
//  ETH
//
//  Created by admin on 2019/4/3.
//  Copyright © 2019 admin. All rights reserved.
//

#import "ETHMeVC.h"
#import "ETHHeaderView.h"
#import "ETHMeTableViewCell.h"
#import "ETHPayManageVC.h"
#import "ViewController.h"
#import "ETHMyWalletVC.h"
#import "ETHMyInviteVC.h"
#import "ETHAnnouncementMVVC.h"
#import "ETHResetPasswordVC.h"
#import "AppDelegate.h"
#import "http_user.h"
#import "http_mine.h"
#import "SVProgressHUD.h"
#import "MJExtension.h"
#import "UserInfoModel.h"
#import "TYAlertController.h"
#import "ETHQuitView.h"
#import "ETHKefu.h"

@interface ETHMeVC ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong)UITableView *tableView;
@property (nonatomic, strong)ETHHeaderView *headerView;
//@property (nonatomic, strong)UIButton *logoutButton;

@property (nonatomic, strong) UserInfoModel *userInfo;

@end
@implementation ETHMeVC
static NSString *const ETHMeTableViewCellID = @"ETHMeTableViewCellID";

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setup];
}

- (void)setup{
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:self.tableView];
    
    _headerView = [[ETHHeaderView alloc]initWithFrame:CGRectMake(0, 0, LL_ScreenWidth, 165)];
    [_tableView setTableHeaderView:_headerView];
    
    
    
//    UIView *footerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, LL_ScreenWidth, 100)];
//    [_tableView setTableFooterView:footerView];
    
//    [footerView addSubview:self.logoutButton];
//    [_logoutButton mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(footerView).with.offset(31);
//        make.width.mas_equalTo(275);
//        make.height.mas_equalTo(35);
//        make.centerX.equalTo(footerView.mas_centerX);
//    }];
}
- (void)viewWillDisappear:(BOOL)animated{
    self.navigationController.navigationBar.hidden = NO;
}
- (void)viewWillAppear:(BOOL)animated{
    self.navigationController.navigationBar.hidden = YES;
    
    //用户信息
    [self loadData];
}

//加载数据
-(void)loadData
{
    ZWeakSelf
    [http_mine lingdaolevel:^(id responseObject) {
        if (kObjectIsEmpty(responseObject)) {
            return;
        }
        
    } failure:^(NSError *error) {
        
    }];
    
    
    [http_user userinfo:^(id responseObject)
     {
         [weakSelf loadData_ok:responseObject];
         
     } failure:^(NSError *error) {
         
         [SVProgressHUD showInfoWithStatus:error.domain];
     }];
}

//加载数据完成
-(void)loadData_ok:(id)responseObject
{
    if (kObjectIsEmpty(responseObject))
    {
        return;
    }
    
    //jsonToModel
    self.userInfo = [UserInfoModel mj_objectWithKeyValues:responseObject];
    //刷新数据
    self.headerView.userInfo = self.userInfo;
    [self.tableView reloadData];
}


- (UITableView *)tableView{
    if (_tableView == nil) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, LL_ScreenWidth, LL_ScreenHeight) style:UITableViewStyleGrouped];
        [_tableView registerClass:[ETHMeTableViewCell class] forCellReuseIdentifier:ETHMeTableViewCellID];
        self.tableView.rowHeight = UITableViewAutomaticDimension;
        self.tableView.estimatedRowHeight = 100;
        
        self.tableView.sectionFooterHeight = 0;
        self.tableView.backgroundColor = RGBColorHex(0x142241);
        self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        self.tableView.scrollEnabled = NO;
        self.tableView.delegate = self;
        self.tableView.dataSource = self;
    }
    return _tableView;
}
//- (UIButton *)logoutButton{
//    if (_logoutButton == nil) {
//        _logoutButton = [[UIButton alloc]init];
//        _logoutButton.layer.cornerRadius = 5;
//        _logoutButton.backgroundColor = RGBColorHex(0xf63a3a);
//        _logoutButton.titleLabel.font =[UIFont systemFontOfSize:15];
//        _logoutButton.titleLabel.textColor = RGBColorHex(0xffffff);
//        [_logoutButton setTitle:@"退出登录" forState:UIControlStateNormal];
//        [_logoutButton addTarget:self action:@selector(logoutButtonDidClick) forControlEvents:UIControlEventTouchUpInside];
//    }
//    return _logoutButton;
//}

- (void)logoutButtonDidClick
{
    ZWeakSelf;
    NSString* message = [NSString stringWithFormat:@"确定退出软件？"];
    UIAlertController *alert =
    [UIAlertController alertControllerWithTitle:nil
                                        message:message
                                 preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *action1 =
    [UIAlertAction actionWithTitle:@"取消"
                             style:UIAlertActionStyleDefault
                           handler:nil];
    
    [alert addAction:action1];
    
    UIAlertAction *action =
    [UIAlertAction actionWithTitle:@"确定"
                             style:UIAlertActionStyleDefault
                           handler:^(UIAlertAction * _Nonnull action) {
                               
                               [weakSelf toExit];
                           }];
    
    [alert addAction:action];
    
    [self presentViewController:alert animated:YES completion:nil];
}

-(void)toExit
{
    //归档清空
    [UserInfoModel removeUserInfo];
    AppDelegate* app = (AppDelegate *) [[UIApplication sharedApplication] delegate];
    [app to_LoginVC];
}


#pragma mark --协议
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    if (self.userInfo.member.type == 2||self.userInfo.member.suoding ==1) {//已锁户
        return 7;
    }else{//未锁户
        return 8;
    }
   
}



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (self.userInfo.member.type == 2||self.userInfo.member.suoding ==1) {
        //已锁户
        if (indexPath.row == 5){
            //跳转到联系客服
            ETHKefu *view = [[ETHKefu alloc]initWithFrame:CGRectMake(0, 0, 300, 200)];
            view.model = self.userInfo.kefu;
            TYAlertController *alertController = [TYAlertController alertControllerWithAlertView:view preferredStyle:TYAlertControllerStyleAlert transitionAnimation:TYAlertTransitionAnimationScaleFade];
            [self presentViewController:alertController animated:YES completion:nil];
        }else if (indexPath.row == 6){
            [self logoutButtonDidClick];
        }else{
            [SVProgressHUD showErrorWithStatus:@"该账户已锁户"];
        }
        
        
    }else{//未锁户
            if (indexPath.row == 0) {
                //跳转到支付管理
                ETHPayManageVC *vc = [[ETHPayManageVC alloc]init];
                [self.navigationController pushViewController:vc animated:YES];
            }if (indexPath.row == 1) {
                //跳转到钱包地址
                ETHMyWalletVC *vc = [[ETHMyWalletVC alloc]init];
                [self.navigationController pushViewController:vc animated:YES];
            }
            //        else if (indexPath.row == 2){
            //            //跳转到C2C订单
            //
            //        }
            else if (indexPath.row == 2){
                //跳转到修改密码
                ETHResetPasswordVC *vc = [[ETHResetPasswordVC alloc]init];
                [self.navigationController pushViewController:vc animated:YES];
            }else if (indexPath.row == 3) {
                //跳转到我的邀请
                ETHMyInviteVC *vc = [[ETHMyInviteVC alloc]init];
                [self.navigationController pushViewController:vc animated:YES];
            }else if (indexPath.row == 4) {
                //跳转到平台公告
                ETHAnnouncementMVVC *vc = [[ETHAnnouncementMVVC alloc]init];
                [self.navigationController pushViewController:vc animated:YES];
            }else if (indexPath.row == 5){
                //跳转到联系客服
                ETHKefu *view = [[ETHKefu alloc]initWithFrame:CGRectMake(0, 0, 300, 200)];
                view.model = self.userInfo.kefu;
                TYAlertController *alertController = [TYAlertController alertControllerWithAlertView:view preferredStyle:TYAlertControllerStyleAlert transitionAnimation:TYAlertTransitionAnimationScaleFade];
                [self presentViewController:alertController animated:YES completion:nil];
                
            }else if (indexPath.row == 6){
                //跳转到退出机制
                ETHQuitView *view = [[ETHQuitView alloc]initWithFrame:CGRectMake(0, 0, 257, 284)];
                if (!kStringIsEmpty(self.userInfo.arr2.money)) {
                    view.money = self.userInfo.arr2.money;
                }else{
                    view.money = @"0.00";
                }
                
                TYAlertController *alertController = [TYAlertController alertControllerWithAlertView:view preferredStyle:TYAlertControllerStyleAlert transitionAnimation:TYAlertTransitionAnimationScaleFade];
                [self presentViewController:alertController animated:YES completion:nil];
                
            }else if (indexPath.row == 7){
                [self logoutButtonDidClick];
            }
        }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    ETHMeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ETHMeTableViewCellID forIndexPath:indexPath];
        if (indexPath.row == 1) {
            [cell setIcon:[UIImage imageNamed:@"qianbao"] WithText:@"钱包地址"];
        }
        //        else if (indexPath.row == 2){
        //            [cell setIcon:[UIImage imageNamed:@"C2C-1"] WithText:@"C2C订单"];
        //        }
        else if (indexPath.row == 2){
            [cell setIcon:[UIImage imageNamed:@"xiugaimima"] WithText:@"修改密码"];
        }
        if (self.userInfo.member.type == 2||self.userInfo.member.suoding ==1) {//已锁户
            if (indexPath.row == 3) {
                [cell setIcon:[UIImage imageNamed:@"yaoqing"] WithText:@"我的邀请"];
            }else if (indexPath.row == 4) {
                [cell setIcon:[UIImage imageNamed:@"gonggao"] WithText:@"平台公告"];
            }else if (indexPath.row == 5){
                [cell setIcon:[UIImage imageNamed:@"kefu"] WithText:@"联系客服"];
            }else if(indexPath.row == 6){
                [cell setIcon:[UIImage imageNamed:@"touzi"] WithText:@"退出登录"];
            }
        }else{
                if (indexPath.row == 3) {
                    [cell setIcon:[UIImage imageNamed:@"yaoqing"] WithText:@"我的邀请"];
                }else if (indexPath.row == 4) {
                    [cell setIcon:[UIImage imageNamed:@"gonggao"] WithText:@"平台公告"];
                }else if (indexPath.row == 5){
                    [cell setIcon:[UIImage imageNamed:@"kefu"] WithText:@"联系客服"];
                }else if (indexPath.row == 6){
                    [cell setIcon:[UIImage imageNamed:@"touzi"] WithText:@"退出机制"];
                }else if (indexPath.row == 7){
                    [cell setIcon:[UIImage imageNamed:@"touzi"] WithText:@"退出登录"];
                }
            }
    
        return cell;
}
@end
