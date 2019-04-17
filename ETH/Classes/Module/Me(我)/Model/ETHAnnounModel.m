//
//  ETHAnnounModel.m
//  ETH
//
//  Created by admin on 2019/4/16.
//  Copyright © 2019 admin. All rights reserved.
//

#import "ETHAnnounModel.h"

@implementation ETHAnnounModel

+ (NSDictionary *)mj_replacedKeyFromPropertyName {
    return @{
             @"ID":@"id"
             };
}

@end


@implementation ETHAnnounListModel

+ (NSDictionary *)mj_objectClassInArray
{
    return @{
             @"list" : @"ETHAnnounModel"
             };
}

@end
@implementation ArticleModel

+ (NSDictionary *)mj_replacedKeyFromPropertyName
{
    return @{
             @"ID":@"id"
             };
}

@end

@implementation CategorysModel

+ (NSDictionary *)mj_replacedKeyFromPropertyName
{
    return @{
             @"ID":@"id"
             };
}

@end

@implementation ArticlesModel

+ (NSDictionary *)mj_replacedKeyFromPropertyName
{
    return @{
             @"ID":@"id"
             };
}


@end
