//
//  ETHKeyPackageTableCell.h
//  ETH
//
//  Created by admin on 2019/4/13.
//  Copyright © 2019 admin. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol ETHKeyPackageTableCellDelegate <NSObject>

//按钮被点击 1:确定 2:取消
- (void)ETHKeyPackageTableCellDidClick:(int)type;

@end

/**
 一键包号cell
 */
@interface ETHKeyPackageTableCell : UITableViewCell

@property (nonatomic, weak) id<ETHKeyPackageTableCellDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
