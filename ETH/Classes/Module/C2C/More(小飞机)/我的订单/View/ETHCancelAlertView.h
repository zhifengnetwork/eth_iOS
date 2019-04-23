//
//  ETHCancelAlertView.h
//  ETH
//
//  Created by weiming zhang on 2019/4/9.
//  Copyright © 2019 admin. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
//取消交易提示弹窗
@interface ETHCancelAlertView : UIView
- (void)setTitle: (NSString *)title;
@property (nonatomic, strong)NSString *viewID;

@property (nonatomic, assign)BOOL isNOApi;
@end

NS_ASSUME_NONNULL_END
