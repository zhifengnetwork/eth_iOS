//
//  ETHC2CModel.m
//  ETH
//
//  Created by weiming zhang on 2019/4/19.
//  Copyright © 2019 admin. All rights reserved.
//

#import "ETHC2CModel.h"

@implementation ETHC2CModel
+ (NSDictionary *)mj_replacedKeyFromPropertyName {
    return @{
             @"ID":@"id",
             @"mine":@"self"
             };
}

@end

@implementation ETHDetailModel

+ (NSDictionary *)mj_objectClassInArray
{
    return @{
             @"list" : @"ETHC2CModel"
             };
}

@end

@implementation ETHC2CListModel

+ (NSDictionary *)mj_objectClassInArray
{
    return @{
             @"list" : @"ETHC2CModel"
             };
}

@end



