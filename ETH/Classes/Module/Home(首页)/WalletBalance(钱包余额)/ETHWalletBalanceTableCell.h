//
//  ETHWalletBalanceTableCell.h
//  ETH
//
//  Created by admin on 2019/4/4.
//  Copyright © 2019 admin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ETHTeamModel.h"
NS_ASSUME_NONNULL_BEGIN

/**
 钱包余额cell
 */
@interface ETHWalletBalanceTableCell : UITableViewCell

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, assign) NSInteger type;//1：自由账户，2：复投账户

@property (nonatomic,strong)ETHTeamModel *teamModel;
@end

NS_ASSUME_NONNULL_END
