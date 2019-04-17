//
//  ETHTZModel.h
//  ETH
//
//  Created by apple on 2019/4/16.
//  Copyright © 2019 admin. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ETHTZModel : NSObject

@property (nonatomic , copy) NSString              * wx;
@property (nonatomic , copy) NSString              * weixinfile;
@property (nonatomic , copy) NSString              * add;
@property (nonatomic , copy) NSString              * bibi;
@property (nonatomic , copy) NSString              * credit1;

@property (nonatomic , copy) NSString              * creditmy;
@property (nonatomic , copy) NSString              * money;

@end


@interface ETHTZDataModel : NSObject

@property (nonatomic , strong) ETHTZModel * list;

@end

NS_ASSUME_NONNULL_END
