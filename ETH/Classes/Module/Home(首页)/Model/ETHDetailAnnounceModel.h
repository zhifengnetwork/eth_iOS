//
//  ETHDetailAnnounceModel.h
//  ETH
//
//  Created by weiming zhang on 2019/5/20.
//  Copyright © 2019 admin. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ETHDetailAnnounceModel : NSObject
@property (nonatomic, copy)NSString *product_advs_link;
@property (nonatomic, copy)NSString *article_linkurl;
@property (nonatomic, copy)NSString *product_advs_more;
@property (nonatomic, copy)NSString *product_advs_title;
@property (nonatomic, copy)NSString *product_advs_type;
@property (nonatomic, copy)NSString *article_report;
@property (nonatomic, copy)NSString *article_content;
@property (nonatomic, copy)NSString *article_areas;
@property (nonatomic, copy)NSString *article_mp;
@property (nonatomic, copy)NSString *article_date_v;
@property (nonatomic, copy)NSString *article_author;
@property (nonatomic, copy)NSString *article_title;
@end

@interface ETHAnnounceListModel : NSObject
@property (nonatomic, strong)ETHDetailAnnounceModel *article;
@property (nonatomic, strong)NSArray *advs;
@end

NS_ASSUME_NONNULL_END
