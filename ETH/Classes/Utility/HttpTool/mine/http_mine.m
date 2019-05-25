//
//  http_mine.m
//  ETH
//
//  Created by weiming zhang on 2019/4/15.
//  Copyright © 2019 admin. All rights reserved.
//

#import "http_mine.h"

@implementation http_mine
//支付管理信息
+ (void)pay_management:(SuccessData)ReqSuccess failure:(ErrorData)ReqFailure
{
    HttpTool *http = [HttpTool sharedManager];
    NSMutableDictionary *parameters = [[NSMutableDictionary alloc]initWithCapacity:1];
    
    [parameters setObject:@"member.androidapi.pay_management" forKey:@"r"];
    
    NSDictionary* dic = [http hanldeSign:parameters];
    
    NSString* strUrl = [http getMainUrl];
    strUrl = [strUrl stringByAppendingPathComponent:@"app/index.php"];
    [http PostRequest:strUrl Parameters:dic success:ReqSuccess failure:ReqFailure];
}
//我的-支付管理提交|钱包地址
//支付管理提交
+ (void)pay_submit:(NSString *)adress url:(NSString *)url zfbfile:(NSString *)zfbfile wxfile:(NSString *)wxfile bankid:(NSString *)bankid bankname:(NSString *)bankname bank:(NSString *)bank success:(SuccessData)ReqSuccess failure:(ErrorData)ReqFailure
{
    HttpTool *http = [HttpTool sharedManager];
    NSMutableDictionary *parameters = [[NSMutableDictionary alloc]initWithCapacity:1];
    
    if ( !kStringIsEmpty(adress) )
    {
        [parameters setObject:adress forKey:@"adress"];
    }
    if ( !kStringIsEmpty(url) )
    {
        [parameters setObject:url forKey:@"url"];
    }
    if ( !kStringIsEmpty(zfbfile) )
    {
        [parameters setObject:zfbfile forKey:@"zfbfile"];
    }
    if ( !kStringIsEmpty(wxfile) )
    {
        [parameters setObject:wxfile forKey:@"wxfile"];
    }
    if ( !kStringIsEmpty(bankid) )
    {
        [parameters setObject:bankid forKey:@"bankid"];
    }
    if ( !kStringIsEmpty(bankname) )
    {
        [parameters setObject:bankname forKey:@"bankname"];
    }
    if ( !kStringIsEmpty(bank) )
    {
        [parameters setObject:bank forKey:@"bank"];
    }
    
    [parameters setObject:@"member.androidapi.pay_submit" forKey:@"r"];
    
    NSDictionary* dic = [http hanldeSign:parameters];
    
    NSString* strUrl = [http getMainUrl];
    strUrl = [strUrl stringByAppendingPathComponent:@"app/index.php"];
    [http PostRequest:strUrl Parameters:dic success:ReqSuccess failure:ReqFailure];
}
//我的-平台公告列表
//系统公告
+ (void)article_getlist:(NSInteger)page success:(SuccessData)ReqSuccess failure:(ErrorData)ReqFailure
{
    HttpTool *http = [HttpTool sharedManager];
    NSMutableDictionary *parameters = [[NSMutableDictionary alloc]initWithCapacity:1];
    
    NSString *str = [NSString stringWithFormat:@"%ld",page];
    [parameters setObject:str forKey:@"page"];
    
    [parameters setObject:@"member.androidapi.article_getlist" forKey:@"r"];
    
    NSDictionary* dic = [http hanldeSign:parameters];
    
    NSString* strUrl = [http getMainUrl];
    strUrl = [strUrl stringByAppendingPathComponent:@"app/index.php"];
    [http PostRequest:strUrl Parameters:dic success:ReqSuccess failure:ReqFailure];
}

//平台公告详情
//aid 文章id
+(void)article_detail:(NSInteger)aid success:(SuccessData)ReqSuccess failure:(ErrorData)ReqFailure{
    HttpTool *http = [HttpTool sharedManager];
    NSMutableDictionary *parameters = [[NSMutableDictionary alloc]initWithCapacity:1];
    
    NSString *str = [NSString stringWithFormat:@"%ld",aid];
    [parameters setObject:str forKey:@"aid"];
    
    [parameters setObject:@"member.androidapi.article_detail" forKey:@"r"];
    
    NSDictionary* dic = [http hanldeSign:parameters];
    
    NSString* strUrl = [http getMainUrl];
    strUrl = [strUrl stringByAppendingPathComponent:@"app/index.php"];
    [http PostRequest:strUrl Parameters:dic success:ReqSuccess failure:ReqFailure];
}

