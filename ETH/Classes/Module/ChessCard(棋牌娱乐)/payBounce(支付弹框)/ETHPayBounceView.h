//
//  ETHPayBounceView.h
//  ETH
//
//  Created by weiming zhang on 2019/4/13.
//  Copyright © 2019 admin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ETHTZModel.h"

NS_ASSUME_NONNULL_BEGIN

@protocol ETHPayBounceViewDelegate <NSObject>

//3D游戏dlg
- (void)ETHPayBounceViewDidClick:(NSString*)type;

@end


@interface ETHPayBounceView : UIView

@property (nonatomic, weak) id<ETHPayBounceViewDelegate> delegate;

@property (nonatomic , strong)ETHTZDataModel *tz;

@end

NS_ASSUME_NONNULL_END
