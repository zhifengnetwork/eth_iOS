//
//  ETHOptionButton.h
//  ETH
//
//  Created by weiming zhang on 2019/4/13.
//  Copyright © 2019 admin. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ETHOptionButton;

@protocol ETHOptionButtonDelegate <NSObject>
//确认选项后，如有其它特殊操作，用此代理事件
- (void)didSelectOptionInETHOptionButton:(ETHOptionButton *)optionButton;
@end

@interface ETHOptionButton : UIButton

@property (nonatomic, strong) NSArray *array;
@property (nonatomic, copy, readonly) NSString *title;
@property (nonatomic, assign, readonly) NSInteger row;
@property (nonatomic, weak) id<ETHOptionButtonDelegate> delegate;
@end

