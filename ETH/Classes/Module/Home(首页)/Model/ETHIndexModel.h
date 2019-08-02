//
//  ETHIndexModel.h
//  ETH
//
//  Created by apple on 13/04/2019.
//  Copyright © 2019 admin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ETHNoticeModel.h"
#import "ETHADModel.h"


NS_ASSUME_NONNULL_BEGIN

//首页投资model
@interface ETHIndexModel : NSObject

@property (nonatomic , copy) NSString              * touzimoney;
@property (nonatomic , copy) NSString              * shouyimoneysum;
@property (nonatomic , copy) NSString              * shouyimoney;
@property (nonatomic , copy) NSString              * money;
@property (nonatomic , copy) NSString              * xiaji;
@property (nonatomic , copy) NSString              * touziimg;
@property (nonatomic , copy) NSString              * touzititle;
@property (nonatomic , copy) NSString              * shouyisumimg;
@property (nonatomic , copy) NSString              * shouyisumtitle;
@property (nonatomic , copy) NSString              * shouyiimg;
@property (nonatomic , copy) NSString              * shouyititle;
@property (nonatomic , copy) NSString              * moneyimg;
@property (nonatomic , copy) NSString              * moneytitle;
@property (nonatomic , copy) NSString              * jihuoimg;
@property (nonatomic , copy) NSString              * jihuotitle;
@property (nonatomic , copy) NSString              * xiajiimg;
@property (nonatomic , copy) NSString              * xiajititle;


@end



@interface ETHIndexDataModel : NSObject

@property (nonatomic , strong) ETHIndexModel * data;
@property (nonatomic , strong) NSMutableArray * slide;
@property (nonatomic , strong) NSMutableArray * notice;

@end

NS_ASSUME_NONNULL_END
