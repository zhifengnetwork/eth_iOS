//
//  ETHInvestmentRecordTableCell.h
//  ETH
//
//  Created by admin on 2019/4/3.
//  Copyright © 2019 admin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ETHTeamModel.h"

NS_ASSUME_NONNULL_BEGIN

/**
 投资记录cell
 */
@interface ETHInvestmentRecordTableCell : UITableViewCell

@property (nonatomic,strong)ETHTeamModel *teamModel;

@end

NS_ASSUME_NONNULL_END
