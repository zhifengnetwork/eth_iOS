//
//  ETHTradeCell.h
//  ETH
//
//  Created by weiming zhang on 2019/4/8.
//  Copyright © 2019 admin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ETHC2CModel.h"
NS_ASSUME_NONNULL_BEGIN
//交易订单cell
@interface ETHTradeCell : UITableViewCell
//- (void)settransaction: (BOOL)isSell;
- (void)setStatus: (NSString *)status;
@property (nonatomic, strong)ETHC2CModel *model;
@end

NS_ASSUME_NONNULL_END
