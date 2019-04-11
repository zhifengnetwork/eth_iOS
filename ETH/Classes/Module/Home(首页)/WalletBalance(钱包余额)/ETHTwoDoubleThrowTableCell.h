//
//  ETHTwoDoubleThrowTableCell.h
//  ETH
//
//  Created by admin on 2019/4/10.
//  Copyright © 2019 admin. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol ETHTwoDoubleThrowTableCellDelegate <NSObject>

//按钮被点击 1:一键复投 2:提现 3:C2C 4:棋牌娱乐 5:互转
- (void)ETHTwoDoubleThrowTableCellDidClick:(int)type;

@end

@interface ETHTwoDoubleThrowTableCell : UITableViewCell

@property (nonatomic, weak) id<ETHTwoDoubleThrowTableCellDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
