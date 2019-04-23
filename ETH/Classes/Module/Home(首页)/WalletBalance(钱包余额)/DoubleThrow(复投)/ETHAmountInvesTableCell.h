//
//  ETHAmountInvesTableCell.h
//  ETH
//
//  Created by admin on 2019/4/10.
//  Copyright © 2019 admin. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol ETHAmountInvesTableCellDelegate <NSObject>

@optional

//正在输入中
-(void)ETHAmountInvesTableCellInputing:(NSString*)text indexPath:(NSIndexPath*)indexPath;

@end


/**
 复投金额cell
 */
@interface ETHAmountInvesTableCell : UITableViewCell

@property (nonatomic, weak) id<ETHAmountInvesTableCellDelegate> delegate;

-(NSString*)getAmountText;

@end

NS_ASSUME_NONNULL_END
