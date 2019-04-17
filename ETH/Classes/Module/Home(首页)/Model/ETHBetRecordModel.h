//
//  ETHBetRecordModel.h
//  ETH
//
//  Created by weiming zhang on 2019/4/17.
//  Copyright © 2019 admin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseListModel.h"

NS_ASSUME_NONNULL_BEGIN
//下注记录
@interface ETHBetRecordModel : NSObject

@property (nonatomic , copy) NSString              * ID;
@property (nonatomic , copy) NSString              * money;
@property (nonatomic , copy) NSString              * createtime;
@property (nonatomic , copy) NSString              * pagesize;
@property (nonatomic , copy) NSString              * total;
@property (nonatomic , copy) NSString              * stakesum;

@property (nonatomic , copy) NSString              * ranking;
@property (nonatomic , copy) NSString              * numberid;
@property (nonatomic , copy) NSString              * number;
@property (nonatomic , copy) NSString              * multiple;
@property (nonatomic , copy) NSString              * thigh;
@property (nonatomic , copy) NSString              *type;
@end

@interface ETHBetRecordListModel : BaseListModel


@end
NS_ASSUME_NONNULL_END
