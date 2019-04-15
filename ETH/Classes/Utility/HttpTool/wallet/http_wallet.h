//
//  http_wallet.h
//  ETH
//
//  Created by weiming zhang on 2019/4/15.
//  Copyright © 2019 admin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HttpTool.h"
NS_ASSUME_NONNULL_BEGIN
//我的钱包
@interface http_wallet : NSObject
//我的钱包列表
+(void)my_wallet:(SuccessData)ReqSuccess failure:(ErrorData)ReqFailure;

//钱包提现
//提现
+(void)my_wallet:(NSString*)money success:(SuccessData)ReqSuccess failure:(ErrorData)ReqFailure;

/**
 转账
 @param money 金额
 @param moneysxf 手续费
 @param ID 对方用户id
 */
+(void)zhuangzhangis:(NSString*)money moneysxf:(NSString*)moneysxf ID:(NSInteger)ID success:(SuccessData)ReqSuccess failure:(ErrorData)ReqFailure;

/**
 钱包总记录
 @param type 传6
 @param page 页数
 */
+(void)money_log:(NSInteger)type page:(NSInteger)page success:(SuccessData)ReqSuccess failure:(ErrorData)ReqFailure;
@end

NS_ASSUME_NONNULL_END
