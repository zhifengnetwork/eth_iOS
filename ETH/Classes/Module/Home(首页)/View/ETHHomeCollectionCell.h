//
//  ETHHomeCollectionCell.h
//  ZF
//
//  Created by apple on 08/03/2019.
//  Copyright © 2019 hyy. All rights reserved.
//

#import <UIKit/UIKit.h>


NS_ASSUME_NONNULL_BEGIN

@protocol ETHHomeCollectionCellDelegate <NSObject>

@optional

/**
 投资总额被点击
 */
- (void)ETHHomeCollectionCellDidClick:(NSIndexPath*)indexPath;

@end


/**
 首页CollectionViewCell
 */
@interface ETHHomeCollectionCell : UICollectionViewCell

@property (nonatomic, weak) id<ETHHomeCollectionCellDelegate> delegate;
@property (nonatomic, strong) NSIndexPath *indexPath;

//背景
@property (nonatomic, strong) NSString *backgroundName;
//标题
@property (nonatomic, strong) NSString *title;
//图标
@property (nonatomic, strong) NSString *iconName;

@property (nonatomic, strong) NSString *number;

@end

NS_ASSUME_NONNULL_END
