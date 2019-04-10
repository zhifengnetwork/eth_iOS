//
//  ETHTradeCell.h
//  ETH
//
//  Created by weiming zhang on 2019/4/8.
//  Copyright © 2019 admin. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ETHTradeCell : UITableViewCell
- (void)settransaction: (BOOL)isSell;
- (void)setStatus: (NSString *)status;
@end

NS_ASSUME_NONNULL_END
