//
//  http_c2c.m
//  ETH
//
//  Created by weiming zhang on 2019/4/15.
//  Copyright © 2019 admin. All rights reserved.
//

#import "http_c2c.h"

@implementation http_c2c
//c2c挂卖中心
//page 页数
+(void)guamairecordjilu:(NSInteger)page type:(NSString*)type success:(SuccessData)ReqSuccess failure:(ErrorData)ReqFailure
{
    HttpTool *http = [HttpTool sharedManager];
    NSMutableDictionary *parameters = [[NSMutableDictionary alloc]initWithCapacity:1];
 
    NSString *str = [NSString stringWithFormat:@"%ld",page];
    [parameters setObject:str forKey:@"page"];
    
    if ( !kStringIsEmpty(type) )
    {
        [parameters setObject:type forKey:@"type"];
    }
    
    [parameters setObject:@"member.androidapi.guamairecordjilu" forKey:@"r"];
    
    NSDictionary* dic = [http hanldeSign:parameters];
    
    NSString* strUrl = [http getMainUrl];
    strUrl = [strUrl stringByAppendingPathComponent:@"app/index.php"];
    [http PostRequest:strUrl Parameters:dic success:ReqSuccess failure:ReqFailure];
}
/**
 c2c订单中心确认买入或者卖出接口
 @param type     1卖出 0买入
 @param price 买入或者卖出价格
 @param money 买入预付金额或者卖出预获金额
 @param sxf0 手续费
 @param trx 买入或者卖出数量
 @param trx2 卖出所需支付TRX币 ETH
 */
+(void)hangonsale:(NSString*)type price:(NSString*)price money:(NSString*)money sxf0:(NSString*)sxf0 trx:(NSString*)trx trx2:(NSString*)trx2 success:(SuccessData)ReqSuccess failure:(ErrorData)ReqFailure{
    HttpTool *http = [HttpTool sharedManager];
    NSMutableDictionary *parameters = [[NSMutableDictionary alloc]initWithCapacity:1];
    
    if ( !kStringIsEmpty(type) )
    {
        [parameters setObject:type forKey:@"type"];
    }
    if ( !kStringIsEmpty(price) )
    {
        [parameters setObject:price forKey:@"price"];
    }
    if ( !kStringIsEmpty(money) )
    {
        [parameters setObject:money forKey:@"money"];
    }
    if ( !kStringIsEmpty(sxf0) )
    {
        [parameters setObject:sxf0 forKey:@"sxf0"];
    }
    if ( !kStringIsEmpty(trx) )
    {
        [parameters setObject:trx forKey:@"trx"];
    }
    if ( !kStringIsEmpty(trx2) )
    {
        [parameters setObject:trx2 forKey:@"trx2"];
    }
    [parameters setObject:@"member.androidapi.hangonsale" forKey:@"r"];
    
    NSDictionary* dic = [http hanldeSign:parameters];
    
    NSString* strUrl = [http getMainUrl];
    strUrl = [strUrl stringByAppendingPathComponent:@"app/index.php"];
    [http PostRequest:strUrl Parameters:dic success:ReqSuccess failure:ReqFailure];
}
//c2c获取申诉接口
//申诉列表
//page 页数
+(void)guamai_appeal:(NSString*)page success:(SuccessData)ReqSuccess failure:(ErrorData)ReqFailure{
    HttpTool *http = [HttpTool sharedManager];
    NSMutableDictionary *parameters = [[NSMutableDictionary alloc]initWithCapacity:1];
    
    if ( !kStringIsEmpty(page) )
    {
        [parameters setObject:page forKey:@"page"];
    }
    [parameters setObject:@"member.androidapi.guamai_appeal" forKey:@"r"];
    
    NSDictionary* dic = [http hanldeSign:parameters];
    
    NSString* strUrl = [http getMainUrl];
    strUrl = [strUrl stringByAppendingPathComponent:@"app/index.php"];
    [http PostRequest:strUrl Parameters:dic success:ReqSuccess failure:ReqFailure];
}
/**
 c2c订单中心详情接口
 @param ID 订单编号
 @param page 页数
 */
