//
//  ETHWalletBalanceVC.h
//  ZF
//
//  Created by admin on 2019/3/19.
//  Copyright © 2019 hyy. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

/**
 钱包余额
 */
@interface ETHWalletBalanceVC : UITableViewController

@property (nonatomic, assign)NSInteger type;//type = 1就是已经锁户，type = 2就是复投账户锁户
@end

NS_ASSUME_NONNULL_END
