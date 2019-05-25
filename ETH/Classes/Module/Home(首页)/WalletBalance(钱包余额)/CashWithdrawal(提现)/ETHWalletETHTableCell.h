//
//  ETHWalletETHTableCell.h
//  ETH
//
//  Created by admin on 2019/4/11.
//  Copyright © 2019 admin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ETHNoticeModel.h"
NS_ASSUME_NONNULL_BEGIN

@protocol ETHWalletETHTableCellDelegate <NSObject>

@optional

//正在输入中
-(void)ETHWalletETHTableCellInputing:(NSString*)text indexPath:(NSIndexPath*)indexPath;

@end

/**
 ETH提现cell
 */
@interface ETHWalletETHTableCell : UITableViewCell

@property (nonatomic, weak) id<ETHWalletETHTableCellDelegate> delegate;

@property (nonatomic, strong) NSIndexPath *indexPath;

@property (nonatomic, strong) NSString *credit;
@property (nonatomic, strong)ETHNoticeModel *noticeModel;
@end

NS_ASSUME_NONNULL_END
