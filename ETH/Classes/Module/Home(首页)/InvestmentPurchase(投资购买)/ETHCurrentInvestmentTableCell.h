//
//  ETHCurrentInvestmentTableCell.h
//  ETH
//
//  Created by admin on 2019/4/9.
//  Copyright © 2019 admin. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

/**
 当前投资额cell
 */
@interface ETHCurrentInvestmentTableCell : UITableViewCell

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *name;

//是否将金额显示在左边
@property(nonatomic, assign) BOOL isLeftName;

@end

NS_ASSUME_NONNULL_END
