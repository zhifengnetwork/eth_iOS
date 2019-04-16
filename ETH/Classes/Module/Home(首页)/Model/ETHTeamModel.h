//
//  ETHTeamModel.h
//  ETH
//
//  Created by apple on 2019/4/14.
//  Copyright © 2019 admin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseListModel.h"


NS_ASSUME_NONNULL_BEGIN

//我的团队model
@interface ETHTeamModel : NSObject

@property (nonatomic , copy)NSString *ID;
@property (nonatomic , copy)NSString *mobile;
@property (nonatomic , copy)NSString *nickname;
@property (nonatomic , copy)NSString *openid;
@property (nonatomic , copy)NSString *createtime;

@property (nonatomic , copy)NSString *title;
@property (nonatomic , copy)NSString *money;
@property (nonatomic , copy)NSString *money2;
@property (nonatomic , copy)NSString *uniacid;

@property (nonatomic , copy)NSString *credit4;
@property (nonatomic , copy)NSString *credit2;
@end
@interface ETHTeamDetailListModel : BaseListModel

@end

@interface ETHTeamListModel : BaseListModel


@end

NS_ASSUME_NONNULL_END
