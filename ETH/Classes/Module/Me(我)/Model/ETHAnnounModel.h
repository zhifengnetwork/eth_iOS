//
//  ETHAnnounModel.h
//  ETH
//
//  Created by admin on 2019/4/16.
//  Copyright © 2019 admin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseListModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface ArticleModel : NSObject<NSCoding>

@property (nonatomic, copy) NSString *uniacid;
@property (nonatomic, copy) NSString *article_message;
@property (nonatomic, copy) NSString *article_title;
@property (nonatomic, copy) NSString *article_image;
@property (nonatomic, copy) NSString *article_shownum;
@property (nonatomic, copy) NSString *article_keyword;
@property (nonatomic, copy) NSString *article_temp;
@property (nonatomic, copy) NSString *article_source;

@end

@interface CategorysModel : NSObject<NSCoding>

@property (nonatomic, copy) NSString *ID;
@property (nonatomic, copy) NSString *category_name;
@property (nonatomic, copy) NSString *uniacid;
@property (nonatomic, copy) NSString *displayorder;
@property (nonatomic, copy) NSString *isshow;

@end

@interface ArticlesModel : NSObject<NSCoding>

@property (nonatomic, copy) NSString *ID;
@property (nonatomic, copy) NSString *resp_img;
@property (nonatomic, copy) NSString *article_title;
@property (nonatomic, copy) NSString *article_rule_credit;
@property (nonatomic, copy) NSString *article_rule_money;
@property (nonatomic, copy) NSString *article_author;
@property (nonatomic, copy) NSString *article_date_v;
@property (nonatomic, copy) NSString *resp_desc;
@property (nonatomic, copy) NSString *article_category;

@end

//平台公告列表model
@interface ETHAnnounModel : NSObject

@property (nonatomic, strong) ArticleModel *article;
@property (nonatomic, strong) CategorysModel *categorys;
@property (nonatomic, strong) ArticlesModel *articles;

@end

@interface ETHAnnounListModel : BaseListModel


@end

NS_ASSUME_NONNULL_END
