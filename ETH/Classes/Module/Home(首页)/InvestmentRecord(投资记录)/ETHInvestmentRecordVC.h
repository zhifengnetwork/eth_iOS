//
//  ETHInvestmentRecordVC.h
//  ETH
//
//  Created by admin on 2019/4/3.
//  Copyright © 2019 admin. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

/**
 投资记录
 */
@interface ETHInvestmentRecordVC : UITableViewController

//1投资总额,3查询转币记录,4投资记录,5:C2C交易记录
@property (nonatomic , strong)NSString *type;

@end

NS_ASSUME_NONNULL_END