//ether获取ETH实时价格
+(void)ether:(SuccessData)ReqSuccess failure:(ErrorData)ReqFailure{
    HttpTool *http = [HttpTool sharedManager];
    NSMutableDictionary *parameters = [[NSMutableDictionary alloc]initWithCapacity:1];
    
    [parameters setObject:@"member.androidapi.ether" forKey:@"r"];
    
    NSDictionary* dic = [http hanldeSign:parameters];
    
    NSString* strUrl = [http getMainUrl];
    strUrl = [strUrl stringByAppendingPathComponent:@"app/index.php"];
    [http PostRequest:strUrl Parameters:dic success:ReqSuccess failure:ReqFailure];
}

//用户等级提升
+(void)lingdaolevel:(SuccessData)ReqSuccess failure:(ErrorData)ReqFailure{
    HttpTool *http = [HttpTool sharedManager];
    NSMutableDictionary *parameters = [[NSMutableDictionary alloc]initWithCapacity:1];
    
    [parameters setObject:@"member.androidapi.lingdaolevel" forKey:@"r"];
    
    NSDictionary* dic = [http hanldeSign:parameters];
    
    NSString* strUrl = [http getMainUrl];
    strUrl = [strUrl stringByAppendingPathComponent:@"app/index.php"];
    [http PostRequest:strUrl Parameters:dic success:ReqSuccess failure:ReqFailure];
}

//我的-退出机制
//钱包总记录
+(void)out:(NSString*)money success:(SuccessData)ReqSuccess failure:(ErrorData)ReqFailure
{
    HttpTool *http = [HttpTool sharedManager];
    NSMutableDictionary *parameters = [[NSMutableDictionary alloc]initWithCapacity:1];
    
    if ( !kStringIsEmpty(money) )
    {
        [parameters setObject:money forKey:@"money"];
    }
    
    [parameters setObject:@"member.androidapi.out" forKey:@"r"];
    
    NSDictionary* dic = [http hanldeSign:parameters];
    
    NSString* strUrl = [http getMainUrl];
    strUrl = [strUrl stringByAppendingPathComponent:@"app/index.php"];
    [http PostRequest:strUrl Parameters:dic success:ReqSuccess failure:ReqFailure];
}
//我的-我的邀请
+(void)qrcode:(SuccessData)ReqSuccess failure:(ErrorData)ReqFailure{
    HttpTool *http = [HttpTool sharedManager];
    NSMutableDictionary *parameters = [[NSMutableDictionary alloc]initWithCapacity:1];
    
    [parameters setObject:@"commission.qrcode" forKey:@"r"];
    
    NSDictionary* dic = [http hanldeSign:parameters];
    
    NSString* strUrl = [http getMainUrl];
    strUrl = [strUrl stringByAppendingPathComponent:@"app/index.php"];
    [http PostRequest:strUrl Parameters:dic success:ReqSuccess failure:ReqFailure];
}
//我的-获取手机号
+(void)get_mobile:(SuccessData)ReqSuccess failure:(ErrorData)ReqFailure
{
    HttpTool *http = [HttpTool sharedManager];
    NSMutableDictionary *parameters = [[NSMutableDictionary alloc]initWithCapacity:1];
    
    [parameters setObject:@"member.androidapi.get_mobile" forKey:@"r"];
    
    NSDictionary* dic = [http hanldeSign:parameters];
    
    NSString* strUrl = [http getMainUrl];
    strUrl = [strUrl stringByAppendingPathComponent:@"app/index.php"];
    [http PostRequest:strUrl Parameters:dic success:ReqSuccess failure:ReqFailure];
}
/**
 我的-发送短信
 @param mobile 手机号
 @param temp sms_changepwd更改密码，sms_reg注册，sms_forget
 @param imgcode 传0
 */
