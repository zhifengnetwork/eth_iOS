//
//  ETHMultipleTableCell.h
//  ETH
//
//  Created by admin on 2019/4/18.
//  Copyright © 2019 admin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ETH3DhomeModel.h"


NS_ASSUME_NONNULL_BEGIN

/**
 倍数cell
 */
@interface ETHMultipleTableCell : UITableViewCell

@property (nonatomic, strong) ETH3DhomeModel* model;

@property (nonatomic, strong) NSIndexPath* indexPath;

@end

NS_ASSUME_NONNULL_END
