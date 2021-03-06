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
@property (nonatomic , copy)NSString *openid2;
@property (nonatomic , copy)NSString *createtime;

@property (nonatomic , copy)NSString *title;
@property (nonatomic , copy)NSString *money;
@property (nonatomic , copy)NSString *money2;
@property (nonatomic , copy)NSString *uniacid;
@property (nonatomic , copy)NSString *RMB;
@property (nonatomic , copy)NSString *realmoney;
@property (nonatomic , copy)NSString *charge;
@property (nonatomic, copy)NSString * shouxufei;
@property (nonatomic, copy)NSString* after_money;
@property (nonatomic, assign)NSInteger type;
@property (nonatomic,copy) NSString *status;
@property (nonatomic,copy) NSString *typec2c;

@property (nonatomic, assign) BOOL isChoice;

@end

@interface ETHTeamListModel : BaseListModel


@end

NS_ASSUME_NONNULL_END
