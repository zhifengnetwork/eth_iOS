//
//  http_ indexedit.h
//  ETH
//
//  Created by weiming zhang on 2019/4/15.
//  Copyright © 2019 admin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HttpTool.h"
NS_ASSUME_NONNULL_BEGIN

@interface http_indexedit : NSObject
//3D首页信息接口
+(void)indexedit:(SuccessData)ReqSuccess failure:(ErrorData)ReqFailure;
/**
 3D一键包号选注
 获取福彩3D获取一键包号下注列表
 @param minNum 开始数
 @param maxNum 结束数
 @param openid openid
 */
+(void)numberis:(NSInteger)minNum maxNum:(NSInteger)maxNum openid:(NSString*)openid success:(SuccessData)ReqSuccess failure:(ErrorData)ReqFailure;
/**
 福彩3D下注接口 分两个流程 确认信息和确认下注
 @param type 1确认信息 获取账号余额信息 2确认下注
 @param payment 支付方式 1自由账户支付 2复投余额支付
 @param money 下注金额
 @param list 下注号码 array([‘111’,’1’],[‘222’,’1’])
 */
+(void)bets:(NSInteger)type payment:(NSInteger)payment money:(NSString*)money list:(NSString*)list success:(SuccessData)ReqSuccess failure:(ErrorData)ReqFailure;
/**
 获取福彩3D下注记录
 @param page 页数
 */
+(void)stakejiluis:(NSInteger)page success:(SuccessData)ReqSuccess failure:(ErrorData)ReqFailure;
/**
 3D中奖记录
 @param page 页数
 */
+(void)winningrecordis:(NSInteger)page success:(SuccessData)ReqSuccess failure:(ErrorData)ReqFailure;
//3D游戏规则
//福彩3D下注接口 分两个流程 确认信息和确认下注
+(void)fucairule:(SuccessData)ReqSuccess failure:(ErrorData)ReqFailure;
//3D投资排行
//3D投资排行 中奖结果
+(void)fucairanking:(SuccessData)ReqSuccess failure:(ErrorData)ReqFailure;
@end

NS_ASSUME_NONNULL_END
