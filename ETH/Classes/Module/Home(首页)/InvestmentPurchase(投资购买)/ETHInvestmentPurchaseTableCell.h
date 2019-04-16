//
//  ETHInvestmentPurchaseTableCell.h
//  ETH
//
//  Created by admin on 2019/4/3.
//  Copyright © 2019 admin. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol ETHInvestmentPurchaseTableCellDelegate <NSObject>

@optional

//正在输入中
-(void)ETHInvestmentPurchaseTableCellInputing:(NSString*)text indexPath:(NSIndexPath*)indexPath;

@end

/**
 投资购买cell
 */
@interface ETHInvestmentPurchaseTableCell : UITableViewCell

@property (nonatomic, weak) id<ETHInvestmentPurchaseTableCellDelegate> delegate;

@property (nonatomic, strong) NSIndexPath *indexPath;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *name;

@property (nonatomic, assign) BOOL isInput;

@end

NS_ASSUME_NONNULL_END
