//
//  ETHSelectPayButton.h
//  ETH
//
//  Created by weiming zhang on 2019/4/22.
//  Copyright © 2019 admin. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
//下拉框
@interface ETHSelectPayButton : UIButton
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSArray *list;
- (void)setupDefaultTable;
- (void)setTitle:(NSString*)title List:(NSArray *)list;
@end

NS_ASSUME_NONNULL_END
