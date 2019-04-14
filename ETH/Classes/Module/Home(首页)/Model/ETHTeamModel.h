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

@end


@interface ETHTeamListModel : BaseListModel


@end

NS_ASSUME_NONNULL_END
