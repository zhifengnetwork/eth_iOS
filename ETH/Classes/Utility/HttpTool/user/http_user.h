//
//  http_user.h
//  LS
//
//  Created by apple on 2018/12/31.
//  Copyright © 2018 LS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HttpTool.h"


NS_ASSUME_NONNULL_BEGIN

@interface http_user : NSObject

//用户注册
+(void)signup:(NSString*)username password:(NSString*)password code:(NSString*)code success:(SuccessData)ReqSuccess failure:(ErrorData)ReqFailure;

//用户登录
+(void)login:(NSString*)username password:(NSString*)password success:(SuccessData)ReqSuccess failure:(ErrorData)ReqFailure;

//验证码(短信类型，1注册，2登陆；默认1)
+(void)sendCode:(NSString*)mobile type:(NSString*)type success:(SuccessData)ReqSuccess failure:(ErrorData)ReqFailure;

//获取用户基本信息
+(void)userinfo:(SuccessData)ReqSuccess failure:(ErrorData)ReqFailure;

//激活账户-投资购买
//追加投资接口
//确定购买接口
+(void)payment:(SuccessData)ReqSuccess failure:(ErrorData)ReqFailure;
//上传支付凭证
//file    图片base64
+(void)uploader:(NSString*)file success:(SuccessData)ReqSuccess failure:(ErrorData)ReqFailure;


/**
 @param nickname 昵称
 @param avatar 头像
 */
+(void)face:(NSString*)nickname avatar:(NSString*)avatar success:(SuccessData)ReqSuccess failure:(ErrorData)ReqFailure;
/**
 确定购买
 @param money 追加金额
 @param url 支付凭证
 */
+(void)wechat_complete1:(NSInteger)money url:(NSString*)url success:(SuccessData)ReqSuccess failure:(ErrorData)ReqFailure;
@end

NS_ASSUME_NONNULL_END
