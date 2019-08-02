//
//  ETHIncomeModel.h
//  ETH
//
//  Created by admin on 2019/4/15.
//  Copyright © 2019 admin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseListModel.h"


NS_ASSUME_NONNULL_BEGIN

@interface ETHIncomeModel : NSObject

@property (nonatomic , copy)NSString *money;
@property (nonatomic , copy)NSString *nickname;
@property (nonatomic , copy)NSString *createtime;

@property (nonatomic , copy)NSString *title;
@property (nonatomic , copy)NSString *money2;
@property (nonatomic , copy)NSString *uniacid;
@property (nonatomic , copy)NSString *money3;

@end


@interface ETHIncomeListModel : BaseListModel

@property (nonatomic , copy)NSString *money;

@end

NS_ASSUME_NONNULL_END
