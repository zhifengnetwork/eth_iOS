//
//  ETH3DhomeModel.m
//  ETH
//
//  Created by admin on 2019/4/22.
//  Copyright © 2019 admin. All rights reserved.
//

#import "ETH3DhomeModel.h"

@implementation ETH3DhomeModel


-(NSString*)getListString
{
    return [NSString stringWithFormat:@"%@,%@",_number,_price];
}

@end
