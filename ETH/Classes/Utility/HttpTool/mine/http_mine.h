//
//  http_mine.h
//  ETH
//
//  Created by weiming zhang on 2019/4/15.
//  Copyright © 2019 admin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HttpTool.h"
#import "UserInfoModel.h"

NS_ASSUME_NONNULL_BEGIN
//我的
@interface http_mine : NSObject
//支付管理信息
+(void)pay_management:(SuccessData)ReqSuccess failure:(ErrorData)ReqFailure;

//我的-支付管理提交|钱包地址
//支付管理提交
+ (void)pay_submit:(NSString *)adress url:(NSString *)url zfbfile:(NSString *)zfbfile wxfile:(NSString *)wxfile bankid:(NSString *)bankid bankname:(NSString *)bankname bank:(NSString *)bank success:(SuccessData)ReqSuccess failure:(ErrorData)ReqFailure;

//我的-平台公告列表
//系统公告
+(void)article_getlist:(NSInteger)page success:(SuccessData)ReqSuccess failure:(ErrorData)ReqFailure;
//我的-退出机制
//钱包总记录
+(void)out:(NSString*)money success:(SuccessData)ReqSuccess failure:(ErrorData)ReqFailure;
//我的-我的邀请
+(void)qrcode:(SuccessData)ReqSuccess failure:(ErrorData)ReqFailure;
//我的-获取手机号
+(void)get_mobile:(SuccessData)ReqSuccess failure:(ErrorData)ReqFailure;
/**
 我的-发送短信
 @param mobile 手机号
 @param temp sms_changepwd更改密码，sms_reg注册，sms_forget
 @param imgcode 传0
 */
+(void)verifycode:(NSString*)mobile temp:(NSString*)temp imgcode:(NSString*)imgcode success:(SuccessData)ReqSuccess failure:(ErrorData)ReqFailure;
/**
 注册账号或者找回密码
 @param type 找回密码sms_changepwd 注册账号sms_reg
 @param mobile 手机号
 @param code 验证码
 @param pwd 密码
 */
+(void)reg_updpwd:(NSString*)type mobile:(NSString*)mobile code:(NSInteger)code pwd:(NSString*)pwd success:(SuccessData)ReqSuccess failure:(ErrorData)ReqFailure;
//获取手续费
+(void)get_sxf:(SuccessData)ReqSuccess failure:(ErrorData)ReqFailure;


/**
 我的-修改密码
 @param mobile 手机号
 @param code 验证码
 @param pwd 密码
 */
+(void)changepwd:(NSString*)mobile code:(NSString*)code pwd:(NSString*)pwd success:(SuccessData)ReqSuccess failure:(ErrorData)ReqFailure;

@end

NS_ASSUME_NONNULL_END
