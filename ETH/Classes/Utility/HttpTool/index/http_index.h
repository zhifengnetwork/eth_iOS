//
//  http_index.h
//  ETH
//
//  Created by apple on 13/04/2019.
//  Copyright © 2019 admin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HttpTool.h"


NS_ASSUME_NONNULL_BEGIN

//首页相关
@interface http_index : NSObject

//index_api接口
+(void)index_api:(SuccessData)ReqSuccess failure:(ErrorData)ReqFailure;

//我的团队接口
+(void)xiaji_get_list:(NSInteger)page success:(SuccessData)ReqSuccess failure:(ErrorData)ReqFailure;

//投资总额-投资记录
+(void)investment_record:(NSInteger)page type:(NSString*)type success:(SuccessData)ReqSuccess failure:(ErrorData)ReqFailure;

//总收益-收益明细
+(void)income_record:(NSString*)type success:(SuccessData)ReqSuccess failure:(ErrorData)ReqFailure;

//钱包转账
+(void)zhuangzhangis:(NSString*)money moneysxf:(NSString*)moneysxf ID:(NSString*)ID success:(SuccessData)ReqSuccess failure:(ErrorData)ReqFailure;

@end

NS_ASSUME_NONNULL_END
