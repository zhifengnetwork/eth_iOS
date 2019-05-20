//
//  ETHAnnounceModel.h
//  ETH
//
//  Created by weiming zhang on 2019/5/18.
//  Copyright © 2019 admin. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ETHArticleModel : NSObject
@property (nonatomic, copy) NSString *ID;
@property (nonatomic, copy) NSString *article_title;
@property (nonatomic, copy) NSString *resp_img;
@property (nonatomic, copy) NSString *article_rule_credit;
@property (nonatomic, copy) NSString *article_rule_money;
@property (nonatomic, copy) NSString *article_author;
@property (nonatomic, copy) NSString *article_date_v;
@property (nonatomic, copy) NSString *resp_desc;
@property (nonatomic, copy) NSString *article_category;

@end

@interface ETHTitleModel : NSObject
@property (nonatomic, copy) NSString *ID;
@property (nonatomic, copy) NSString *category_name;
@property (nonatomic, copy) NSString *uniacid;
@property (nonatomic, copy) NSString *displayorder;
@property (nonatomic, copy) NSString *isshow;
@end

@interface ETHAnnounceModel : NSObject

@property (nonatomic , copy) NSString              *article_sys;
@property (nonatomic , strong) NSArray              *categorys;
@property (nonatomic , strong) NSArray              *articles;
@property (nonatomic , strong) NSArray              *advs;

@end

NS_ASSUME_NONNULL_END
