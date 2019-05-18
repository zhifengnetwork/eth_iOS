
//
//  ETHAnnounceModel.m
//  ETH
//
//  Created by weiming zhang on 2019/5/18.
//  Copyright © 2019 admin. All rights reserved.
//

#import "ETHAnnounceModel.h"
@implementation ETHArticleModel
+ (NSDictionary *)mj_replacedKeyFromPropertyName {
    return @{
             @"ID":@"id"
             };
}
@end

@implementation ETHTitleModel
+ (NSDictionary *)mj_replacedKeyFromPropertyName {
    return @{
             @"ID":@"id"
             };
}
@end

@implementation ETHAnnounceModel
+ (NSDictionary *)mj_objectClassInArray
{
    return @{
             @"categorys" : @"ETHTitleModel",
             @"articles" : @"ETHArticleModel"
             };
}

@end

