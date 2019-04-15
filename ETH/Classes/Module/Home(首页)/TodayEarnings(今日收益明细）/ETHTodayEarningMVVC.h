//
//  ETHTodayEarningMVVC.h
//  ETH
//
//  Created by weiming zhang on 2019/4/13.
//  Copyright © 2019 admin. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ETHTodayEarningMVVC : UIViewController
@property (nonatomic, assign)NSInteger index;
//收益类型 1:总收益 2:今日收益 
@property (nonatomic , strong)NSString *incomeType;

//类型 : 1直推奖,2管理奖,3领导奖,4总收益
@property (nonatomic , strong)NSString *type;

@end

NS_ASSUME_NONNULL_END
