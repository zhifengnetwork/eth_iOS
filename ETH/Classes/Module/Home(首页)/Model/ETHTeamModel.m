//
//  ETHTeamModel.m
//  ETH
//
//  Created by apple on 2019/4/14.
//  Copyright © 2019 admin. All rights reserved.
//

#import "ETHTeamModel.h"

@implementation ETHTeamModel

+ (NSDictionary *)mj_replacedKeyFromPropertyName {
    return @{
             @"ID":@"id"
             };
}

@end


@implementation ETHTeamListModel

+ (NSDictionary *)mj_objectClassInArray
{
    return @{
             @"list" : @"ETHTeamDetailListModel"
             };
}

@end
