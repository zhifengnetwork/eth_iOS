//
//  ETHCashWithdrAmountTableCell.h
//  ETH
//
//  Created by admin on 2019/4/11.
//  Copyright © 2019 admin. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol ETHCashWithdrAmountTableCellDelegate <NSObject>

@optional

//正在输入中
-(void)ETHCashWithdrAmountTableCellInputing:(NSString*)text indexPath:(NSIndexPath*)indexPath;

-(void)ETHCashWithdrAmountTableCellInputing2:(NSString*)text indexPath:(NSIndexPath*)indexPath;

@end

/**
 提现金额cell
 */
@interface ETHCashWithdrAmountTableCell : UITableViewCell

@property (nonatomic, weak) id<ETHCashWithdrAmountTableCellDelegate> delegate;

@property (nonatomic, strong) NSIndexPath *indexPath;

@end

NS_ASSUME_NONNULL_END
