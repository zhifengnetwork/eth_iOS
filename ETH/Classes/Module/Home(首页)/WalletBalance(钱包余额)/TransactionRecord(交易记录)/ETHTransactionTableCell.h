//
//  ETHTransactionTableCell.h
//  ETH
//
//  Created by admin on 2019/4/4.
//  Copyright © 2019 admin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ETHTeamModel.h"

NS_ASSUME_NONNULL_BEGIN

/**
 C2C交易记录cell
 */
@interface ETHTransactionTableCell : UITableViewCell

@property (nonatomic,strong)ETHTeamModel *teamModel;

@end

NS_ASSUME_NONNULL_END
