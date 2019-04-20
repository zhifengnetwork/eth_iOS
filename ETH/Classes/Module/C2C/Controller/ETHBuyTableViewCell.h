//
//  ETHBuyTableViewCell.h
//  ETH
//
//  Created by weiming zhang on 2019/4/5.
//  Copyright © 2019 admin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ETHC2CModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface ETHBuyTableViewCell : UITableViewCell
- (void)setButton: (NSInteger )type;

@property (nonatomic,strong)ETHC2CModel *c2cModel;
@end

NS_ASSUME_NONNULL_END
