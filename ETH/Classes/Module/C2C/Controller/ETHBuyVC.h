//
//  ETHBuyVC.h
//  ETH
//
//  Created by weiming zhang on 2019/4/4.
//  Copyright © 2019 admin. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ETHBuyVC : UIViewController
@property (nonatomic, assign)NSInteger type;//0买入 1卖出
@property (nonatomic, strong) NSString *name;
@end

NS_ASSUME_NONNULL_END