+(void)verifycode:(NSString*)mobile temp:(NSString*)temp imgcode:(NSString*)imgcode success:(SuccessData)ReqSuccess failure:(ErrorData)ReqFailure
{
    HttpTool *http = [HttpTool sharedManager];
    NSMutableDictionary *parameters = [[NSMutableDictionary alloc]initWithCapacity:1];
    
    if ( !kStringIsEmpty(mobile) )
    {
        [parameters setObject:mobile forKey:@"mobile"];
    }
    
    if ( !kStringIsEmpty(temp) )
    {
        [parameters setObject:temp forKey:@"temp"];
    }
    if ( !kStringIsEmpty(imgcode) )
    {
        [parameters setObject:imgcode forKey:@"imgcode"];
    }
    [parameters setObject:@"member.androidapi.verifycode" forKey:@"r"];
    
    NSDictionary* dic = [http hanldeSign:parameters];
    
    NSString* strUrl = [http getMainUrl];
    strUrl = [strUrl stringByAppendingPathComponent:@"app/index.php"];
    [http PostRequest:strUrl Parameters:dic success:ReqSuccess failure:ReqFailure];
}
/**
 注册账号或者找回密码
 @param type 找回密码sms_changepwd 注册账号sms_reg
 @param mobile 手机号
 @param code 验证码
 @param pwd 密码
 */
+(void)reg_updpwd:(NSString*)type mobile:(NSString*)mobile code:(NSInteger)code pwd:(NSString*)pwd success:(SuccessData)ReqSuccess failure:(ErrorData)ReqFailure
{
    HttpTool *http = [HttpTool sharedManager];
    NSMutableDictionary *parameters = [[NSMutableDictionary alloc]initWithCapacity:1];
    
    if ( !kStringIsEmpty(type) )
    {
        [parameters setObject:type forKey:@"type"];
    }
    if ( !kStringIsEmpty(mobile) )
    {
        [parameters setObject:mobile forKey:@"mobile"];
    }
    NSString *str = [NSString stringWithFormat:@"%ld",code];
    [parameters setObject:str forKey:@"code"];
    if ( !kStringIsEmpty(pwd) )
    {
        [parameters setObject:pwd forKey:@"pwd"];
    }
    [parameters setObject:@"member.androidapi.reg_updpwd" forKey:@"r"];
    
    NSDictionary* dic = [http hanldeSign:parameters];
    
    NSString* strUrl = [http getMainUrl];
    strUrl = [strUrl stringByAppendingPathComponent:@"app/index.php"];
    [http PostRequest:strUrl Parameters:dic success:ReqSuccess failure:ReqFailure];
}
//获取手续费
+(void)get_sxf:(SuccessData)ReqSuccess failure:(ErrorData)ReqFailure
{
    HttpTool *http = [HttpTool sharedManager];
    NSMutableDictionary *parameters = [[NSMutableDictionary alloc]initWithCapacity:1];
    
    [parameters setObject:@"member.androidapi.get_sxf" forKey:@"r"];
    
    NSDictionary* dic = [http hanldeSign:parameters];
    
    NSString* strUrl = [http getMainUrl];
    strUrl = [strUrl stringByAppendingPathComponent:@"app/index.php"];
    [http PostRequest:strUrl Parameters:dic success:ReqSuccess failure:ReqFailure];
}

/**
 我的-修改密码
 @param mobile 手机号
 @param code 验证码
 @param pwd 密码
 */
+(void)changepwd:(NSString*)mobile code:(NSString*)code pwd:(NSString*)pwd success:(SuccessData)ReqSuccess failure:(ErrorData)ReqFailure
{
    HttpTool *http = [HttpTool sharedManager];
    NSMutableDictionary *parameters = [[NSMutableDictionary alloc]initWithCapacity:5];
    
    if ( !kStringIsEmpty(mobile) )
    {
        [parameters setObject:mobile forKey:@"mobile"];
    }
    if ( !kStringIsEmpty(code) )
    {
        [parameters setObject:code forKey:@"code"];
    }
    if ( !kStringIsEmpty(pwd) )
    {
        [parameters setObject:pwd forKey:@"pwd"];
    }
    [parameters setObject:@"member.androidapi.changepwd" forKey:@"r"];
    
    NSDictionary* dic = [http hanldeSign:parameters];
    
    NSString* strUrl = [http getMainUrl];
    strUrl = [strUrl stringByAppendingPathComponent:@"app/index.php"];
    [http PostRequest:strUrl Parameters:dic success:ReqSuccess failure:ReqFailure];
}

@end
