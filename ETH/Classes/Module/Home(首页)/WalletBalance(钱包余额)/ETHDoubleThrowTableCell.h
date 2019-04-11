//
//  ETHDoubleThrowTableCell.h
//  ETH
//
//  Created by admin on 2019/4/9.
//  Copyright © 2019 admin. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol ETHDoubleThrowTableCellDelegate <NSObject>

//按钮被点击 1:一键复投 2:棋牌娱乐
- (void)ETHDoubleThrowTableCellDidClick:(int)type;

@end

/**
 一键复投cell
 */
@interface ETHDoubleThrowTableCell : UITableViewCell

@property (nonatomic, weak) id<ETHDoubleThrowTableCellDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
