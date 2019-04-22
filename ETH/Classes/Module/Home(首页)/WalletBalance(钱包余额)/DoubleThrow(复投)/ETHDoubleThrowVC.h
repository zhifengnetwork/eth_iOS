//
//  ETHDoubleThrowVC.h
//  ETH
//
//  Created by admin on 2019/4/10.
//  Copyright © 2019 admin. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

/**
 复投
 */
@interface ETHDoubleThrowVC : UITableViewController

//0:复投账号 1:自由钱包
@property (nonatomic, strong) NSString *type;

@end

NS_ASSUME_NONNULL_END
