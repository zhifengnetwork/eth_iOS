//
//  http_index.m
//  ETH
//
//  Created by apple on 13/04/2019.
//  Copyright © 2019 admin. All rights reserved.
//

#import "http_index.h"

@implementation http_index

//index_api接口
+(void)index_api:(SuccessData)ReqSuccess failure:(ErrorData)ReqFailure
{
    HttpTool *http = [HttpTool sharedManager];
    NSMutableDictionary *parameters = [[NSMutableDictionary alloc]initWithCapacity:1];
    
    NSDictionary* dic = [http hanldeSign:parameters];
    
    NSString* strUrl = [http getMainUrl];
    strUrl = [strUrl stringByAppendingPathComponent:@"app/index.php"];
    [http PostRequest:strUrl Parameters:dic success:ReqSuccess failure:ReqFailure];
}


//我的团队接口
+(void)xiaji_get_list:(NSInteger)page success:(SuccessData)ReqSuccess failure:(ErrorData)ReqFailure
{
    HttpTool *http = [HttpTool sharedManager];
    NSMutableDictionary *parameters = [[NSMutableDictionary alloc]initWithCapacity:1];
    
    NSString *str = [NSString stringWithFormat:@"%ld",page];
    [parameters setObject:str forKey:@"page"];
    
    [parameters setObject:@"member.androidapi.xiaji_get_list" forKey:@"r"];
    
    NSDictionary* dic = [http hanldeSign:parameters];
    
    NSString* strUrl = [http getMainUrl];
    strUrl = [strUrl stringByAppendingPathComponent:@"app/index.php"];
    [http PostRequest:strUrl Parameters:dic success:ReqSuccess failure:ReqFailure];
}

//投资总额-投资记录
+(void)investment_record:(NSInteger)page type:(NSString*)type success:(SuccessData)ReqSuccess failure:(ErrorData)ReqFailure
{
    HttpTool *http = [HttpTool sharedManager];
    NSMutableDictionary *parameters = [[NSMutableDictionary alloc]initWithCapacity:3];
    
    NSString *str = [NSString stringWithFormat:@"%ld",page];
    [parameters setObject:str forKey:@"page"];
    
    if (!kStringIsEmpty(type)) {
        [parameters setObject:type forKey:@"type"];
    }
    
    [parameters setObject:@"member.androidapi.investment_record" forKey:@"r"];
    
    NSDictionary* dic = [http hanldeSign:parameters];
    
    NSString* strUrl = [http getMainUrl];
    strUrl = [strUrl stringByAppendingPathComponent:@"app/index.php"];
    [http PostRequest:strUrl Parameters:dic success:ReqSuccess failure:ReqFailure];
}

//总收益-收益明细
+(void)income_record:(NSString*)type success:(SuccessData)ReqSuccess failure:(ErrorData)ReqFailure
{
    HttpTool *http = [HttpTool sharedManager];
    NSMutableDictionary *parameters = [[NSMutableDictionary alloc]initWithCapacity:3];
    
    if (!kStringIsEmpty(type)) {
        [parameters setObject:type forKey:@"type"];
    }
    
    [parameters setObject:@"member.androidapi.income_record" forKey:@"r"];
    
    NSDictionary* dic = [http hanldeSign:parameters];
    
    NSString* strUrl = [http getMainUrl];
    strUrl = [strUrl stringByAppendingPathComponent:@"app/index.php"];
    [http PostRequest:strUrl Parameters:dic success:ReqSuccess failure:ReqFailure];
}

//钱包转账
+(void)zhuangzhangis:(NSString*)money moneysxf:(NSString*)moneysxf ID:(NSString*)ID success:(SuccessData)ReqSuccess failure:(ErrorData)ReqFailure
{
    HttpTool *http = [HttpTool sharedManager];
    NSMutableDictionary *parameters = [[NSMutableDictionary alloc]initWithCapacity:3];
    
    if (!kStringIsEmpty(money)) {
        [parameters setObject:money forKey:@"money"];
    }
    
    if (!kStringIsEmpty(moneysxf)) {
        [parameters setObject:moneysxf forKey:@"moneysxf"];
    }
    
    if (!kStringIsEmpty(ID)) {
        [parameters setObject:ID forKey:@"id"];
    }
    
    [parameters setObject:@"member.androidapi.zhuangzhangis" forKey:@"r"];
    
    NSDictionary* dic = [http hanldeSign:parameters];
    
    NSString* strUrl = [http getMainUrl];
    strUrl = [strUrl stringByAppendingPathComponent:@"app/index.php"];
    [http PostRequest:strUrl Parameters:dic success:ReqSuccess failure:ReqFailure];
}


/**
 今日收益-收益明细
 
 @param type 类型 : 1直推奖,2管理奖,3领导奖,4总收益
 */
+(void)today_record:(NSString*)type success:(SuccessData)ReqSuccess failure:(ErrorData)ReqFailure
{
    HttpTool *http = [HttpTool sharedManager];
    NSMutableDictionary *parameters = [[NSMutableDictionary alloc]initWithCapacity:3];
    
    if (!kStringIsEmpty(type)) {
        [parameters setObject:type forKey:@"type"];
    }
    
    [parameters setObject:@"member.androidapi.today_record" forKey:@"r"];
    
    NSDictionary* dic = [http hanldeSign:parameters];
    
    NSString* strUrl = [http getMainUrl];
    strUrl = [strUrl stringByAppendingPathComponent:@"app/index.php"];
    [http PostRequest:strUrl Parameters:dic success:ReqSuccess failure:ReqFailure];
}


@end
