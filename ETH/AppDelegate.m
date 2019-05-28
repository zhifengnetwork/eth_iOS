//
//  AppDelegate.m
//  ETH
//
//  Created by admin on 2019/4/3.
//  Copyright © 2019 admin. All rights reserved.
//

#import "AppDelegate.h"
#import "SVProgressHUD.h"
#import "TabBarControllerConfig.h"
#import "TabBarControllerConfig1.h"
#import "BaseNaviViewController.h"
#import "ETHLoginVC.h"
#import "HttpTool.h"
#import "ETHTool.h"
#import "UserInfoModel.h"
#import "http_user.h"
#import "SVProgressHUD.h"
#import "MJExtension.h"
#import <SDWebImage/SDWebImageManager.h>


@interface AppDelegate ()

@property (nonatomic, strong)UserInfoModel *userInfo;
@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    //设置svp最小时间
    [SVProgressHUD setMinimumDismissTimeInterval:1.0f];
    
    //SDWebImage referer(防盗链)
    SDWebImageDownloader *dmanager = [SDWebImageManager sharedManager].imageDownloader;
    [dmanager setValue:MainUrl forHTTPHeaderField:@"referer"];
    
    //设置主域名
    HttpTool *httptool = [HttpTool sharedManager];
    [httptool setMainUrl:MainUrl];
    
    [self to_MainVC];
    [self BaseSetup];
    
    return YES;
}


//加载数据
-(void)loadData
{
    [http_user userinfo:^(id responseObject)
     {
         [self loadData_ok:responseObject];
         
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
    [self to_HomeVC];
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


//跳到登录界面
-(void)to_LoginVC
{
    ETHLoginVC *loginVC = [[ETHLoginVC alloc] init];
    BaseNaviViewController *navController = [[BaseNaviViewController alloc] initWithRootViewController:loginVC];
    self.window.rootViewController = navController;
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
}

//根据用户信息选择主界面
-(void)to_MainVC
{
    //判断用户信息是否存在
    UserInfoModel* userInfo = [UserInfoModel readUserInfo];
    if (kObjectIsEmpty(userInfo))
    {
//        [self to_HomeVC];
        [self to_LoginVC];
    }
    else
    {
        [self loadData];
        [self to_HomeVC];
    }
}

//跳到主界面
-(void)to_HomeVC
{
    if (self.userInfo.member.type == 2||self.userInfo.member.suoding ==1) {
        TabBarControllerConfig1 *tabBarControllerConfig1 = [[TabBarControllerConfig1 alloc] init];
        BaseTabBarController *tabBarController = tabBarControllerConfig1.tabBarController;
        [self.window setRootViewController:tabBarController];
    }else{
        TabBarControllerConfig *tabBarControllerConfig = [[TabBarControllerConfig alloc] init];
        BaseTabBarController *tabBarController = tabBarControllerConfig.tabBarController;
        [self.window setRootViewController:tabBarController];
    }
   
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
}


-(void)BaseSetup
{
    //用户登录注册成功
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handleUserLoginRegisterNotification:) name:UserLoginRegisterNotification object:nil];
    
    //状态栏的文字颜色(Info.plist 文件中添加 View controller-based status bar appearance 设置为 NO)
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
    
    // 导航条上标题的颜色字体
    [UINavigationBar appearance].titleTextAttributes = @{
                                                         NSForegroundColorAttributeName : [UIColor whiteColor],
                                                         NSFontAttributeName : [UIFont systemFontOfSize:18]
                                                         };
    //导航条上UIBarButtonItem颜色
    [UINavigationBar appearance].tintColor = [UIColor whiteColor];
    //导航条的背景颜色
    [[UINavigationBar appearance] setBackgroundImage:[UIImage imageNamed:@"NavigationBar"] forBarPosition:UIBarPositionAny barMetrics:UIBarMetricsDefault];
    
    if (@available(ios 11.0,*)) {
        UIScrollView.appearance.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        UITableView.appearance.estimatedRowHeight = 0;
        UITableView.appearance.estimatedSectionFooterHeight = 0;
        UITableView.appearance.estimatedSectionHeaderHeight = 0;
    }
}


//用户登录注册成功
- (void)handleUserLoginRegisterNotification:(NSNotification *)notification
{
    //进入主界面
    [self loadData];
    [self to_HomeVC];
}

- (UserInfoModel *)userInfo{
    if (_userInfo == nil) {
        _userInfo = [[UserInfoModel alloc]init];
    }return _userInfo;
}
@end
