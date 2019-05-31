//
//  ETHDetailTransaction.h
//  ETH
//
//  Created by weiming zhang on 2019/4/9.
//  Copyright © 2019 admin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ETHC2CModel.h"

NS_ASSUME_NONNULL_BEGIN
//交易详情一部分view
@interface ETHDetailTransactionView : UIView
@property (nonatomic, strong)ETHC2CModel *model;

@property (nonatomic, assign)NSInteger type;//买入卖出

@property (nonatomic, assign)NSInteger status;//判断交易状态
@end

NS_ASSUME_NONNULL_END
