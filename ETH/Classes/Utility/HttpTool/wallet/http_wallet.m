//
//  http_wallet.m
//  ETH
//
//  Created by weiming zhang on 2019/4/15.
//  Copyright © 2019 admin. All rights reserved.
//

#import "http_wallet.h"

@implementation http_wallet
//我的钱包列表
+ (void)my_wallet:(SuccessData)ReqSuccess failure:(ErrorData)ReqFailure
{
    
    HttpTool *http = [HttpTool sharedManager];
    NSMutableDictionary *parameters = [[NSMutableDictionary alloc]initWithCapacity:1];
    
    [parameters setObject:@"member.androidapi.my_wallet" forKey:@"r"];
    
    NSDictionary* dic = [http hanldeSign:parameters];
    
    NSString* strUrl = [http getMainUrl];
    strUrl = [strUrl stringByAppendingPathComponent:@"app/index.php"];
    [http PostRequest:strUrl Parameters:dic success:ReqSuccess failure:ReqFailure];
}
//提现
+ (void)my_wallet:(NSString *)money success:(SuccessData)ReqSuccess failure:(ErrorData)ReqFailure
{
    HttpTool *http = [HttpTool sharedManager];
    NSMutableDictionary *parameters = [[NSMutableDictionary alloc]initWithCapacity:1];
    
    if ( !kStringIsEmpty(money) )
    {
        [parameters setObject:money forKey:@"money"];
    }
    [parameters setObject:@"member.androidapi.submit" forKey:@"r"];
    
    NSDictionary* dic = [http hanldeSign:parameters];
    
    NSString* strUrl = [http getMainUrl];
    strUrl = [strUrl stringByAppendingPathComponent:@"app/index.php"];
    [http PostRequest:strUrl Parameters:dic success:ReqSuccess failure:ReqFailure];
}
/**
 转账
 @param money 金额
 @param moneysxf 手续费
 @param ID 对方用户id
*/
+ (void)zhuangzhangis:(NSString *)money moneysxf:(NSString *)moneysxf ID:(NSInteger)ID success:(SuccessData)ReqSuccess failure:(ErrorData)ReqFailure
{
    HttpTool *http = [HttpTool sharedManager];
    NSMutableDictionary *parameters = [[NSMutableDictionary alloc]initWithCapacity:1];

    if ( !kStringIsEmpty(money) )
    {
        [parameters setObject:money forKey:@"money"];
    }
    if ( !kStringIsEmpty(moneysxf) )
    {
        [parameters setObject:moneysxf forKey:@"moneysxf"];
    }
    NSString *str = [NSString stringWithFormat:@"%ld",ID];
    [parameters setObject:str forKey:@"ID"];
    
    [parameters setObject:@"member.androidapi.zhuangzhangis" forKey:@"r"];
    
    NSDictionary* dic = [http hanldeSign:parameters];
    
    NSString* strUrl = [http getMainUrl];
    strUrl = [strUrl stringByAppendingPathComponent:@"app/index.php"];
    [http PostRequest:strUrl Parameters:dic success:ReqSuccess failure:ReqFailure];
}
/**
 钱包总记录
 @param type 传6
 @param page 页数
 */
+(void)money_log:(NSInteger)type page:(NSInteger)page success:(SuccessData)ReqSuccess failure:(ErrorData)ReqFailure
{
    HttpTool *http = [HttpTool sharedManager];
    NSMutableDictionary *parameters = [[NSMutableDictionary alloc]initWithCapacity:1];
    
    NSString *str = [NSString stringWithFormat:@"%ld",type];
    [parameters setObject:str forKey:@"type"];
    NSString *str1 = [NSString stringWithFormat:@"%ld",page];
    [parameters setObject:str1 forKey:@"page"];
    
    [parameters setObject:@"member.androidapi.money_log" forKey:@"r"];
    
    NSDictionary* dic = [http hanldeSign:parameters];
    
    NSString* strUrl = [http getMainUrl];
    strUrl = [strUrl stringByAppendingPathComponent:@"app/index.php"];
    [http PostRequest:strUrl Parameters:dic success:ReqSuccess failure:ReqFailure];
}
@end
