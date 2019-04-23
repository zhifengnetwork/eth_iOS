//
//  ETH3DhomeModel.h
//  ETH
//
//  Created by admin on 2019/4/22.
//  Copyright © 2019 admin. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ETH3DhomeModel : NSObject

//单注多少钱
@property (nonatomic, copy) NSString *price;
//号码
@property (nonatomic, copy) NSString *number;
//期号
@property (nonatomic, copy) NSString *time;


-(NSString*)getListString;

@end

NS_ASSUME_NONNULL_END
