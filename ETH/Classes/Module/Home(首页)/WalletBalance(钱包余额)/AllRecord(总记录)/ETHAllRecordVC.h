//
//  ETHAllRecordVC.h
//  ETH
//
//  Created by weiming zhang on 2019/5/25.
//  Copyright © 2019 admin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DZNEmptyDataSetTVC.h"
#import "ETHTeamModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface ETHAllRecordVC : DZNEmptyDataSetTVC

//1投资总额,3查询转币记录,4投资记录,5:C2C交易记录
@property (nonatomic , strong)NSString *type;
@property (nonatomic,strong)ETHTeamModel *teamModel;

@end

NS_ASSUME_NONNULL_END
