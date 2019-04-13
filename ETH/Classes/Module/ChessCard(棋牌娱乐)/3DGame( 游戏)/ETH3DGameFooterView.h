//
//  ETH3DGameFooterView.h
//  ZF
//
//  Created by admin on 2019/3/27.
//  Copyright © 2019 hyy. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol ETH3DGameFooterViewDelegate <NSObject>

//3D游戏底部
- (void)ETH3DGameFooterViewDidClick;

@end

/**
 3D游戏底部view
 */
@interface ETH3DGameFooterView : UIView

@property (nonatomic, weak) id<ETH3DGameFooterViewDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
