//
//  ETHListWinnersTableCell.h
//  ETH
//
//  Created by admin on 2019/4/12.
//  Copyright © 2019 admin. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol ETHListWinnersTableCellDelegate <NSObject>

//按钮被点击 1:中奖名单排行 2:游戏规则
- (void)ETHListWinnersTableCellDidClick:(int)type;

@end

/**
 中奖名单排行cell
 */
@interface ETHListWinnersTableCell : UITableViewCell

@property (nonatomic, weak) id<ETHListWinnersTableCellDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