+(void)guamaiedit:(NSString*)ID page:(NSInteger)page success:(SuccessData)ReqSuccess failure:(ErrorData)ReqFailure
{
    HttpTool *http = [HttpTool sharedManager];
    NSMutableDictionary *parameters = [[NSMutableDictionary alloc]initWithCapacity:1];
    
    if ( !kStringIsEmpty(ID) )
    {
        [parameters setObject:ID forKey:@"id"];
    }
    NSString *str = [NSString stringWithFormat:@"%ld",page];
    [parameters setObject:str forKey:@"page"];
    
    [parameters setObject:@"member.androidapi.guamaiedit" forKey:@"r"];
    
    NSDictionary* dic = [http hanldeSign:parameters];
    
    NSString* strUrl = [http getMainUrl];
    strUrl = [strUrl stringByAppendingPathComponent:@"app/index.php"];
    [http PostRequest:strUrl Parameters:dic success:ReqSuccess failure:ReqFailure];
}
/**
 C2C添加申诉接口
 @param ID 挂卖编号 订单ID
 @param files 文件
 @param text 申诉标题
 @param textarea 申诉内容
 */
+(void)guamai_appeal_add:(NSString*)ID files:(NSString*)files text:(NSString*)text textarea:(NSString*)textarea success:(SuccessData)ReqSuccess failure:(ErrorData)ReqFailure{
    HttpTool *http = [HttpTool sharedManager];
    NSMutableDictionary *parameters = [[NSMutableDictionary alloc]initWithCapacity:1];
    
    if ( !kStringIsEmpty(ID) )
    {
        [parameters setObject:ID forKey:@"id"];
    }
    if ( !kStringIsEmpty(files) )
    {
        [parameters setObject:files forKey:@"files"];
    }
    if ( !kStringIsEmpty(text) )
    {
        [parameters setObject:text forKey:@"text"];
    }
    if ( !kStringIsEmpty(textarea) )
    {
        [parameters setObject:textarea forKey:@"textarea"];
    }
    
    [parameters setObject:@"member.androidapi.guamai_appeal_add" forKey:@"r"];
    
    NSDictionary* dic = [http hanldeSign:parameters];
    
    NSString* strUrl = [http getMainUrl];
    strUrl = [strUrl stringByAppendingPathComponent:@"app/index.php"];
    [http PostRequest:strUrl Parameters:dic success:ReqSuccess failure:ReqFailure];
}
//c2c申诉详情接口
//申诉列表
//ID  申诉ID
+(void)guamai_appeal_list:(NSString*)ID success:(SuccessData)ReqSuccess failure:(ErrorData)ReqFailure
{
    HttpTool *http = [HttpTool sharedManager];
    NSMutableDictionary *parameters = [[NSMutableDictionary alloc]initWithCapacity:1];
    
    if ( !kStringIsEmpty(ID) )
    {
        [parameters setObject:ID forKey:@"id"];
    }
    
    [parameters setObject:@"member.androidapi.guamai_appeal_list" forKey:@"r"];
    
    NSDictionary* dic = [http hanldeSign:parameters];
    
    NSString* strUrl = [http getMainUrl];
    strUrl = [strUrl stringByAppendingPathComponent:@"app/index.php"];
    [http PostRequest:strUrl Parameters:dic success:ReqSuccess failure:ReqFailure];
}
/**
 c2c订单中心全部订单
 
 @param stataus 0未交易 1交易中 2交易完成 3交易失败
 */
+(void)number_order:(NSString*)stataus success:(SuccessData)ReqSuccess failure:(ErrorData)ReqFailure
{
    HttpTool *http = [HttpTool sharedManager];
    NSMutableDictionary *parameters = [[NSMutableDictionary alloc]initWithCapacity:1];
    
    if ( !kStringIsEmpty(stataus) )
    {
        [parameters setObject:stataus forKey:@"status"];
    }
    
    [parameters setObject:@"member.androidapi.number_order" forKey:@"r"];
    
    NSDictionary* dic = [http hanldeSign:parameters];
    
    NSString* strUrl = [http getMainUrl];
    strUrl = [strUrl stringByAppendingPathComponent:@"app/index.php"];
    [http PostRequest:strUrl Parameters:dic success:ReqSuccess failure:ReqFailure];
}
//c2c订单详情确定各种情况
/**
 c2c点击订单详情的各种操作
 @param ID 挂卖编号 订单ID
 @param mobile 用户名 请求接口一时传入
 @param file 凭证 请求接口一时传入
 @param type 用户名 请求接口一时传入 卖出订单 抢单人进入 type = 2
 @param op 标识 0 或者 1
 @param status -1 上传收款信息 其他一样
 */
