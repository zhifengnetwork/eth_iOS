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

@end

NS_ASSUME_NONNULL_END
