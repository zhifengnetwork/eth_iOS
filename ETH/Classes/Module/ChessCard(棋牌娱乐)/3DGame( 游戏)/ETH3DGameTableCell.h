//
//  ETH3DGameTableCell.h
//  ETH
//
//  Created by admin on 2019/4/12.
//  Copyright © 2019 admin. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol ETH3DGameTableCellDelegate <NSObject>

//下注数Cell被点击
- (void)ETH3DGameTableCellDidClick:(int)index indexPath:(NSIndexPath*)indexPath;

@end

/**
 下注数Cell
 */
@interface ETH3DGameTableCell : UITableViewCell

@property (nonatomic, weak) id<ETH3DGameTableCellDelegate> delegate;

@property (nonatomic, strong) NSString *title;

@property (nonatomic, strong) NSIndexPath* indexPath;
@property (nonatomic, assign) int index;

@end

NS_ASSUME_NONNULL_END