+(void)sellout:(NSString*)ID mobile:(NSString*)mobile file:(NSString*)file type:(NSString*)type status:(NSString*)status op:(NSString*)op success:(SuccessData)ReqSuccess failure:(ErrorData)ReqFailure{
    HttpTool *http = [HttpTool sharedManager];
    NSMutableDictionary *parameters = [[NSMutableDictionary alloc]initWithCapacity:1];
    
    if ( !kStringIsEmpty(ID) )
    {
        [parameters setObject:ID forKey:@"id"];
    }
    if ( !kStringIsEmpty(mobile) )
    {
        [parameters setObject:mobile forKey:@"mobile"];
    }
    if ( !kStringIsEmpty(file) )
    {
        [parameters setObject:file forKey:@"file"];
    }
    if ( !kStringIsEmpty(type) )
    {
        [parameters setObject:type forKey:@"type"];
    }
    if ( !kStringIsEmpty(status) )
    {
        [parameters setObject:status forKey:@"status"];
    }
    if ( !kStringIsEmpty(op) )
    {
        [parameters setObject:op forKey:@"op"];
    }
    
    [parameters setObject:@"member.androidapi.sellout" forKey:@"r"];
    
    NSDictionary* dic = [http hanldeSign:parameters];
    
    NSString* strUrl = [http getMainUrl];
    strUrl = [strUrl stringByAppendingPathComponent:@"app/index.php"];
    [http PostRequest:strUrl Parameters:dic success:ReqSuccess failure:ReqFailure];
}

//c2c首页点击卖出或者买入按钮
//ID     挂卖编号 订单ID
//type      0买入 1卖出
+(void)sellout:(NSString*)ID type:(NSString*)type success:(SuccessData)ReqSuccess failure:(ErrorData)ReqFailure{
    HttpTool *http = [HttpTool sharedManager];
    NSMutableDictionary *parameters = [[NSMutableDictionary alloc]initWithCapacity:1];
    
    if ( !kStringIsEmpty(ID) )
    {
        [parameters setObject:ID forKey:@"id"];
    }
    if ( !kStringIsEmpty(type) )
    {
        [parameters setObject:type forKey:@"type"];
    }
    
    [parameters setObject:@"member.androidapi.sellout" forKey:@"r"];
    
    NSDictionary* dic = [http hanldeSign:parameters];
    
    NSString* strUrl = [http getMainUrl];
    strUrl = [strUrl stringByAppendingPathComponent:@"app/index.php"];
    [http PostRequest:strUrl Parameters:dic success:ReqSuccess failure:ReqFailure];
}

/**
 c2c点击订单详情的各种操作
 @param ID 挂卖编号 订单ID
 @param type 买入订单 挂卖人进入 type = 1 卖出订单 挂卖人进入 type = 2 请求接口二传入
 @param op 标识 0 或者 1
 */
+(void)selloutyes:(NSString*)ID type:(NSString*)type op:(NSString*)op success:(SuccessData)ReqSuccess failure:(ErrorData)ReqFailure{
    HttpTool *http = [HttpTool sharedManager];
    NSMutableDictionary *parameters = [[NSMutableDictionary alloc]initWithCapacity:1];
    
    if ( !kStringIsEmpty(ID) )
    {
        [parameters setObject:ID forKey:@"id"];
    }
    if ( !kStringIsEmpty(type) )
    {
        [parameters setObject:type forKey:@"type"];
    }
    if ( !kStringIsEmpty(op) )
    {
        [parameters setObject:op forKey:@"op"];
    }
    
    [parameters setObject:@"member.androidapi.selloutyes" forKey:@"r"];
    
    NSDictionary* dic = [http hanldeSign:parameters];
    
    NSString* strUrl = [http getMainUrl];
    strUrl = [strUrl stringByAppendingPathComponent:@"app/index.php"];
    [http PostRequest:strUrl Parameters:dic success:ReqSuccess failure:ReqFailure];
}
//c2c撤销订单
//挂卖编号 订单ID
+(void)sellout_tab_con:(NSString*)ID success:(SuccessData)ReqSuccess failure:(ErrorData)ReqFailure{
    HttpTool *http = [HttpTool sharedManager];
    NSMutableDictionary *parameters = [[NSMutableDictionary alloc]initWithCapacity:1];
    
    if ( !kStringIsEmpty(ID) )
    {
        [parameters setObject:ID forKey:@"id"];
    }
    
    [parameters setObject:@"member.androidapi.sellout_tab_con" forKey:@"r"];
    
    NSDictionary* dic = [http hanldeSign:parameters];

    NSString* strUrl = [http getMainUrl];
    strUrl = [strUrl stringByAppendingPathComponent:@"app/index.php"];
    [http PostRequest:strUrl Parameters:dic success:ReqSuccess failure:ReqFailure];
}
@end
