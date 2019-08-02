//
//  TabBarControllerConfig1.m
//  ETH
//
//  Created by weiming zhang on 2019/5/27.
//  Copyright © 2019 admin. All rights reserved.
//

#import "TabBarControllerConfig1.h"
#import "BaseNaviViewController.h"

#import "ETHHomeVC.h"
#import "ETHChessCardVC.h"
#import "ETHC2C.h"
#import "ETHMeVC.h"


@interface TabBarControllerConfig1 ()<UITabBarControllerDelegate>

@property (nonatomic, readwrite, strong) BaseTabBarController *tabBarController;

@end


@implementation TabBarControllerConfig1




/**
 *  lazy load tabBarController
 *
 *  @return CYLTabBarController
 */
- (CYLTabBarController *)tabBarController {
    
    if (_tabBarController == nil) {
        /**
         * 以下两行代码目的在于手动设置让TabBarItem只显示图标，不显示文字，并让图标垂直居中。
         * 等效于在 `-tabBarItemsAttributesForController` 方法中不传 `CYLTabBarItemTitle` 字段。
         * 更推荐后一种做法。
         */
        UIEdgeInsets imageInsets = UIEdgeInsetsZero;//UIEdgeInsetsMake(4.5, 0, -4.5, 0);
        UIOffset titlePositionAdjustment = UIOffsetZero;//UIOffsetMake(0, MAXFLOAT);
        
        _tabBarController = [BaseTabBarController tabBarControllerWithViewControllers:self.viewControllers
                                                                tabBarItemsAttributes:self.tabBarItemsAttributesForController
                                                                          imageInsets:imageInsets
                                                              titlePositionAdjustment:titlePositionAdjustment];
        
        // 拿到 TabBar 在拿到相应的item
        UITabBar *tabBar = _tabBarController.tabBar;
        //修改字体颜色
        tabBar.tintColor = [UIColor whiteColor];
        //tabBar.backgroundColor = RGBColorHex(0x5e5d63);
        
        
        //修改背景颜色
        // 设置一个自定义 View,大小等于 tabBar 的大小
        UIView *bgView = [[UIView alloc] initWithFrame:tabBar.bounds];
        // 给自定义 View 设置颜色
        bgView.backgroundColor = RGBColorHex(0x232833);
        // 将自定义 View 添加到 tabBar 上
        [tabBar insertSubview:bgView atIndex:0];
    }
    return _tabBarController;
}


- (NSArray *)viewControllers
{
    ETHHomeVC *firstViewController = [[ETHHomeVC alloc] init];
    UIViewController *firstNavigationController = [[BaseNaviViewController alloc]
                                                   initWithRootViewController:firstViewController];
    
    ETHMeVC *fourthViewController = [[ETHMeVC alloc] init];
    UIViewController *fourthNavigationController = [[BaseNaviViewController alloc]
                                                    initWithRootViewController:fourthViewController];
    
    
    NSArray *viewControllers = @[
                                 firstNavigationController,
                                 fourthNavigationController
                                 ];
    return viewControllers;
    
    
}

- (NSArray *)tabBarItemsAttributesForController
{
    
    NSDictionary *firstTabBarItemsAttributes =
    @{
      CYLTabBarItemTitle : @"首页",
      CYLTabBarItemImage : @"home page1",
      CYLTabBarItemSelectedImage : @"home page",
      };
    
    NSDictionary *fourthTabBarItemsAttributes =
    @{
      CYLTabBarItemTitle : @"我的",
      CYLTabBarItemImage : @"My",
      CYLTabBarItemSelectedImage : @"my1"
      };
    
    NSArray *tabBarItemsAttributes = @[
                                       firstTabBarItemsAttributes,
                                       fourthTabBarItemsAttributes
                                       ];
    
    return tabBarItemsAttributes;
    
}


@end
