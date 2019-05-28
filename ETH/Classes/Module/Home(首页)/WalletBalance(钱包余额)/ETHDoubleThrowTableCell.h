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

@property (nonatomic, assign)NSInteger type;//type = 1就是已经锁户，type = 2就是复投账户锁户

@end

NS_ASSUME_NONNULL_END
