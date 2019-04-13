//
//  ETHBetNumberCollectionCell.h
//  ZF
//
//  Created by apple on 08/03/2019.
//  Copyright © 2019 hyy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseCollectionCell.h"


NS_ASSUME_NONNULL_BEGIN

@protocol ETHBetNumberCollectionCellDelegate <NSObject>

@optional

/**
 下注数被点击
 */
- (void)ETHBetNumberCollectionCellDidClick:(NSIndexPath*)indexPath;

@end


/**
 下注数CollectionViewCell
 */
@interface ETHBetNumberCollectionCell : UICollectionViewCell

@property (nonatomic, weak) id<ETHBetNumberCollectionCellDelegate> delegate;
@property (nonatomic, strong) NSIndexPath *indexPath;

//标题
@property (nonatomic, strong) NSString *title;


@property (nonatomic, assign) BOOL isSelect;

@end

NS_ASSUME_NONNULL_END
