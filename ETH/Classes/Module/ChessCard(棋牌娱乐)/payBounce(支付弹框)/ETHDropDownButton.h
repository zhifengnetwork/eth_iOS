//
//  ETHDropDownButton.h
//  ETH
//
//  Created by weiming zhang on 2019/4/13.
//  Copyright © 2019 admin. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ETHDropDownButton : UIButton
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSArray *list;
- (void)setupDefaultTable;
- (void)setTitle:(NSString*)title List:(NSArray *)list;

@property (nonatomic, assign) NSInteger index;
@end

NS_ASSUME_NONNULL_END
