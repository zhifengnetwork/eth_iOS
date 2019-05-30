//
//  ETHQRCodeTableCell.h
//  ETH
//
//  Created by admin on 2019/4/9.
//  Copyright © 2019 admin. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol ETHQRCodeTableCellDelegate <NSObject>

- (void)ETHQRCodeTableCellDidClick;

@end

/**
 二维码cell
 */
@interface ETHQRCodeTableCell : UITableViewCell

@property (nonatomic, strong) NSString *title;

@property (nonatomic, strong) NSString *iconName;

@property (nonatomic, assign) BOOL isClick;

@property (nonatomic, copy)NSString *img;

@property (nonatomic, weak) id<ETHQRCodeTableCellDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
