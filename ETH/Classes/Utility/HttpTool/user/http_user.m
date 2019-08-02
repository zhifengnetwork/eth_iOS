//
//  http_user.m
//  LS
//
//  Created by apple on 2018/12/31.
//  Copyright © 2018 LS. All rights reserved.
//

#import "http_user.h"


@implementation http_user

//用户注册
+(void)signup:(NSString*)username password:(NSString*)password code:(NSString*)code success:(SuccessData)ReqSuccess failure:(ErrorData)ReqFailure
{
    HttpTool *http = [HttpTool sharedManager];
    NSMutableDictionary *parameters = [[NSMutableDictionary alloc]initWithCapacity:3];
    
    if ( !kStringIsEmpty(username) )
    {
        [parameters setObject:username forKey:@"username"];
    }
    
    if ( !kStringIsEmpty(password) )
    {
        [parameters setObject:password forKey:@"password"];
    }
    
    if ( !kStringIsEmpty(code) )
    {
        [parameters setObject:code forKey:@"code"];
    }
    
    NSDictionary* dic = [http hanldeSign:parameters];
    
    NSString* strUrl = [http getMainUrl];
    strUrl = [strUrl stringByAppendingPathComponent:@"api/signup"];
    [http PostRequest:strUrl Parameters:dic success:ReqSuccess failure:ReqFailure];
}

//用户登录
+(void)login:(NSString*)username password:(NSString*)password success:(SuccessData)ReqSuccess failure:(ErrorData)ReqFailure
{
    HttpTool *http = [HttpTool sharedManager];
    NSMutableDictionary *parameters = [[NSMutableDictionary alloc]initWithCapacity:2];
    
    if ( !kStringIsEmpty(username) )
    {
        [parameters setObject:username forKey:@"mobile"];
    }
    
    if ( !kStringIsEmpty(password) )
    {
        [parameters setObject:password forKey:@"pwd"];
    }
    
    [parameters setObject:@"member.androidapi.login" forKey:@"r"];
    
    NSDictionary* dic = [http hanldeSign:parameters];
    
    NSString* strUrl = [http getMainUrl];
    strUrl = [strUrl stringByAppendingPathComponent:@"app/index.php"];
    [http PostRequest:strUrl Parameters:dic success:ReqSuccess failure:ReqFailure];
}

//验证码(短信类型，1注册，2登陆；默认1)
+(void)sendCode:(NSString*)mobile type:(NSString*)type success:(SuccessData)ReqSuccess failure:(ErrorData)ReqFailure
{
    HttpTool *http = [HttpTool sharedManager];
    NSMutableDictionary *parameters = [[NSMutableDictionary alloc]initWithCapacity:2];
    
    if ( !kStringIsEmpty(mobile) )
    {
        [parameters setObject:mobile forKey:@"mobile"];
    }
    
    if ( !kStringIsEmpty(type) )
    {
        [parameters setObject:type forKey:@"type"];
    }
    
    NSDictionary* dic = [http hanldeSign:parameters];
    
    NSString* strUrl = [http getMainUrl];
    strUrl = [strUrl stringByAppendingPathComponent:@"api/sendCode"];
    [http PostRequest:strUrl Parameters:dic success:ReqSuccess failure:ReqFailure];
}

//获取用户基本信息
+(void)userinfo:(SuccessData)ReqSuccess failure:(ErrorData)ReqFailure
{
    HttpTool *http = [HttpTool sharedManager];
    NSMutableDictionary *parameters = [[NSMutableDictionary alloc]initWithCapacity:1];
    
    [parameters setObject:@"member.androidapi.my_info" forKey:@"r"];
    
    NSDictionary* dic = [http hanldeSign:parameters];
    
    NSString* strUrl = [http getMainUrl];
    strUrl = [strUrl stringByAppendingPathComponent:@"app/index.php"];
    [http PostRequest:strUrl Parameters:dic success:ReqSuccess failure:ReqFailure];
    
}
//激活账户-投资购买
//追加投资接口
//确定购买接口
+ (void)payment:(SuccessData)ReqSuccess failure:(ErrorData)ReqFailure
{
    HttpTool *http = [HttpTool sharedManager];
    NSMutableDictionary *parameters = [[NSMutableDictionary alloc]initWithCapacity:1];
    
    [parameters setObject:@"member.androidapi.payment" forKey:@"r"];
    
    NSDictionary* dic = [http hanldeSign:parameters];
    
    NSString* strUrl = [http getMainUrl];
    strUrl = [strUrl stringByAppendingPathComponent:@"app/index.php"];
    [http PostRequest:strUrl Parameters:dic success:ReqSuccess failure:ReqFailure];
}
//上传支付凭证
//file    图片base64
+(void) uploader:(NSString*)file success:(SuccessData)ReqSuccess failure:(ErrorData)ReqFailure
{
    HttpTool *http = [HttpTool sharedManager];
    NSMutableDictionary *parameters = [[NSMutableDictionary alloc]initWithCapacity:1];
    if ( !kStringIsEmpty(file) )
    {
        [parameters setObject:file forKey:@"file"];
    }
    [parameters setObject:@"member.androidapi.new_file_upload" forKey:@"r"];
    
    NSDictionary* dic = [http hanldeSign:parameters];
    
    NSString* strUrl = [http getMainUrl];
    strUrl = [strUrl stringByAppendingPathComponent:@"app/index.php"];
    [http PostRequest:strUrl Parameters:dic success:ReqSuccess failure:ReqFailure];

}

/**
 @param nickname 昵称
 @param avatar 头像
 */
+(void)face:(NSString*)nickname avatar:(NSString*)avatar success:(SuccessData)ReqSuccess failure:(ErrorData)ReqFailure{
    
    HttpTool *http = [HttpTool sharedManager];
    NSMutableDictionary *parameters = [[NSMutableDictionary alloc]initWithCapacity:1];
    
    if ( !kStringIsEmpty(nickname) )
    {
        [parameters setObject:nickname forKey:@"nickname"];
    }
    if ( !kStringIsEmpty(avatar) )
    {
        [parameters setObject:avatar forKey:@"avatar"];
    }
    [parameters setObject:@"member.androidapi.face" forKey:@"r"];
    
    NSDictionary* dic = [http hanldeSign:parameters];
    
    NSString* strUrl = [http getMainUrl];
    strUrl = [strUrl stringByAppendingPathComponent:@"app/index.php"];
    [http PostRequest:strUrl Parameters:dic success:ReqSuccess failure:ReqFailure];
}

/**
 确定购买
 @param money 追加金额
 @param url 支付凭证
 */
+(void)wechat_complete1:(NSInteger)money url:(NSString*)url success:(SuccessData)ReqSuccess failure:(ErrorData)ReqFailure
{
    HttpTool *http = [HttpTool sharedManager];
    NSMutableDictionary *parameters = [[NSMutableDictionary alloc]initWithCapacity:1];
    NSString *str = [NSString stringWithFormat:@"%ld",money];
    [parameters setObject:str forKey:@"money"];
    if ( !kStringIsEmpty(url) )
    {
        [parameters setObject:url forKey:@"url"];
    }
    [parameters setObject:@"member.androidapi.wechat_complete1" forKey:@"r"];
    
    NSDictionary* dic = [http hanldeSign:parameters];
    
    NSString* strUrl = [http getMainUrl];
    strUrl = [strUrl stringByAppendingPathComponent:@"app/index.php"];
    [http PostRequest:strUrl Parameters:dic success:ReqSuccess failure:ReqFailure];
}
@end
