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

@property (nonatomic, assign)NSInteger type;//type = 1就是已经锁户，type = 2就是复投账户锁户
@end

NS_ASSUME_NONNULL_END
