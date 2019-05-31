//
//  ETHTradingVC.h
//  ETH
//
//  Created by weiming zhang on 2019/4/20.
//  Copyright © 2019 admin. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
//交易中页面
@interface ETHTradingVC : UIViewController
@property (nonatomic, strong)NSString *vcID;

@property (nonatomic, assign)NSInteger type;//买入卖出
@end

NS_ASSUME_NONNULL_END
