//
//  ETHBetRecordModel.m
//  ETH
//
//  Created by weiming zhang on 2019/4/17.
//  Copyright © 2019 admin. All rights reserved.
//

#import "ETHBetRecordModel.h"
@implementation ETHRankingModel

+ (NSDictionary *)mj_replacedKeyFromPropertyName {
    return @{
             @"ID":@"id"
             };
}
@end

@implementation ETHBetRecordModel
+ (NSDictionary *)mj_objectClassInArray
{
    return @{
             @"today" : @"ETHRankingModel"
             };
}

+ (NSDictionary *)mj_replacedKeyFromPropertyName {
    return @{
             @"ID":@"id"
             };
}
@end

@implementation ETHBetRecordListModel

+ (NSDictionary *)mj_objectClassInArray
{
    return @{
             @"list" : @"ETHBetRecordModel"
             };
}


@end
