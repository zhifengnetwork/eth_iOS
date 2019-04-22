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

@property (nonatomic , copy) NSString              * creditmy;
@property (nonatomic , copy) NSString              * money;

@property (nonatomic , copy) NSString              * zfurl;

//当前投资额度
@property (nonatomic , copy) NSString              * credit1;
//复投账户
@property (nonatomic , copy) NSString              * credit4;
//自由钱包
@property (nonatomic , copy) NSString              * credit2;

@end


@interface ETHTZDataModel : NSObject

@property (nonatomic , strong) ETHTZModel * list;

@end

NS_ASSUME_NONNULL_END
