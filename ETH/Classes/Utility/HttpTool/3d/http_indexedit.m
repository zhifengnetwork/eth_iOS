//
//  http_ indexedit.m
//  ETH
//
//  Created by weiming zhang on 2019/4/15.
//  Copyright © 2019 admin. All rights reserved.
//

#import "http_indexedit.h"

@implementation http_indexedit
//3D首页信息接口
+(void)indexedit:(SuccessData)ReqSuccess failure:(ErrorData)ReqFailure
{
    HttpTool *http = [HttpTool sharedManager];
    NSMutableDictionary *parameters = [[NSMutableDictionary alloc]initWithCapacity:1];
    
    [parameters setObject:@"member.androidapi.indexedit" forKey:@"r"];
    
    NSDictionary* dic = [http hanldeSign:parameters];
    
    NSString* strUrl = [http getMainUrl];
    strUrl = [strUrl stringByAppendingPathComponent:@"app/index.php"];
    [http PostRequest:strUrl Parameters:dic success:ReqSuccess failure:ReqFailure];
}
/**
 3D一键包号选注
 获取福彩3D获取一键包号下注列表
 @param minNum 开始数
 @param maxNum 结束数
 @param openid openid
 */
+(void)numberis:(NSInteger)minNum maxNum:(NSInteger)maxNum openid:(NSString*)openid success:(SuccessData)ReqSuccess failure:(ErrorData)ReqFailure
{
    HttpTool *http = [HttpTool sharedManager];
    NSMutableDictionary *parameters = [[NSMutableDictionary alloc]initWithCapacity:1];
    NSString *str = [NSString stringWithFormat:@"%ld",minNum];
    [parameters setObject:str forKey:@"minNum"];
    NSString *str1 = [NSString stringWithFormat:@"%ld",maxNum];
    [parameters setObject:str1 forKey:@"maxNum"];
    
    if ( !kStringIsEmpty(openid) )
    {
        [parameters setObject:openid forKey:@"openid"];
    }
    
    [parameters setObject:@"member.androidapi.numberis" forKey:@"r"];
    
    NSDictionary* dic = [http hanldeSign:parameters];
    
    NSString* strUrl = [http getMainUrl];
    strUrl = [strUrl stringByAppendingPathComponent:@"app/index.php"];
    [http PostRequest:strUrl Parameters:dic success:ReqSuccess failure:ReqFailure];
}
/**
 福彩3D下注接口 分两个流程 确认信息和确认下注
 @param type 1确认信息 获取账号余额信息 2确认下注
 @param payment 支付方式 1自由账户支付 2复投余额支付
 @param money 下注金额
 @param list 下注号码 array([‘111’,’1’],[‘222’,’1’])
 */
+(void)bets:(NSInteger)type payment:(NSInteger)payment money:(NSString*)money list:(NSString*)list success:(SuccessData)ReqSuccess failure:(ErrorData)ReqFailure
{
    HttpTool *http = [HttpTool sharedManager];
    NSMutableDictionary *parameters = [[NSMutableDictionary alloc]initWithCapacity:1];
    NSString *str = [NSString stringWithFormat:@"%ld",type];
    [parameters setObject:str forKey:@"type"];
    NSString *str1 = [NSString stringWithFormat:@"%ld",payment];
    [parameters setObject:str1 forKey:@"payment"];
    
    if ( !kStringIsEmpty(money) )
    {
        [parameters setObject:money forKey:@"money"];
    }
    if ( !kStringIsEmpty(list) )
    {
        [parameters setObject:list forKey:@"list"];
    }
    [parameters setObject:@"member.androidapi.bets" forKey:@"r"];
    
    NSDictionary* dic = [http hanldeSign:parameters];
    
    NSString* strUrl = [http getMainUrl];
    strUrl = [strUrl stringByAppendingPathComponent:@"app/index.php"];
    [http PostRequest:strUrl Parameters:dic success:ReqSuccess failure:ReqFailure];
}
/**
 获取福彩3D下注记录
 @param page 页数
 */
+(void)stakejiluis:(NSInteger)page success:(SuccessData)ReqSuccess failure:(ErrorData)ReqFailure{
    HttpTool *http = [HttpTool sharedManager];
    NSMutableDictionary *parameters = [[NSMutableDictionary alloc]initWithCapacity:1];
    NSString *str = [NSString stringWithFormat:@"%ld",page];
    [parameters setObject:str forKey:@"page"];
    [parameters setObject:@"member.androidapi.stakejiluis" forKey:@"r"];
    
    NSDictionary* dic = [http hanldeSign:parameters];
    
    NSString* strUrl = [http getMainUrl];
    strUrl = [strUrl stringByAppendingPathComponent:@"app/index.php"];
    [http PostRequest:strUrl Parameters:dic success:ReqSuccess failure:ReqFailure];
}
/**
 3D中奖记录
 @param page 页数
 */
+(void)winningrecordis:(NSInteger)page success:(SuccessData)ReqSuccess failure:(ErrorData)ReqFailure
{
    HttpTool *http = [HttpTool sharedManager];
    NSMutableDictionary *parameters = [[NSMutableDictionary alloc]initWithCapacity:1];
    NSString *str = [NSString stringWithFormat:@"%ld",page];
    [parameters setObject:str forKey:@"page"];
    [parameters setObject:@"member.androidapi.winningrecordis" forKey:@"r"];
    
    NSDictionary* dic = [http hanldeSign:parameters];
    
    NSString* strUrl = [http getMainUrl];
    strUrl = [strUrl stringByAppendingPathComponent:@"app/index.php"];
    [http PostRequest:strUrl Parameters:dic success:ReqSuccess failure:ReqFailure];
}
//3D游戏规则
//福彩3D下注接口 分两个流程 确认信息和确认下注
+(void)fucairule:(SuccessData)ReqSuccess failure:(ErrorData)ReqFailure
{
    HttpTool *http = [HttpTool sharedManager];
    NSMutableDictionary *parameters = [[NSMutableDictionary alloc]initWithCapacity:1];
    [parameters setObject:@"member.androidapi.fucairule" forKey:@"r"];
    NSDictionary* dic = [http hanldeSign:parameters];
    
    NSString* strUrl = [http getMainUrl];
    strUrl = [strUrl stringByAppendingPathComponent:@"app/index.php"];
    [http PostRequest:strUrl Parameters:dic success:ReqSuccess failure:ReqFailure];
}
//3D投资排行
//3D投资排行 中奖结果
+(void)fucairanking:(SuccessData)ReqSuccess failure:(ErrorData)ReqFailure
{
    HttpTool *http = [HttpTool sharedManager];
    NSMutableDictionary *parameters = [[NSMutableDictionary alloc]initWithCapacity:1];
    [parameters setObject:@"member.androidapi.fucairanking" forKey:@"r"];
    NSDictionary* dic = [http hanldeSign:parameters];
    
    NSString* strUrl = [http getMainUrl];
    strUrl = [strUrl stringByAppendingPathComponent:@"app/index.php"];
    [http PostRequest:strUrl Parameters:dic success:ReqSuccess failure:ReqFailure];
}
@end
